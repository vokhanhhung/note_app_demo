import 'package:get_storage/get_storage.dart';
import 'package:getx_pattern_project/app/data/models/image_model.dart';
import 'package:getx_pattern_project/app/until/keys.dart';

class ImageProvider {
  final _storage = GetStorage();
  List<ImageModel> images;

  ImageProvider() {
    dynamic imagesJson = _storage.read(Keys.IMAGES);
    if (imagesJson != null) {
      images = (imagesJson as List)
          .map((json) => ImageModel.fromJson(json))
          .toList();
    } else {
      images = List<ImageModel>();
    }
  }

  saveImages() {
    _storage.write(Keys.IMAGES, images);
  }
}
