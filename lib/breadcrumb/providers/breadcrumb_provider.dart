import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider_flutter_state/breadcrumb/models/breadcrumb_model.dart';

class BreadcrumbProvider extends ChangeNotifier {
  final List<Breadcrumb> _crumbs = [
    Breadcrumb(isActive: false, name: 'Home'),
  ];
  UnmodifiableListView<Breadcrumb> get crumbs => UnmodifiableListView(_crumbs);

  void add(Breadcrumb breadcrumb) {
    for (final crumb in _crumbs) {
      crumb.activate();
    }
    _crumbs.add(breadcrumb);
    notifyListeners();
  }

  void reset() {
    _crumbs.clear();
    _crumbs.add(
      Breadcrumb(isActive: false, name: 'Home'),
    );
    notifyListeners();
  }
}
