import 'dart:collection';

import 'package:anucgpa/components/YearCard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class YearsListModel extends ChangeNotifier {
  final List<YearCard> _years = [];

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
