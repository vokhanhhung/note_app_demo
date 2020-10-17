import 'package:get/get.dart';
import 'package:getx_pattern_project/app/data/models/image_model.dart';
import 'package:getx_pattern_project/app/data/providers/images_provider.dart';

class ImageRepository {
  final _imageProvider = Get.find<ImageProvider>();

  List<ImageModel> get images => _imageProvider.images;

  save() => _imageProvider.saveImages();

  bool get isEmpty => images.isEmpty;
}
