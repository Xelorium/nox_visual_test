import 'package:flutter/material.dart';

import '../../config/texts.dart';
import '../../config/theme.dart';

class TestOnePage extends StatelessWidget {
  const TestOnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Test One Page'),
      ),
      appBar: routedAppBar(Strings.TEST_ONE),
    );
  }
}
