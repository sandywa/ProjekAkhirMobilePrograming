class NewsModel {
  String? maintainer;
  String? github;
  List<Endpoints>? endpoints;

  NewsModel({this.maintainer, this.github, this.endpoints});

  NewsModel.fromJson(Map<String, dynamic> json) {
    maintainer = json['maintainer'];
    github = json['github'];
    if (json['endpoints'] != null) {
      endpoints = <Endpoints>[];
      json['endpoints'].forEach((v) {
        endpoints!.add(new Endpoints.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maintainer'] = this.maintainer;
    data['github'] = this.github;
    if (this.endpoints != null) {
      data['endpoints'] = this.endpoints!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Endpoints {
  String? name;
  List<Paths>? paths;

  Endpoints({this.name, this.paths});

  Endpoints.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['paths'] != null) {
      paths = <Paths>[];
      json['paths'].forEach((v) {
        paths!.add(new Paths.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.paths != null) {
      data['paths'] = this.paths!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Paths {
  String? name;
  String? path;

  Paths({this.name, this.path});

  Paths.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['path'] = this.path;
    return data;
  }
}
