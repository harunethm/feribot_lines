import 'package:flutter/material.dart';

class TicketModel {
  IconData icon;
  int ticketID;
  String companyImage;
  String type;
  String name;
  String phone;
  String eMail;
  bool isActive;

  TicketModel(
    this.ticketID,
    this.icon,
    this.companyImage,
    this.type,
    this.name,
    this.phone,
    this.eMail,
    this.isActive,
  );
}