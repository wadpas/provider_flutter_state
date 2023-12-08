import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider_flutter_state/breadcrumb/models/breadcrumb_model.dart';

class BreadcrumbWidget extends StatelessWidget {
  final UnmodifiableListView<Breadcrumb> breadcrumb;
  const BreadcrumbWidget({
    super.key,
    required this.breadcrumb,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: breadcrumb.map(
        (crumb) {
          return Text(
            crumb.title,
            style: TextStyle(
              color: crumb.isActive ? Colors.blueAccent : Colors.black,
            ),
          );
        },
      ).toList(),
    );
  }
}
