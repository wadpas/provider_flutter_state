import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider_flutter_state/models/breadcrumb.dart';

class BreadcrumbWidget extends StatelessWidget {
  final UnmodifiableListView<Breadcrumb> breadcrumb;
  const BreadcrumbWidget({super.key, required this.breadcrumb});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: breadcrumb.map((breadcrumb) {
        return Text(
          breadcrumb.title,
          style: TextStyle(
            color: breadcrumb.isActive ? Colors.blueAccent : Colors.black,
          ),
        );
      }).toList(),
    );
  }
}
