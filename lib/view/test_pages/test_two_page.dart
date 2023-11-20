import 'package:flutter/material.dart';
import 'package:visualtest/config/theme.dart';

import '../../config/texts.dart';

class TestTwoPage extends StatelessWidget {
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
