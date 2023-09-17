import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter_state/pages/home.dart';
import 'package:provider_flutter_state/pages/new_breadcrumb.dart';
import 'package:provider_flutter_state/providers/breadcrumb_provider.dart';
import 'package:provider_flutter_state/providers/object_provider.dart';

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
        routes: {
          '/newBreadcrumb': (context) => const NewBreadcrumbPage(),
        },
      ),
    ),
  );
}
