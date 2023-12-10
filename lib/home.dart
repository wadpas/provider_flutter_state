import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter_state/objects/providers/object_provider.dart';
import 'package:provider_flutter_state/breadcrumb/widgets/breadcrumb.dart';
import 'package:provider_flutter_state/widgets/small_object.dart';
import 'package:provider_flutter_state/widgets/big_object.dart';
import 'package:provider_flutter_state/widgets/object_provider_id.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider State'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const BreadcrumbWidget(),
              const SmallObjectWidget(),
              const BigObjectWidget(),
              const ObjectProvideryIdWidget(),
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
      ),
    );
  }
}
