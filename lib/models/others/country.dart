import 'dart:convert';

class Country {
  Country({
    this.id,
    this.countryCode,
    this.countryName,
  });

  int? id;
  String? countryCode;
  String? countryName;

  factory Country.fromRawJson(String str) => Country.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"] ?? -1,
        countryCode: json["country_code"] ?? "",
        countryName: json["country_name"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? -1,
        "country_code": countryCode ?? "",
        "country_name": countryName ?? "",
      };
}
