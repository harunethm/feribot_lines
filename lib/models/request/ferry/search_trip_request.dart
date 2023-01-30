import 'dart:convert';

import 'package:feribot_lines/models/ferry/search_model.dart';
import 'package:intl/intl.dart';

class SearchTripRequest {
  SearchTripRequest({
    this.departurePort,
    this.arrivePort,
    this.departureDate,
    this.returnDate,
    this.adult,
    this.children,
    this.baby,
    this.vehicleType,
    this.vehicleCount,
    this.openTicket,
  });

  String? departurePort;
  String? arrivePort;
  String? departureDate;
  String? returnDate;
  int? adult;
  int? children;
  int? baby;
  int? vehicleType;
  int? vehicleCount;
  int? openTicket;

  factory SearchTripRequest.fromRawJson(String str) =>
      SearchTripRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "from": departurePort ?? "",
        "to": arrivePort ?? "",
        "departureDate": departureDate ?? "",
        "returnDate": returnDate ?? "",
        "adult": adult ?? "",
        "children": children ?? "",
        "baby": baby ?? "",
        "vehicleType": vehicleType ?? "",
        "vehicleCount": vehicleCount ?? "",
        "openTicket": openTicket ?? "",
      };

  factory SearchTripRequest.fromJson(Map<String, dynamic> json) =>
      SearchTripRequest(
        departurePort: json["from"] ?? "",
        arrivePort: json["to"] ?? "",
        departureDate: json["departure-date"] ?? "",
        returnDate: json["return-date"] ?? "",
        adult: json["adult"] ?? -1,
        children: json["children"] ?? -1,
        baby: json["baby"] ?? -1,
        vehicleType: json["vehicle-type"] ?? -1,
        vehicleCount: json["vehicle-count"] ?? -1,
        openTicket: json["open-ticket"] ?? -1,
      );

  factory SearchTripRequest.fromModel() => SearchTripRequest(
        adult: SearchModel.adultCount.value,
        children: SearchModel.childCount.value,
        baby: SearchModel.babyCount.value,
        vehicleType: SearchModel.carType.value,
        vehicleCount: SearchModel.carCount.value,
        departurePort: SearchModel.departurePort.value.key.toString(),
        arrivePort: SearchModel.arrivePort.value.key.toString(),
        departureDate:
            DateFormat("dd-MM-yyyy").format(SearchModel.departureDate.value),
        returnDate: SearchModel.isOneWay.value
            ? null
            : DateFormat("dd-MM-yyyy").format(SearchModel.arriveDate.value),
        openTicket: SearchModel.isOpenReturn.value ? 1 : 0,
      );
}
