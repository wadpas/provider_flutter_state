import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter_state/providers/object_provider.dart';

class CheapWidget extends StatelessWidget {
  const CheapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cheapObject = context.select<ObjectProvider, CheapObject>(
      (provider) => provider.cheapObject,
    );
    return Container(
      height: 100,
      color: Colors.blue,
      child: Column(children: [
        const Text('Cheap Widget'),
        const Text('Last updated'),
        Text(cheapObject.lastUpdated)
      ]),
    );
  }
}
