import 'package:flutter/material.dart';
import 'package:visualtest/config/texts.dart';

class ThemeConfig {
  ThemeConfig._();

  static ThemeData appTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
  );

  static AppBar mainAppBar = AppBar(
      title: const Text(Strings.APP_NAME), centerTitle: true, elevation: 1);
}

AppBar routedAppBar(String routeName) =>
    AppBar(title: Text(routeName), centerTitle: true, elevation: 1);
