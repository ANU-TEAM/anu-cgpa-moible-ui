import 'dart:collection';

import 'package:anucgpa/components/YearCard.dart';
import 'package:flutter/foundation.dart';

class YearsListModel extends ChangeNotifier {
  final List<YearCard> _years = [];

  UnmodifiableListView<YearCard> get years => UnmodifiableListView(_years);

  int get numberOfYears => _years.length;

  void add(YearCard year) {
    _years.add(year);
    notifyListeners();
  }

  void remove(int index) {
    _years.removeAt(index);
    notifyListeners();
  }
}
