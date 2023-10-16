class Failure {
  List<FailuresModel>? failures;

  Failure({
    this.failures,
  });

  Failure.fromJson(Map<String, dynamic> json) {
    if (json['failures'] != null) {
      failures = <FailuresModel>[];
      json['failures'].forEach((v) {
        failures!.add(FailuresModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (failures != null) {
      data['failures'] = failures!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FailuresModel {
  String? id;
  String? title;
  String? subtitle;
  String? action;
  String? urlImage;

  FailuresModel({
    this.id,
    this.title,
    this.subtitle,
    this.action,
    this.urlImage,
  });

  FailuresModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    action = json['action'];
    urlImage = json['urlImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['action'] = action;
    data['urlImage'] = urlImage;
    return data;
  }
}
