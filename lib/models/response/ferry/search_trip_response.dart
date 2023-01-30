import 'dart:convert';

import 'package:get/get.dart';

class SearchTripResponse {
  SearchTripResponse({
    this.departureModel,
    this.returnModel,
  });

  List<Trip>? departureModel;
  List<Trip>? returnModel;

  factory SearchTripResponse.fromRawJson(String str) =>
      SearchTripResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchTripResponse.fromJson(Map<String, dynamic> json) =>
      SearchTripResponse(
        departureModel: json["departure"] != null
            ? List<Trip>.from(json["departure"].map((x) => Trip.fromRawJson(x)))
            : [],
        returnModel: json["return"] != null
            ? List<Trip>.from(json["return"].map((x) => Trip.fromRawJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "departure": departureModel != null
            ? List<dynamic>.from(departureModel!.map((x) => x.toJson()))
            : [],
        "return": returnModel != null
            ? List<dynamic>.from(returnModel!.map((x) => x.toJson()))
            : [],
      };
}

class Trip {
  Trip({
    this.expeditionId,
    this.companyName,
    this.companyLogo,
    this.bestPriceGuarantee,
    this.ferryName,
    this.departurePortName,
    this.arrivePortName,
    this.adult,
    this.children,
    this.baby,
    this.bike,
    this.motorcycle,
    this.automobile,
    this.minibus,
    this.bus,
    this.exchangeId,
    this.totalAmount,
    this.exchangeCode,
    this.isSelected,
  }) {
    isSelected ??= false.obs;
  }

  int? expeditionId;
  String? companyName;
  String? companyLogo;
  String? bestPriceGuarantee;
  String? ferryName;
  String? departurePortName;
  String? arrivePortName;
  String? adult;
  String? children;
  String? baby;
  String? bike;
  String? motorcycle;
  String? automobile;
  String? minibus;
  String? bus;
  int? exchangeId;
  int? totalAmount;
  String? exchangeCode;
  RxBool? isSelected;

  factory Trip.fromRawJson(String str) => Trip.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Trip.fromJson(Map<String, dynamic> json) => Trip(
        expeditionId: json["expedition_id"] ?? -1,
        companyName: json["company_name"] ?? "",
        companyLogo: json["company_logo"] ?? "",
        bestPriceGuarantee: json["best_price_guarantee"] ?? "",
        ferryName: json["ferry_name"] ?? "",
        departurePortName: json["departure_port_name"] ?? "",
        arrivePortName: json["arrive_port_name"] ?? "",
        adult: json["adult"] ?? "",
        children: json["children"] ?? "",
        baby: json["baby"] ?? "",
        bike: json["bike"] ?? "",
        motorcycle: json["motorcycle"] ?? "",
        automobile: json["automobile"] ?? "",
        minibus: json["minibus"] ?? "",
        bus: json["bus"] ?? "",
        exchangeId: json["exchange_id"] ?? -1,
        totalAmount: json["total_amount"] ?? -1,
        exchangeCode: json["exchange_code"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "expedition_id": expeditionId ?? -1,
        "company_name": companyName ?? "",
        "company_logo": companyLogo ?? "",
        "best_price_guarantee": bestPriceGuarantee ?? "",
        "ferry_name": ferryName ?? "",
        "departure_port_name": departurePortName ?? "",
        "arrive_port_name": arrivePortName ?? "",
        "adult": adult ?? "",
        "children": children ?? "",
        "baby": baby ?? "",
        "bike": bike ?? "",
        "motorcycle": motorcycle ?? "",
        "automobile": automobile ?? "",
        "minibus": minibus ?? "",
        "bus": bus ?? "",
        "exchange_id": exchangeId ?? -1,
        "total_amount": totalAmount ?? -1,
        "exchange_code": exchangeCode ?? "",
      };
}
