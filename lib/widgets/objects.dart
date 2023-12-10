import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter_state/objects/providers/object_provider.dart';
import 'package:provider_flutter_state/widgets/big_object.dart';
import 'package:provider_flutter_state/widgets/buttons.dart';
import 'package:provider_flutter_state/widgets/provider_id.dart';
import 'package:provider_flutter_state/widgets/small_object.dart';

class Objects extends StatelessWidget {
  const Objects({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text('Objects'),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProviderIdContainer(),
              SizedBox(height: 8),
              SmallObjectContainer(),
              SizedBox(height: 8),
              BigObjectContainer(),
              SizedBox(height: 8),
              Buttons()
            ],
          ),
        ),
      ],
    );
  }
}
