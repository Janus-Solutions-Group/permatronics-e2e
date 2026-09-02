import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:manlift_app/data/models/operator_model.dart';
import 'package:manlift_app/firebase_options.dart';

enum AddOperatorStatus {
  success,
  emailAlreadyInUse,
  weakPassword,
  invalidEmail,
  networkError,
  unknown,
}

class AddOperatorResult {
  AddOperatorResult(this.status, {this.uid, this.message});

  final AddOperatorStatus status;
  final String? uid;
  final String? message;

  bool get isSuccess => status == AddOperatorStatus.success;

  String get userMessage {
    switch (status) {
      case AddOperatorStatus.success:
        return 'Account added. They will receive an email to set their '
            'password — remind them to check their spam/junk folder if it '
            "doesn't show up in a few minutes.";
      case AddOperatorStatus.emailAlreadyInUse:
        return 'An account with this email already exists.';
      case AddOperatorStatus.weakPassword:
        return 'Could not create the account. Please try again.';
      case AddOperatorStatus.invalidEmail:
        return 'Please enter a valid email address.';
      case AddOperatorStatus.networkError:
        return 'Network error. Please check your connection and try again.';
      case AddOperatorStatus.unknown:
        return 'Something went wrong. Please try again.';
    }
  }
}

class OperatorService {
  final _firestore = FirebaseFirestore.instance;

  // Collection name intentionally left as 'employees' — it predates the
  // Operator rename and already holds live accounts (admins + operators).
  // Renaming the path would orphan those existing Firestore docs.
  CollectionReference<Map<String, dynamic>> get _col =>
      _firestore.collection('employees');

  Future<OperatorModel?> getProfile(String uid) async {
    final doc = await _col.doc(uid).get();
    if (!doc.exists) return null;
    return OperatorModel.fromMap(doc.id, doc.data()!);
  }

  Future<void> upsertProfile(OperatorModel model, {bool isCreate = false}) {
    return _col
        .doc(model.uid)
        .set(model.toMap(isCreate: isCreate), SetOptions(merge: true));
  }

  Stream<List<OperatorModel>> watchOperators() => _watchByRole('operator');

  Stream<List<OperatorModel>> watchAdmins() => _watchByRole('admin');

  Stream<List<OperatorModel>> _watchByRole(String role) {
    return _col.where('role', isEqualTo: role).snapshots().map((snap) {
      final list =
          snap.docs.map((d) => OperatorModel.fromMap(d.id, d.data())).toList();
      list.sort((a, b) =>
          (b.createdAt ?? DateTime(0)).compareTo(a.createdAt ?? DateTime(0)));
      return list;
    });
  }

  Future<void> approveOperator(String uid) {
    return _col.doc(uid).update({
      'status': OperatorStatus.approved.name,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> updateOperatorName(String uid, String name) {
    return _col.doc(uid).update({
      'name': name,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> deleteOperator(String uid) {
    return _col.doc(uid).delete();
  }

  /// Creates the Firebase Auth account for a new operator via a secondary,
  /// throwaway [FirebaseApp] instance so the calling admin's own session is
  /// left untouched, marks them approved immediately, and emails them a
  /// "set your password" link from the primary Auth instance.
  Future<AddOperatorResult> addOperatorWithAutoProvision({
    required String name,
    required String email,
  }) {
    return _provisionAccount(
        name: name, email: email, role: OperatorRole.operator);
  }

  /// Same auto-provision flow as [addOperatorWithAutoProvision], but grants
  /// the new account admin privileges immediately.
  Future<AddOperatorResult> addAdminWithAutoProvision({
    required String name,
    required String email,
  }) {
    return _provisionAccount(
        name: name, email: email, role: OperatorRole.admin);
  }

  Future<AddOperatorResult> _provisionAccount({
    required String name,
    required String email,
    required OperatorRole role,
  }) async {
    final normalizedEmail = email.trim().toLowerCase();
    final secondaryAppName =
        'adminProvisioning-${DateTime.now().microsecondsSinceEpoch}';
    FirebaseApp? secondaryApp;
    try {
      secondaryApp = await Firebase.initializeApp(
        name: secondaryAppName,
        options: DefaultFirebaseOptions.currentPlatform,
      );
      final secondaryAuth = FirebaseAuth.instanceFor(app: secondaryApp);

      final credential = await secondaryAuth.createUserWithEmailAndPassword(
        email: normalizedEmail,
        password: _generateTempPassword(),
      );
      final uid = credential.user!.uid;
      await credential.user!.updateDisplayName(name);

      // Written via the primary (already admin-authenticated) Firestore
      // instance, not the secondary app, so this is permitted by the
      // isAdmin() branch of the security rules regardless of the new
      // account's own role.
      await upsertProfile(
        OperatorModel(
          uid: uid,
          name: name,
          email: normalizedEmail,
          role: role,
          status: OperatorStatus.approved,
          addedByAdmin: true,
        ),
        isCreate: true,
      );

      await secondaryAuth.signOut();
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: normalizedEmail);

      return AddOperatorResult(AddOperatorStatus.success, uid: uid);
    } on FirebaseAuthException catch (e) {
      return AddOperatorResult(_mapAuthError(e.code), message: e.message);
    } catch (_) {
      return AddOperatorResult(AddOperatorStatus.unknown);
    } finally {
      if (secondaryApp != null) {
        await secondaryApp.delete();
      }
    }
  }

  AddOperatorStatus _mapAuthError(String code) {
    switch (code) {
      case 'email-already-in-use':
        return AddOperatorStatus.emailAlreadyInUse;
      case 'weak-password':
        return AddOperatorStatus.weakPassword;
      case 'invalid-email':
        return AddOperatorStatus.invalidEmail;
      case 'network-request-failed':
        return AddOperatorStatus.networkError;
      default:
        return AddOperatorStatus.unknown;
    }
  }

  String _generateTempPassword() {
    const chars =
        'ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz23456789!@#%';
    final rand = Random.secure();
    return List.generate(24, (_) => chars[rand.nextInt(chars.length)]).join();
  }
}
