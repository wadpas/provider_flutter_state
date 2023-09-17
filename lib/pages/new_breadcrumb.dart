import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter_state/models/breadcrumb.dart';
import 'package:provider_flutter_state/providers/breadcrumb_provider.dart';

class NewBreadcrumbPage extends StatefulWidget {
  const NewBreadcrumbPage({super.key});

  @override
  State<NewBreadcrumbPage> createState() => _NewBreadcrumbPageState();
}

class _NewBreadcrumbPageState extends State<NewBreadcrumbPage> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('New readcrumb'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: "Enter a new Breadcrumb",
            ),
          ),
          TextButton(
            onPressed: () {
              final text = _controller.text;
              if (text.isNotEmpty) {
                final breadcrumb = Breadcrumb(
                  isActive: false,
                  name: text,
                );
                context.read<BreadcrumbProvider>().add(breadcrumb);
                Navigator.of(context).pop();
              }
            },
            child: const Text('Add Breadcrumb'),
          ),
        ],
      ),
    );
  }
}
