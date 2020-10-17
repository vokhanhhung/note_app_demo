import 'package:get/get.dart';
import 'package:getx_pattern_project/app/data/providers/password_provider.dart';

class AuthRepository {
  final passwordProvider = Get.find<PasswordProvider>();

  Future<bool> signIn(String input) async {
    String password = passwordProvider.getPassword();
    return input == password;
  }

  Future<void> register(String password) async {
    passwordProvider.setPassword(password);
  }
}
