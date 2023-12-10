import 'package:flutter/material.dart';
import 'package:provider_flutter_state/breadcrumb/widgets/buttons.dart';
import 'package:provider_flutter_state/breadcrumb/widgets/new_breadcrumb.dart';

import 'breadcrumb_text.dart';

class BreadcrumbWidget extends StatefulWidget {
  const BreadcrumbWidget({
    super.key,
  });

  @override
  State<BreadcrumbWidget> createState() => _BreadcrumbWidgetState();
}

class _BreadcrumbWidgetState extends State<BreadcrumbWidget> {
  bool _showNewBreadcrumbWidget = false;

  void toggleNewBreadcrumb() {
    setState(() {
      _showNewBreadcrumbWidget = !_showNewBreadcrumbWidget;
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
              if (_showNewBreadcrumbWidget)
                NewBreadcrumbWidget(
                  toggleFunction: toggleNewBreadcrumb,
                ),
              Buttons(
                  toggleFunction: toggleNewBreadcrumb,
                  showNewBreadcrumbWidget: _showNewBreadcrumbWidget),
            ],
          ),
        ),
      ],
    );
  }
}
