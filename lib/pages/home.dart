import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter_state/provider.dart';
import 'package:provider_flutter_state/widgets/breadcrumb.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<BreadcrumbProvider>(
              builder: (context, value, child) {
                return BreadcrumbWidget(breadcrumb: value.items);
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/newBreadcrumb');
              },
              child: const Text('New Breadcrumb'),
            ),
            TextButton(
              onPressed: () {
                context.read<BreadcrumbProvider>().reset();
              },
              child: const Text('Reset Breadcrumb'),
            ),
          ],
        ),
      ),
    );
  }
}
