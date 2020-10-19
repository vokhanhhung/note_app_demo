import 'package:get/get.dart';
import 'package:getx_pattern_project/app/data/repositories/auth_repository.dart';
import 'package:getx_pattern_project/app/data/repositories/image_repository.dart';
import 'package:getx_pattern_project/app/data/repositories/note_repository.dart';
import 'package:getx_pattern_project/app/routes/app_routes.dart';

class LoginController extends GetxController {
  final authRepository = Get.find<AuthRepository>();

  void signIn(String password) async {
    final result = await authRepository.signIn(password);

    if (result) {
      Get.snackbar('Thành công!', "Mật khẩu trùng khớp",
          snackPosition: SnackPosition.BOTTOM);
      await Future.delayed(
        Duration(seconds: 2),
      );
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.snackbar(
        'Thất bại',
        'Bạn nhập sai mật khẩu rồi!',
        duration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
