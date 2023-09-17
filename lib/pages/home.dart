import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter_state/providers/breadcrumb_provider.dart';
import 'package:provider_flutter_state/providers/object_provider.dart';
import 'package:provider_flutter_state/widgets/breadcrumb.dart';
import 'package:provider_flutter_state/widgets/cheap_widget.dart';
import 'package:provider_flutter_state/widgets/expensive_widget.dart';
import 'package:provider_flutter_state/widgets/object_provider_widget.dart';

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
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/newBreadcrumb');
              },
              child: const Text('New Breadcrumb'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<BreadcrumbProvider>().reset();
              },
              child: const Text('Reset Breadcrumb'),
            ),
            const CheapWidget(),
            const ExpensiveWidget(),
            const ObjectProvideryWidget(),
            ElevatedButton(
              onPressed: () {
                context.read<ObjectProvider>().start();
              },
              child: const Text('Start'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<ObjectProvider>().stop();
              },
              child: const Text('Stop'),
            )
          ],
        ),
      ),
    );
  }
}
