import 'package:flutter/material.dart';

class CountNotifier extends ValueNotifier<int> {
  CountNotifier(super.value);
  void increment() {
    value++;
    notifyListeners();
  }

  void decrement() {
    value--;
    notifyListeners();
  }
}
