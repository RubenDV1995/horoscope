class OnboardingModel {
  List<Onboarding>? onboarding;

  OnboardingModel({this.onboarding});

  OnboardingModel.fromJson(Map<String, dynamic> json) {
    if (json['onboarding'] != null) {
      onboarding = <Onboarding>[];
      json['onboarding'].forEach(
        (v) {
          onboarding!.add(Onboarding.fromJson(v));
        },
      );
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (onboarding != null) {
      data['onboarding'] = onboarding!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Onboarding {
  int? id;
  String? title;
  String? subtitle;
  String? img;
  String? color;

  Onboarding({this.id, this.title, this.subtitle, this.img, this.color});

  Onboarding.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    img = json['img'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['img'] = img;
    data['color'] = color;
    return data;
  }
}
