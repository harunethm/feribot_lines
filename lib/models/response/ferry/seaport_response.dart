import 'dart:convert';

class SeaPort {
  SeaPort({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
  });

  int? id;
  String? name;
  String? latitude;
  String? longitude;

  factory SeaPort.fromRawJson(String str) => SeaPort.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SeaPort.fromJson(Map<String, dynamic> json) => SeaPort(
        id: json["id"] ?? -1,
        name: json["name"] ?? "",
        latitude: json["latitude"] ?? "",
        longitude: json["longitude"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? -1,
        "name": name ?? "",
        "latitude": latitude ?? "",
        "longitude": longitude ?? "",
      };
}
