import 'dart:convert';

import 'package:feribot_lines/models/others/error.dart';

class Ticket {
  Ticket({
    this.code,
    this.message,
    this.error,
    this.id,
    this.voucher,
    this.departurePort,
    this.arrivePort,
    this.tripType,
    this.ticketStatus,
    this.token,
    this.createdAt,
    this.voucherUrl,
  });

  int? code;
  String? message;
  String? error;

  int? id;
  int? voucher;
  String? departurePort;
  String? arrivePort;
  String? tripType;
  String? ticketStatus;
  String? token;
  DateTime? createdAt;
  String? voucherUrl;

  factory Ticket.fromRawJson(String str) => Ticket.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        code: json["code"] ?? -1,
        message: json["message"] ?? "",
        error: ErrorMessage.fromRawJson(json["errors"] ?? "").error ?? "",
        id: json["id"] ?? -1,
        voucher: json["voucher"] ?? -1,
        departurePort: json["departure_port"] ?? "",
        arrivePort: json["arrive_port"] ?? "",
        tripType: json["trip_type"] ?? "",
        ticketStatus: json["ticket_status"] ?? "",
        token: json["token"] ?? "",
        createdAt: DateTime.parse(json["created_at"] ?? "1234-12-12"),
        voucherUrl: json["voucher_url"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? -1,
        "voucher": voucher ?? -1,
        "departure_port": departurePort ?? "",
        "arrive_port": arrivePort ?? "",
        "trip_type": tripType ?? "",
        "ticket_status": ticketStatus ?? "",
        "token": token ?? "",
        "created_at": createdAt != null
            ? createdAt!.toIso8601String()
            : DateTime(1234, 12, 12).toIso8601String(),
        "voucher_url": voucherUrl ?? "",
      };
}
