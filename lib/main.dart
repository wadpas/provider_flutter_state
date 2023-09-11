import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter_state/pages/home.dart';
import 'package:provider_flutter_state/pages/new.dart';
import 'package:provider_flutter_state/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => BreadCrumbProvider(),
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
          '/newBreadCrumb': (context) => const NewBreadCrumbPage(),
        },
      ),
    ),
  );
}
