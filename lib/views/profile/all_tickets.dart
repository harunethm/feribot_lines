import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../utils/colors_const.dart';
import '../../utils/theme_constants.dart';
import 'ticket_details.dart';

class AllTickets extends StatelessWidget {
  const AllTickets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          "Biletlerim",
          style: ThemeConstants.themeTitleStyle,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              itemCount: ticketModelList.length,
              itemBuilder: (context, index) {
                TicketModel model = ticketModelList[index];
                return ticket(model);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget ticket(TicketModel model) {
    return InkWell(
      onTap: () {
        Get.to(
          () => TicketDetails(),
          duration: Duration(milliseconds: 300),
          transition: Transition.rightToLeft,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
            color: Colors.grey.withAlpha(30)),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/images/frame.png",
                  width: 64,
                  height: 64,
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(model.icon),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            model.type,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          model.isActive
                              ? Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: ColorsConstants.lightPrimary),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: const Text(
                                    "Aktif",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              : Container()
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        model.name,
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        model.phone,
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        model.eMail,
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Detayları görmek için karta tıklayınız.",
                  style: TextStyle(
                    color: ColorsConstants.darkBlue.withAlpha(175),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TicketModel {
  IconData icon;
  String companyImage;
  String type;
  String name;
  String phone;
  String eMail;
  bool isActive;

  TicketModel(
    this.icon,
    this.companyImage,
    this.type,
    this.name,
    this.phone,
    this.eMail,
    this.isActive,
  );
}

List<TicketModel> ticketModelList = ticketDataList
    .map(
      (item) => TicketModel(
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

var ticketDataList = [
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
