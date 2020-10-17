import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_project/app/data/models/image_model.dart';
import 'package:getx_pattern_project/app/data/models/note_model.dart';
import 'package:getx_pattern_project/app/data/repositories/image_repository.dart';
import 'package:getx_pattern_project/app/data/repositories/note_repository.dart';
import 'package:getx_pattern_project/app/until/function_untils.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  RxList<NoteModel> notes = RxList<NoteModel>();
  RxList<ImageModel> images = RxList<ImageModel>();
  final _noteRepository = Get.find<NoteRepository>();
  final _imageRepository = Get.find<ImageRepository>();
  final picker = ImagePicker();

  var mixList = [].obs;

  final imageContentController = TextEditingController();
  final noteContentController = TextEditingController();

  bool get isEmptyNotes => notes.isEmpty;
  bool get isEmptyImages => images.isEmpty;

  void updateMixList() {
    mixList = [].obs;
    mixList.addAll(notes);
    mixList.addAll(images);
  }

  @override
  void onInit() {
    notes = RxList(_noteRepository.notes);
    images = RxList(_imageRepository.images);
    updateMixList();

    ever(notes, (_) {
      _noteRepository.save();
      updateMixList();
    });
    ever(images, (_) {
      _imageRepository.save();
      updateMixList();
    });

    ever(mixList, (_) {
      update();
    });
  }

  Future getImage() async {
    imageContentController.text = '';
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );

    await Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            controller: imageContentController,
            autofocus: true,
            onSubmitted: (value) => Get.back(),
            decoration: InputDecoration(labelText: 'Ghi chú: '),
          ),
        ),
      ),
    );

    if (pickedFile != null) {
      var image = ImageModel(
          pickedFile.path, imageContentController.text, toDate(DateTime.now()));
      images.add(image);
      update();
    } else {
      print('Không có ảnh được lựa chọn');
    }
  }

  Future addNote() async {
    noteContentController.text = '';
    await Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            controller: noteContentController,
            autofocus: true,
            onSubmitted: (value) => Get.back(),
            decoration: InputDecoration(labelText: 'Nội dung ghi chú: '),
          ),
        ),
      ),
    );
    var note =
        NoteModel(noteContentController.text, false, toDate(DateTime.now()));
    notes.add(note);
    update();
  }
}
