import 'package:get/get.dart';
import 'package:getx_pattern_project/app/data/providers/images_provider.dart';
import 'package:getx_pattern_project/app/data/providers/notes_provider.dart';
import 'package:getx_pattern_project/app/data/providers/password_provider.dart';
import 'package:getx_pattern_project/app/data/repositories/auth_repository.dart';
import 'package:getx_pattern_project/app/data/repositories/image_repository.dart';
import 'package:getx_pattern_project/app/data/repositories/note_repository.dart';

class DependencyInjection {
  static void init() {
    Get.lazyPut(() => PasswordProvider());
    Get.lazyPut(() => NotesProvider());
    Get.lazyPut(() => AuthRepository());
    Get.lazyPut(() => NoteRepository());
    Get.lazyPut(() => ImageProvider());
    Get.lazyPut(() => ImageRepository());
  }
}
