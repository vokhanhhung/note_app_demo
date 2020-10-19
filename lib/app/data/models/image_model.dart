class ImageModel {
  String path;
  String content;
  String dateTime;
  ImageModel(this.path, this.content, this.dateTime);

  ImageModel.fromJson(dynamic json)
      : path = json['path'],
        content = json['content'],
        dateTime = json['dateTime'];
  toJson() => {'path': path, 'content': content, 'dateTime': dateTime};
}
