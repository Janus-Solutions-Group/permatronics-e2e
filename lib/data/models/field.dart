import 'dart:convert';

import 'package:flutter/foundation.dart';

class Field {
  final String id;
  final String title;
  final List<String> values;
  Field({
    required this.id,
    required this.title,
    required this.values,
  });

  Field copyWith({
    String? id,
    String? title,
    List<String>? values,
  }) {
    return Field(
      id: id ?? this.id,
      title: title ?? this.title,
      values: values ?? this.values,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'values': values,
    };
  }

  factory Field.fromMap(Map<String, dynamic> map) {
    return Field(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      values: List<String>.from(map['values']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Field.fromJson(String source) => Field.fromMap(json.decode(source));

  @override
  String toString() => 'Field(id: $id, title: $title, values: $values)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Field &&
        other.id == id &&
        other.title == title &&
        listEquals(other.values, values);
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ values.hashCode;
}
