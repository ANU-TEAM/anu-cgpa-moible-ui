import 'dart:collection';
import 'package:anucgpa/widgets/YearCard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class YearsListModel extends ChangeNotifier {
  static final List<YearCard> _years = [];

  UnmodifiableListView<YearCard> get years => UnmodifiableListView(_years);

  void add(YearCard year) {
    if (_years.length < 5) {
      _years.add(year);
      notifyListeners();
    }
  }

  void remove(int index) {
    if (index == _years.length - 1) {
      _years.removeAt(index);
      notifyListeners();
    }
  }
}
