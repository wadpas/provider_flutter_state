import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter_state/objects/providers/object_provider.dart';

class ProviderIdContainer extends StatelessWidget {
  const ProviderIdContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ObjectProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Object Provider'),
        Row(
          children: [
            const Text('ID: '),
            Text(provider.id),
          ],
        ),
      ],
    );
  }
}
