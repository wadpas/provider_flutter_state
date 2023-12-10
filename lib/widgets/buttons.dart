import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter_state/objects/providers/object_provider.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton.icon(
          icon: const Icon(Icons.play_arrow),
          onPressed: () {
            context.read<ObjectProvider>().start();
          },
          label: const Text('Start'),
        ),
        TextButton.icon(
          icon: const Icon(Icons.stop_circle),
          onPressed: () {
            context.read<ObjectProvider>().stop();
          },
          label: const Text('Stop'),
        )
      ],
    );
  }
}
