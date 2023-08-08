class Horoscope {
  String? date;
  String? horoscope;
  String? icon;
  int? id;
  String? sign;

  Horoscope({this.date, this.horoscope, this.icon, this.id, this.sign});

  Horoscope.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    horoscope = json['horoscope'];
    icon = json['icon'];
    id = json['id'];
    sign = json['sign'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['horoscope'] = horoscope;
    data['icon'] = icon;
    data['id'] = id;
    data['sign'] = sign;
    return data;
  }
}