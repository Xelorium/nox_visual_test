import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:visualtest/controller/test_controllers/test_one_controller.dart';

import '../../anims/particle/particle_anim.dart';
import '../../config/texts.dart';
import '../../config/theme.dart';

class TestOnePage extends GetView<TestOneController> {
  const TestOnePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestOneController());

    return Scaffold(
      body: Stack(
        children: [
          const Center(child: CombinedAnimation()),
          Center(
              child: Obx(
            () => CircularPercentIndicator(
              radius: 90.0,
              percent: controller.percent.value,
              animationDuration: 1000,
              animation: true,
              center: Text("${(controller.percent.value * 100).toInt()}/100"),
            ),
          )),
        ],
      ),
      appBar: routedAppBar(Strings.TEST_ONE),
    );
  }
}
