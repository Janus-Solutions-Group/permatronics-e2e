import 'package:cloud_firestore/cloud_firestore.dart';

enum OperatorRole { admin, operator }

enum OperatorStatus { pending, approved }

OperatorRole operatorRoleFromString(String? value) {
  return value == 'admin' ? OperatorRole.admin : OperatorRole.operator;
}

OperatorStatus operatorStatusFromString(String? value) {
  return value == 'approved' ? OperatorStatus.approved : OperatorStatus.pending;
}

class OperatorModel {
  OperatorModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.role,
    required this.status,
    this.addedByAdmin = false,
    this.createdAt,
    this.updatedAt,
  });

  final String uid;
  final String name;
  final String email;
  final OperatorRole role;
  final OperatorStatus status;
  final bool addedByAdmin;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory OperatorModel.fromMap(String uid, Map<String, dynamic> map) {
    return OperatorModel(
      uid: uid,
      name: map['name'] as String? ?? '',
      email: map['email'] as String? ?? '',
      role: operatorRoleFromString(map['role'] as String?),
      status: operatorStatusFromString(map['status'] as String?),
      addedByAdmin: map['addedByAdmin'] as bool? ?? false,
      createdAt: (map['createdAt'] as Timestamp?)?.toDate(),
      updatedAt: (map['updatedAt'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toMap({bool isCreate = false}) {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'role': role.name,
      'status': status.name,
      'addedByAdmin': addedByAdmin,
      if (isCreate) 'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }
}
