import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter_state/breadcrumb/widgets/breadcrumb.dart';
import 'package:provider_flutter_state/breadcrumb/providers/breadcrumb_provider.dart';
import 'package:provider_flutter_state/objects/providers/object_provider.dart';
import 'package:provider_flutter_state/widgets/objects.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<BreadcrumbProvider>(
          create: (_) => BreadcrumbProvider(),
        ),
        ChangeNotifierProvider<ObjectProvider>(
          create: (_) => ObjectProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Provider',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.tealAccent,
          ),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Provider'),
          ),
          body: const SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Breadcrumb(),
                  Objects(),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
