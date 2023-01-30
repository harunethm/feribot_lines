import 'package:flutter/material.dart';

class PaymentInfo {
  String title;
  String subTitle;

  String money;
  Color? color;
  
  PaymentInfo({
    required this.title,
    required this.subTitle,
    required this.money,
    this.color,
  });
}
