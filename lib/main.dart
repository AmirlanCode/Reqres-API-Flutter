import 'package:flutter/material.dart';
import 'package:testing/app.dart';
import 'package:testing/di/injector.dart' as di;

void main() {
  di.init();
  runApp(const App());
}
