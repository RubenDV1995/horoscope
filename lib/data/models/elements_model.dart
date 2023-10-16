class Elements {
  List<Element> element;

  Elements({
    required this.element,
  });

  factory Elements.fromJson(Map<String, dynamic> json) => Elements(
    element: List<Element>.from(json["element"].map((x) => Element.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "element": List<dynamic>.from(element.map((x) => x.toJson())),
  };
}

class Element {
  int id;
  String title;
  String element;
  List<SingsName> singsName;
  String urlImage;
  String urlImagePreview;
  String shortDescription;
  String description;

  Element({
    required this.id,
    required this.title,
    required this.element,
    required this.singsName,
    required this.urlImage,
    required this.urlImagePreview,
    required this.shortDescription,
    required this.description,
  });

  factory Element.fromJson(Map<String, dynamic> json) => Element(
    id: json["id"],
    title: json["title"],
    element: json["element"],
    singsName: List<SingsName>.from(json["singsName"].map((x) => SingsName.fromJson(x))),
    urlImage: json["urlImage"],
    urlImagePreview: json["urlImagePreview"],
    shortDescription: json["short_description"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "element": element,
    "singsName": List<dynamic>.from(singsName.map((x) => x.toJson())),
    "urlImage": urlImage,
    "urlImagePreview": urlImagePreview,
    "short_description": shortDescription,
    "description": description,
  };
}

class SingsName {
  String name;

  SingsName({
    required this.name,
  });

  factory SingsName.fromJson(Map<String, dynamic> json) => SingsName(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}