import 'package:get_storage/get_storage.dart';
import 'package:getx_pattern_project/app/until/keys.dart';

class PasswordProvider {
  final _storage = GetStorage();

  String getPassword() {
    return _storage.read(Keys.PASSWORD);
  }

  void setPassword(String password) async {
    return await _storage.write(Keys.PASSWORD, password);
  }
}
