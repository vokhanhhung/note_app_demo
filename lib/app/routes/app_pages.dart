import 'package:get/get.dart';
import 'package:getx_pattern_project/app/modules/home/home_binding.dart';
import 'package:getx_pattern_project/app/modules/home/home_page.dart';
import 'package:getx_pattern_project/app/modules/login/login_binding.dart';
import 'package:getx_pattern_project/app/modules/login/login_page.dart';
import 'package:getx_pattern_project/app/modules/register/register_binding.dart';
import 'package:getx_pattern_project/app/modules/register/register_page.dart';
import 'package:getx_pattern_project/app/routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
  ];
}
