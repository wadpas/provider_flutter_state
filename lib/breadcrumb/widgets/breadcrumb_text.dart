import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter_state/breadcrumb/providers/breadcrumb_provider.dart';

class BreadcrumbText extends StatelessWidget {
  const BreadcrumbText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BreadcrumbProvider>(
      builder: (context, value, child) {
        return Wrap(
          children: value.crumbs.map(
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
      },
    );
  }
}
