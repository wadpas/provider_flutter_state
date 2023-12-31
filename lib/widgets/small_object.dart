import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter_state/objects/providers/object_provider.dart';

class SmallObjectContainer extends StatelessWidget {
  const SmallObjectContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final smallObject = context.watch<ObjectProvider>().smallObject;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Small Widget'),
        Row(
          children: [
            const Text('Last updated: '),
            Text(smallObject.lastUpdated),
          ],
        ),
      ],
    );
  }
}
