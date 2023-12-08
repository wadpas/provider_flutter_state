import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter_state/objects/providers/object_provider.dart';

class ObjectProvideryIdWidget extends StatelessWidget {
  const ObjectProvideryIdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ObjectProvider>();
    return Container(
      height: 100,
      color: Colors.purple,
      child: Column(children: [
        const Text('Object Provider Widget'),
        const Text('ID'),
        Text(provider.id)
      ]),
    );
  }
}
