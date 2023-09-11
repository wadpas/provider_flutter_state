import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider_flutter_state/model.dart';

class BreadCrumbWidget extends StatelessWidget {
  final UnmodifiableListView<BreadCrumb> breadCrumb;
  const BreadCrumbWidget({super.key, required this.breadCrumb});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: breadCrumb.map((breadCrumb) {
        return Text(
          breadCrumb.title,
          style: TextStyle(
            color: breadCrumb.isActive ? Colors.blueAccent : Colors.black,
          ),
        );
      }).toList(),
    );
  }
}
