import 'package:get_storage/get_storage.dart';
import 'package:getx_pattern_project/app/data/models/note_model.dart';
import 'package:getx_pattern_project/app/until/keys.dart';

class NotesProvider {
  final _storage = GetStorage();
  List<NoteModel> notes;

  NotesProvider() {
    dynamic notesJson = _storage.read(Keys.NOTES);
    if (notesJson != null) {
      notes =
          (notesJson as List).map((json) => NoteModel.fromJson(json)).toList();
    } else {
      notes = List<NoteModel>();
    }
  }

  saveNotes() {
    _storage.write(Keys.NOTES, notes);
  }
}
