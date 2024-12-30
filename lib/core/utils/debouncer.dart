import 'dart:async';
import 'package:flutter/material.dart';

class Debouncer {
  final Duration duration;
  Timer? _debounce;

  Debouncer({this.duration = const Duration(milliseconds: 500)});

  void call(VoidCallback callback) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(duration, callback);
  }
}
