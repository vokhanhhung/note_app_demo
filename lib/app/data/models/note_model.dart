class NoteModel {
  String content;
  bool isComplete = false;
  String dateTime;

  NoteModel(this.content, this.isComplete, this.dateTime);

  NoteModel.fromJson(dynamic json)
      : content = json['content'],
        isComplete = json['isComplete'],
        dateTime = json['dateTime'];

  toJson() =>
      {'content': content, 'isComplete': isComplete, 'dateTime': dateTime};
}
