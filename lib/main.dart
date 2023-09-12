import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter_state/models/base_object.dart';
import 'package:provider_flutter_state/pages/home.dart';
import 'package:provider_flutter_state/pages/new_breadcrumb.dart';
import 'package:provider_flutter_state/provider.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => BreadcrumbProvider(),
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

@immutable
class ExpensiveObject extends BaseObject {}

@immutable
class CheapObject extends BaseObject {}

class ObjectProvider extends ChangeNotifier {
  late String id;
  late CheapObject _cheapObject;
  late StreamSubscription _cheapObjectStreamSub;
  late ExpensiveObject _expensiveObject;
  late StreamSubscription _expensiveObjectStreamSub;

  CheapObject get cheapObject => _cheapObject;
  ExpensiveObject get expensiveObject => _expensiveObject;

  ObjectProvider()
      : id = const Uuid().v4(),
        _cheapObject = CheapObject(),
        _expensiveObject = ExpensiveObject();

  @override
  void notifyListeners() {
    id = const Uuid().v4();
    super.notifyListeners();
  }

  void start() {
    _cheapObjectStreamSub =
        Stream.periodic(const Duration(seconds: 1)).listen((_) {
      _cheapObject = CheapObject();
      notifyListeners();
    });
    _expensiveObjectStreamSub =
        Stream.periodic(const Duration(seconds: 5)).listen((_) {
      _expensiveObject = ExpensiveObject();
      notifyListeners();
    });
  }

  void stop() {
    _cheapObjectStreamSub.cancel();
    _expensiveObjectStreamSub.cancel();
  }
}
