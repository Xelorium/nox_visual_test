import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:visualtest/view/home_page.dart';

import '../view/test_pages/test_one_page.dart';
import '../view/test_pages/test_two_page.dart';

class AppRoutes {
  AppRoutes._();

  static const String ROUTE_HOME = '/';
  static const String ROUTE_TEST_ONE = '/test1';
  static const String ROUTE_TEST_TWO = '/test2';
}

final List<GetPage> appPages = [
  GetPage(
    name: AppRoutes.ROUTE_HOME,
    page: () => const HomePage(),
  ),
  GetPage(
    name: AppRoutes.ROUTE_TEST_ONE,
    page: () => const TestOnePage(),
  ),
  GetPage(
    name: AppRoutes.ROUTE_TEST_TWO,
    page: () => const TestTwoPage(),
  ),
];
