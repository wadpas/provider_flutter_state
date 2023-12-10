import 'package:flutter/material.dart';
import 'package:provider_flutter_state/breadcrumb/widgets/buttons.dart';
import 'package:provider_flutter_state/breadcrumb/widgets/new_breadcrumb.dart';

import 'breadcrumb_text.dart';

class Breadcrumb extends StatefulWidget {
  const Breadcrumb({
    super.key,
  });

  @override
  State<Breadcrumb> createState() => _BreadcrumbState();
}

class _BreadcrumbState extends State<Breadcrumb> {
  bool _showNewBreadcrumb = false;

  void toggleNewBreadcrumb() {
    setState(() {
      _showNewBreadcrumb = !_showNewBreadcrumb;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text('Breadcrumb'),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BreadcrumbText(),
              if (_showNewBreadcrumb)
                NewBreadcrumb(
                  toggleFunction: toggleNewBreadcrumb,
                ),
              Buttons(
                  toggleFunction: toggleNewBreadcrumb,
                  showNewBreadcrumb: _showNewBreadcrumb),
            ],
          ),
        ),
      ],
    );
  }
}
