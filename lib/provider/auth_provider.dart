import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:manlift_app/data/models/operator_model.dart';
import 'package:manlift_app/services/operator_service.dart';

enum AuthStatus {
  unauthenticated,
  loadingProfile,
  authenticated,
  pendingApproval,
}

enum AuthOpStatus {
  success,
  invalidCredentials,
  emailAlreadyInUse,
  weakPassword,
  invalidEmail,
  networkError,
  unknown,
}

class AuthOpResult {
  AuthOpResult(this.status, {this.message});

  final AuthOpStatus status;
  final String? message;

  bool get isSuccess => status == AuthOpStatus.success;

  String get userMessage {
    switch (status) {
      case AuthOpStatus.success:
        return '';
      case AuthOpStatus.invalidCredentials:
        return 'Incorrect email or password.';
      case AuthOpStatus.emailAlreadyInUse:
        return 'An account with this email already exists.';
      case AuthOpStatus.weakPassword:
        return 'Password must be at least 6 characters.';
      case AuthOpStatus.invalidEmail:
        return 'Please enter a valid email address.';
      case AuthOpStatus.networkError:
        return 'Network error. Please check your connection and try again.';
      case AuthOpStatus.unknown:
        return 'Something went wrong. Please try again.';
    }
  }
}

/// Hardcoded, self-healing admin allowlist: whenever the app sees a signed-in
/// Firebase Auth user whose email is in this set, their operator profile is
/// (re)written as an approved admin, with no manual Firestore seeding.
const Set<String> _adminEmails = {
  'sarah.cash@permatronic.com',
  'lucinda.allen@permatronic.com',
  'akaul5@janussolutionsgroup.com'
};

class AuthProvider extends ChangeNotifier {
  AuthProvider() {
    _authSub =
        FirebaseAuth.instance.authStateChanges().listen(_onAuthStateChanged);
  }

  final OperatorService _operatorService = OperatorService();
  StreamSubscription<User?>? _authSub;

  AuthStatus status = AuthStatus.unauthenticated;
  OperatorModel? profile;

  bool get isAdmin => profile?.role == OperatorRole.admin;

  Future<void> _onAuthStateChanged(User? user) async {
    if (user == null) {
      profile = null;
      status = AuthStatus.unauthenticated;
      notifyListeners();
      return;
    }
    status = AuthStatus.loadingProfile;
    notifyListeners();
    await _loadOrCreateProfile(user);
  }

  Future<void> _loadOrCreateProfile(User user) async {
    final email = (user.email ?? '').toLowerCase();

    if (_adminEmails.contains(email)) {
      await _operatorService.upsertProfile(
        OperatorModel(
          uid: user.uid,
          name: user.displayName?.isNotEmpty == true
              ? user.displayName!
              : email.split('@').first,
          email: email,
          role: OperatorRole.admin,
          status: OperatorStatus.approved,
        ),
        isCreate: true,
      );
    }

    profile = await _operatorService.getProfile(user.uid);

    if (profile == null || profile!.status == OperatorStatus.pending) {
      status = AuthStatus.pendingApproval;
    } else {
      status = AuthStatus.authenticated;
    }
    notifyListeners();
  }

  /// Re-checks the current user's profile without requiring a re-login —
  /// used by [PendingApprovalPage]'s "Check again" button.
  Future<void> refreshProfile() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) await _loadOrCreateProfile(user);
  }

  Future<AuthOpResult> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      return AuthOpResult(AuthOpStatus.success);
    } on FirebaseAuthException catch (e) {
      return AuthOpResult(_mapError(e.code), message: e.message);
    } catch (_) {
      return AuthOpResult(AuthOpStatus.unknown);
    }
  }

  Future<AuthOpResult> signUp(
      String name, String email, String password) async {
    try {
      final normalizedEmail = email.trim().toLowerCase();
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: normalizedEmail,
        password: password,
      );
      final user = credential.user!;
      await user.updateDisplayName(name);

      final isAdminEmail = _adminEmails.contains(normalizedEmail);
      await _operatorService.upsertProfile(
        OperatorModel(
          uid: user.uid,
          name: name,
          email: normalizedEmail,
          role: isAdminEmail ? OperatorRole.admin : OperatorRole.operator,
          status:
              isAdminEmail ? OperatorStatus.approved : OperatorStatus.pending,
        ),
        isCreate: true,
      );

      return AuthOpResult(AuthOpStatus.success);
    } on FirebaseAuthException catch (e) {
      return AuthOpResult(_mapError(e.code), message: e.message);
    } catch (_) {
      return AuthOpResult(AuthOpStatus.unknown);
    }
  }

  Future<AuthOpResult> sendPasswordReset(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());
      return AuthOpResult(AuthOpStatus.success);
    } on FirebaseAuthException catch (e) {
      return AuthOpResult(_mapError(e.code), message: e.message);
    } catch (_) {
      return AuthOpResult(AuthOpStatus.unknown);
    }
  }

  Future<void> signOut() => FirebaseAuth.instance.signOut();

  AuthOpStatus _mapError(String code) {
    switch (code) {
      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential':
        return AuthOpStatus.invalidCredentials;
      case 'email-already-in-use':
        return AuthOpStatus.emailAlreadyInUse;
      case 'weak-password':
        return AuthOpStatus.weakPassword;
      case 'invalid-email':
        return AuthOpStatus.invalidEmail;
      case 'network-request-failed':
        return AuthOpStatus.networkError;
      default:
        return AuthOpStatus.unknown;
    }
  }

  @override
  void dispose() {
    _authSub?.cancel();
    super.dispose();
  }
}
