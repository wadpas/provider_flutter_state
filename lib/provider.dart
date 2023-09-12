import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider_flutter_state/models/breadcrumb.dart';

class BreadcrumbProvider extends ChangeNotifier {
  final List<Breadcrumb> _items = [];
  UnmodifiableListView<Breadcrumb> get items => UnmodifiableListView(_items);

  void add(Breadcrumb breadcrumb) {
    for (final item in _items) {
      item.activate();
    }
    _items.add(breadcrumb);
    notifyListeners();
  }

  void reset() {
    _items.clear();
    notifyListeners();
  }
}
