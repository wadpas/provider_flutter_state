import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter_state/home.dart';
import 'package:provider_flutter_state/breadcrumb/providers/breadcrumb_provider.dart';
import 'package:provider_flutter_state/objects/providers/object_provider.dart';

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
        title: 'Flutter Provider',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.tealAccent,
          ),
        ),
        home: const HomePage(),
      ),
    ),
  );
}
