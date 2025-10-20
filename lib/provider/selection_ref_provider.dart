import 'package:flutter/material.dart';

class SelectionRefProvider with ChangeNotifier {
  List<Map<String, String?>> selectionsRef = [];

  void updateSelection(String id, String? title, String? value) {
    final index = selectionsRef.indexWhere((element) => element['id'] == id);
    if (index >= 0) {
      selectionsRef[index]['value'] = value;
    } else {
      selectionsRef.add({'id': id, 'title': title, 'value': value});
    }
    // notifyListeners();
  }
}
