import 'package:feribot_lines/models/profile/ticket_model.dart';
import 'package:feribot_lines/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TicketService {
  static Future<ResponseModel<List<TicketModel>>> getAllTickets() async {
    List<TicketModel> _tickets = [];
    await Future.delayed(const Duration(seconds: 2), () {
      _tickets = ticketDataList
          .map(
            (item) => TicketModel(
              0, /* TODO ID bilet numarasına göre gelecek ki detayları görebilelim */
              item['icon'] as IconData,
              item['companyImage'] as String,
              item['type'].toString(),
              item['name'].toString(),
              item['phone'] as String,
              item['eMail'] as String,
              item['isActive'] as bool,
            ),
          )
          .toList();
    });

    return ResponseModel(
      error: false,
      errorMessage: "",
      data: _tickets,
    );
  }

  static List<Map<String, Object>> ticketDataList = [
    {
      "icon": FontAwesomeIcons.ship,
      "companyImage": "",
      "type": "Fethiye - Rodos",
      "name": "Harun Calis",
      "phone": "+90 555 666 7777",
      "eMail": "testDeneme@gmail.com",
      "isActive": true
    },
    {
      "icon": FontAwesomeIcons.ship,
      "companyImage": "",
      "type": "Rodos - Fethiye",
      "name": "Harun Calis",
      "phone": "+90 555 666 7777",
      "eMail": "testDeneme@gmail.com",
      "isActive": false
    },
  ];
}
