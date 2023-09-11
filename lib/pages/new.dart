import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter_state/model.dart';
import 'package:provider_flutter_state/provider.dart';

class NewBreadCrumbPage extends StatefulWidget {
  const NewBreadCrumbPage({super.key});

  @override
  State<NewBreadCrumbPage> createState() => _NewBreadCrumbPageState();
}

class _NewBreadCrumbPageState extends State<NewBreadCrumbPage> {
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
                final breadCrumb = BreadCrumb(
                  isActive: false,
                  name: text,
                );
                context.read<BreadCrumbProvider>().add(breadCrumb);
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
