import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sizer/sizer.dart';

import 'config/routes.dart';
import 'config/texts.dart';
import 'config/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => Sizer(
      builder: (_, __, ___) => GetMaterialApp(
            getPages: appPages,
            initialRoute: AppRoutes.ROUTE_HOME,
            theme: ThemeConfig.appTheme,
            title: Strings.APP_NAME,
          ));
}
