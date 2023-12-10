import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter_state/breadcrumb/providers/breadcrumb_provider.dart';

class Buttons extends StatelessWidget {
  final void Function() toggleFunction;
  final bool showNewBreadcrumb;

  const Buttons(
      {super.key,
      required this.toggleFunction,
      required this.showNewBreadcrumb});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton.icon(
          icon: showNewBreadcrumb
              ? const Icon(Icons.cancel_outlined)
              : const Icon(Icons.add),
          onPressed: () {
            toggleFunction();
          },
          label: showNewBreadcrumb
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
    );
  }
}
