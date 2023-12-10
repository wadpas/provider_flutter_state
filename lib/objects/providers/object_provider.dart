import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider_flutter_state/objects/models/base_object_model.dart';
import 'package:uuid/uuid.dart';

@immutable
class BigObject extends BaseObject {}

@immutable
class SmallObject extends BaseObject {}

class ObjectProvider extends ChangeNotifier {
  late String id;
  late SmallObject _smallObject;
  late BigObject _bigObject;
  late StreamSubscription _smallObjectStreamSub;
  late StreamSubscription _bigObjectStreamSub;

  SmallObject get smallObject => _smallObject;
  BigObject get bigObject => _bigObject;

  ObjectProvider()
      : id = const Uuid().v4(),
        _smallObject = SmallObject(),
        _bigObject = BigObject();

  @override
  void notifyListeners() {
    id = const Uuid().v4();
    super.notifyListeners();
  }

  void start() {
    _smallObjectStreamSub = Stream.periodic(
      const Duration(milliseconds: 50),
    ).listen((_) {
      _smallObject = SmallObject();
      notifyListeners();
    });
    _bigObjectStreamSub = Stream.periodic(
      const Duration(milliseconds: 500),
    ).listen((_) {
      _bigObject = BigObject();
      notifyListeners();
    });
  }

  void stop() {
    _smallObjectStreamSub.cancel();
    _bigObjectStreamSub.cancel();
  }
}
