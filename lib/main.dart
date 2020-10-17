import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_pattern_project/app/data/providers/password_provider.dart';
import 'package:getx_pattern_project/app/routes/app_pages.dart';
import 'package:getx_pattern_project/app/until/dependency_injection.dart';

import 'app/modules/register/register_binding.dart';
import 'app/routes/app_routes.dart';

void main() async {
  DependencyInjection.init();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final passwordProvider = Get.find<PasswordProvider>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: passwordProvider.getPassword() == null
          ? Routes.REGISTER
          : Routes.LOGIN,
      initialBinding: RegisterBinding(),
      getPages: AppPages.pages,
    );
  }
}
