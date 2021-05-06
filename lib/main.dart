import 'package:flutter/material.dart';
import 'package:flutter_dojo/app/app.dart';
import 'package:flutter_dojo/common/injected/module.dart';

Future<void> main() async {
  await configureInjection();
  runApp(MyApp());
}
