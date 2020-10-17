import 'package:get/get.dart';
import 'package:getx_pattern_project/app/data/models/note_model.dart';
import 'package:getx_pattern_project/app/data/providers/notes_provider.dart';

class NoteRepository {
  final _noteProvider = Get.find<NotesProvider>();

  List<NoteModel> get notes => _noteProvider.notes;

  save() => _noteProvider.saveNotes();

  bool get isEmpty => notes.isEmpty;
}
