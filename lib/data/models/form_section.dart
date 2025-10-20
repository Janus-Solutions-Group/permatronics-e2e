import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:manlift_app/data/models/field.dart';

class FormSection {
  final String id;
  final String title;
  final List<Field> fields;
  FormSection({
    required this.id,
    required this.title,
    required this.fields,
  });

  FormSection copyWith({
    String? id,
    String? title,
    List<Field>? fields,
  }) {
    return FormSection(
      id: id ?? this.id,
      title: title ?? this.title,
      fields: fields ?? this.fields,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'fields': fields.map((x) => x.toMap()).toList(),
    };
  }

  factory FormSection.fromMap(Map<String, dynamic> map) {
    return FormSection(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      fields: List<Field>.from(map['fields']?.map((x) => Field.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory FormSection.fromJson(String source) =>
      FormSection.fromMap(json.decode(source));

  @override
  String toString() => 'FormSection(id: $id, title: $title, fields: $fields)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FormSection &&
        other.id == id &&
        other.title == title &&
        listEquals(other.fields, fields);
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ fields.hashCode;
}
