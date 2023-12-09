import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter_state/breadcrumb/models/breadcrumb_model.dart';
import 'package:provider_flutter_state/breadcrumb/providers/breadcrumb_provider.dart';

class NewBreadcrumbWidget extends StatefulWidget {
  final void Function() toggleFunction;

  const NewBreadcrumbWidget({
    super.key,
    required this.toggleFunction,
  });

  @override
  State<NewBreadcrumbWidget> createState() => _NewBreadcrumbWidgetState();
}

class _NewBreadcrumbWidgetState extends State<NewBreadcrumbWidget> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: const InputDecoration(
            label: Text("New Breadcrumb"),
          ),
        ),
        TextButton.icon(
          icon: const Icon(Icons.save_outlined),
          onPressed: () {
            final text = _controller.text;
            if (text.isNotEmpty) {
              final breadcrumb = Breadcrumb(
                isActive: false,
                name: text,
              );
              context.read<BreadcrumbProvider>().add(breadcrumb);
              widget.toggleFunction();
            }
          },
          label: const Text('Save'),
        ),
      ],
    );
  }
}
