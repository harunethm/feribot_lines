import 'dart:convert';

class City {
  City({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory City.fromRawJson(String str) => City.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"] ?? -1,
        name: json["name"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? -1,
        "name": name ?? "",
      };
}

class District {
  District({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory District.fromRawJson(String str) =>
      District.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory District.fromJson(Map<String, dynamic> json) => District(
        id: json["id"] ?? -1,
        name: json["name"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? -1,
        "name": name ?? "",
      };
}
