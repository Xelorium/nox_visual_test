import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:visualtest/config/routes.dart';
import 'package:visualtest/config/texts.dart';
import 'package:visualtest/config/theme.dart';
import 'package:visualtest/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Column(
            children: [
              const Text(Strings.HELLO_WORLD),
              SizedBox(height: 4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () =>
                              Get.toNamed(AppRoutes.ROUTE_TEST_ONE),
                          child: const Text(Strings.TEST_ONE))),
                  SizedBox(width: 4.w),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () =>
                              Get.toNamed(AppRoutes.ROUTE_TEST_TWO),
                          child: const Text(Strings.TEST_TWO))),
                ],
              ),
            ],
          ),
        ),
        appBar: ThemeConfig.mainAppBar,
      );
}
