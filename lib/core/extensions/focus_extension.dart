import 'package:flutter/widgets.dart';

extension FocusExtension on BuildContext {
  void unfocus() {
    FocusScope.of(this).unfocus();
  }
}
