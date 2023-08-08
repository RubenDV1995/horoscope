import '../../constants/constants.dart';

class Sings {
  List<Sing>? sing;

  Sings({this.sing});

  Sings.fromJson(Map<String, dynamic> json) {
    if (json['sing'] != null) {
      sing = <Sing>[];
      json['sing'].forEach((v) {
        sing!.add(Sing.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sing != null) {
      data['sing'] = sing!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sing {
  int? id;
  String? title;
  String? date;
  String? urlImage;
  String? urlImagePreview;
  bool? isNew;
  String? category;

  Sing(
      {this.id,
        this.title,
        this.date,
        this.urlImage,
        this.urlImagePreview,
        this.isNew,
        this.category});

  Sing.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] ?? lblTitle;
    date = json['date'];
    urlImage = json['urlImage'];
    urlImagePreview = json['urlImagePreview'];
    isNew = json['isNew'];
    category = json['category'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['date'] = date;
    data['urlImage'] = urlImage;
    data['urlImagePreview'] = urlImagePreview;
    data['isNew'] = isNew;
    data['category'] = category;
    return data;
  }
}
