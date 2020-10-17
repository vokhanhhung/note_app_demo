import 'package:get/get.dart';
import 'package:getx_pattern_project/app/data/repositories/auth_repository.dart';
import 'package:getx_pattern_project/app/routes/app_routes.dart';

class RegisterController extends GetxController {
  final authRepository = Get.find<AuthRepository>();

  void register(String password) async {
    await authRepository.register(password);
    Get.snackbar('Thành công!', "Mật khẩu này đã được đăng kí",
        duration: Duration(seconds: 2), snackPosition: SnackPosition.BOTTOM);
    await Future.delayed(Duration(seconds: 2));
    Get.toNamed(Routes.LOGIN);
  }
}
