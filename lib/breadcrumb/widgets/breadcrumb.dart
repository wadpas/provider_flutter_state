import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter_state/breadcrumb/providers/breadcrumb_provider.dart';
import 'package:provider_flutter_state/breadcrumb/widgets/new_breadcrumb.dart';

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
              Consumer<BreadcrumbProvider>(
                builder: (context, value, child) {
                  return Wrap(
                    children: value.crumbs.map(
                      (crumb) {
                        return Text(
                          crumb.title,
                          style: TextStyle(
                            color: crumb.isActive
                                ? Colors.blueAccent
                                : Colors.black,
                          ),
                        );
                      },
                    ).toList(),
                  );
                },
              ),
              if (_showNewBreadcrumbWidget)
                NewBreadcrumbWidget(
                  toggleFunction: toggleNewBreadcrumb,
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    icon: _showNewBreadcrumbWidget
                        ? const Icon(Icons.cancel_outlined)
                        : const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        toggleNewBreadcrumb();
                      });
                    },
                    label: _showNewBreadcrumbWidget
                        ? const Text('Cancel')
                        : const Text('Add element'),
                  ),
                  TextButton.icon(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () {
                      context.read<BreadcrumbProvider>().reset();
                    },
                    label: const Text('Reset'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
