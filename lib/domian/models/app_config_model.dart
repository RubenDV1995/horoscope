class AppConfig {
  List<App>? appConfig;

  AppConfig({this.appConfig});

  AppConfig.fromJson(Map<String, dynamic> json) {
    if (json['app_config'] != null) {
      appConfig = <App>[];
      json['app_config'].forEach(
        (v) {
          appConfig!.add(App.fromJson(v));
        },
      );
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (appConfig != null) {
      data['app_config'] = appConfig!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class App {
  String? id;
  String? appVersion;
  bool? required;
  String? urlStore;
  List<Changes>? changes;

  App({this.id, this.appVersion, this.required, this.urlStore, this.changes});

  App.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appVersion = json['appVersion'];
    required = json['required'];
    urlStore = json['urlStore'];
    if (json['changes'] != null) {
      changes = <Changes>[];
      json['changes'].forEach(
        (v) {
          changes!.add(Changes.fromJson(v));
        },
      );
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['appVersion'] = appVersion;
    data['required'] = required;
    data['urlStore'] = urlStore;
    if (changes != null) {
      data['changes'] = changes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Changes {
  String? title;

  Changes({this.title});

  Changes.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    return data;
  }
}
