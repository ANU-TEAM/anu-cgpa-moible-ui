import 'dart:collection';
import 'package:anucgpa/widgets/SemesterCardTile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SemesterListModel extends ChangeNotifier {
  static final List<SemesterCardTile> _semesters = [];

  UnmodifiableListView<SemesterCardTile> get semesters =>
      UnmodifiableListView(_semesters);

  void add(SemesterCardTile year) {
    if (_semesters.length < 5) {
      _semesters.add(year);
      notifyListeners();
    }
  }

  void remove(int index) {
    if (index == _semesters.length - 1) {
      _semesters.removeAt(index);
      notifyListeners();
    }
  }
}
