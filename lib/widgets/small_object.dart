import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter_state/objects/providers/object_provider.dart';

class SmallObjectWidget extends StatelessWidget {
  const SmallObjectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final smallObject = context.watch<ObjectProvider>().smallObject;

    return Container(
      height: 100,
      color: Colors.yellow,
      child: Column(children: [
        const Text('Cheap Widget'),
        const Text('Last updated'),
        Text(smallObject.lastUpdated)
      ]),
    );
  }
}
