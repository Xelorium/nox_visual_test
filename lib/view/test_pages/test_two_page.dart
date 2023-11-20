import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visualtest/config/theme.dart';
import 'package:visualtest/controller/test_controllers/test_two_controller.dart';

import '../../config/texts.dart';

class TestTwoPage extends GetView<TestTwoController> {
  const TestTwoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Test Two Page'),
      ),
      appBar: routedAppBar(Strings.TEST_TWO),
    );
  }
}
