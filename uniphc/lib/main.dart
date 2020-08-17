import 'package:flutter/material.dart';
import 'package:uniphc/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app/shared/orientation/orientation.dart';

void main() {
  runApp(ModularApp(module: AppModule()));
  portraitModeOnly();
}
