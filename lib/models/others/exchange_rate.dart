import 'dart:convert';

class ExchangeRate {
  ExchangeRate({
    this.id,
    this.code,
    this.value,
    this.symbol,
  });

  int? id;
  String? code;
  String? value;
  String? symbol;

  factory ExchangeRate.fromRawJson(String str) =>
      ExchangeRate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExchangeRate.fromJson(Map<String, dynamic> json) => ExchangeRate(
        id: json["id"] ?? -1,
        code: json["code"] ?? "",
        value: json["value"] ?? "",
        symbol: json["symbol"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? -1,
        "code": code ?? "",
        "value": value ?? "",
        "symbol": symbol ?? "",
      };
}
