import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter_state/objects/providers/object_provider.dart';

class BigObjectWidget extends StatelessWidget {
  const BigObjectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bigObject = context.select<ObjectProvider, BigObject>(
      (provider) => provider.bigObject,
    );
    return Container(
      height: 100,
      color: Colors.blue,
      child: Column(children: [
        const Text('Expensive Widget'),
        const Text('Last updated'),
        Text(bigObject.lastUpdated)
      ]),
    );
  }
}
