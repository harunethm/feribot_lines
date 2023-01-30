// To parse this JSON data, do
//
//     final createOrderResponse = createOrderResponseFromJson(jsonString);

import 'dart:convert';

class CreateOrderResponse {
  CreateOrderResponse({
    this.code,
    this.message,
    this.order,
  });

  int? code;
  String? message;
  Order? order;

  factory CreateOrderResponse.fromRawJson(String str) =>
      CreateOrderResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateOrderResponse.fromJson(Map<String, dynamic> json) =>
      CreateOrderResponse(
        code: json["code"] ?? -1,
        message: json["message"] ?? "",
        order: json["data"] != null
            ? Order.fromRawJson(json["data"])
            : Order(orderId: -1, paymentUrl: "", orderToken: ""),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": order != null ? order!.toJson() : Order().toJson(),
      };
}

class Order {
  Order({
    this.paymentUrl,
    this.orderId,
    this.orderToken,
  });

  String? paymentUrl;
  int? orderId;
  String? orderToken;

  factory Order.fromRawJson(String str) => Order.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        paymentUrl: json["payment_url"] ?? "",
        orderId: json["order_id"] ?? -1,
        orderToken: json["order_token"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "payment_url": paymentUrl ?? "",
        "order_id": orderId ?? -1,
        "order_token": orderToken ?? "",
      };
}
