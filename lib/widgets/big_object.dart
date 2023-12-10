import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter_state/objects/providers/object_provider.dart';

class BigObjectContainer extends StatelessWidget {
  const BigObjectContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final bigObject = context.select<ObjectProvider, BigObject>(
      (provider) => provider.bigObject,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Big Object',
          textAlign: TextAlign.left,
        ),
        Row(
          children: [
            const Text('Last updated: '),
            Text(
              bigObject.lastUpdated,
            ),
          ],
        ),
      ],
    );
  }
}
