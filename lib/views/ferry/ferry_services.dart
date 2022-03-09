import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../utils/colors_const.dart';
import '../../utils/common_functions.dart';
import '../../widgets/custom_dropdown_sort.dart';
import '../../widgets/custom_tabs.dart';
import '../../widgets/ferry_details.dart';
import '../../widgets/ferry_ticket.dart';
import '../Login/login.dart';
import '../profile/profile.dart';

class FerryServices extends StatelessWidget {
  final List<String> tabs;

  const FerryServices({
    Key? key,
    this.tabs = const ["Gidiş", "Dönüş"],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              CommonFunctions.openProfile();
            },
          ),
        ],
        backgroundColor: ColorsConstants.lightPrimary,
        shadowColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: Get.size.height * .4,
            decoration: const BoxDecoration(
              color: ColorsConstants.lightPrimary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(45.0),
                bottomRight: Radius.circular(45.0),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              const FerryDetails(
                from: "FETHİYE",
                to: "RODOS",
                date: "Pt 6 Haz",
              ),
              const SizedBox(height: 10.0),
              sortingDetails(),
              const SizedBox(height: 20.0),
              CustomTabs(tabs: tabs),
              const FerryTickets()
            ],
          )
        ],
      ),
    );
  }

  sortingDetails() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  const Text(
                    'Sırala:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  CustomDropDown(
                    items: [
                      'Fiyat',
                      'Sefer Süresi,',
                      'Varış Saati',
                      'Kalkış Saati',
                    ],
                    values: [
                      'Fiyat',
                      'Durak Sayısı',
                      'Varış Saati',
                      'Kalkış Saati',
                    ],
                  )
                ],
              )
            ],
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  personIcon(Icons.person_outline_rounded, 2),
                  personIcon(Icons.drive_eta_rounded, 1),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget personIcon(IconData icon, int count) {
    return Stack(
      children: <Widget>[
        Container(
          height: 40.0,
          width: 40.0,
          decoration: BoxDecoration(
            // color: ColorsConstants.lightPrimary.withAlpha(40),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        Positioned(
          left: 20.0,
          child: Container(
            height: 16.0,
            width: 16.0,
            decoration: BoxDecoration(
              color: ColorsConstants.lightAccent,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Text(
                '$count',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class FerryTickets extends StatelessWidget {
  const FerryTickets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        children: const <Widget>[
          FerryTicket(
            price: 634,
            originCode: 'FETHİYE',
            destinationCode: 'RODOS',
            departureTime: '14:55',
            departureDate: 'Pt 06 Haz',
            arrivalTime: '20:20',
            arrivalDate: 'Pt 06 Haz',
            totalTime: '13 saat 25 dakika',
            companyName: "Şirket Adı",
            ferryName: "Feribot Adı",
            isSelected: false,
          ),
          FerryTicket(
            price: 634,
            originCode: 'FETHİYE',
            destinationCode: 'RODOS',
            departureTime: '14:55',
            departureDate: 'Pt 06 Haz',
            arrivalTime: '20:20',
            arrivalDate: 'Pt 06 Haz',
            totalTime: '13 saat 25 dakika',
            companyName: "Şirket Adı",
            ferryName: "Feribot Adı",
            isSelected: true,
          ),
          FerryTicket(
            price: 634,
            originCode: 'FETHİYE',
            destinationCode: 'RODOS',
            departureTime: '14:55',
            departureDate: 'Pt 06 Haz',
            arrivalTime: '20:20',
            arrivalDate: 'Pt 06 Haz',
            totalTime: '13 saat 25 dakika',
            companyName: "Şirket Adı",
            ferryName: "Feribot Adı",
            isSelected: false,
          ),
          FerryTicket(
            price: 634,
            originCode: 'FETHİYE',
            destinationCode: 'RODOS',
            departureTime: '14:55',
            departureDate: 'Pt 06 Haz',
            arrivalTime: '20:20',
            arrivalDate: 'Pt 06 Haz',
            totalTime: '13 saat 25 dakika',
            companyName: "Şirket Adı",
            ferryName: "Feribot Adı",
            isSelected: false,
          ),
          FerryTicket(
            price: 634,
            originCode: 'FETHİYE',
            destinationCode: 'RODOS',
            departureTime: '14:55',
            departureDate: 'Pt 06 Haz',
            arrivalTime: '20:20',
            arrivalDate: 'Pt 06 Haz',
            totalTime: '13 saat 25 dakika',
            companyName: "Şirket Adı",
            ferryName: "Feribot Adı",
            isSelected: false,
          ),
          FerryTicket(
            price: 634,
            originCode: 'FETHİYE',
            destinationCode: 'RODOS',
            departureTime: '14:55',
            departureDate: 'Pt 06 Haz',
            arrivalTime: '20:20',
            arrivalDate: 'Pt 06 Haz',
            totalTime: '13 saat 25 dakika',
            companyName: "Şirket Adı",
            ferryName: "Feribot Adı",
            isSelected: false,
          ),
          FerryTicket(
            price: 634,
            originCode: 'FETHİYE',
            destinationCode: 'RODOS',
            departureTime: '14:55',
            departureDate: 'Pt 06 Haz',
            arrivalTime: '20:20',
            arrivalDate: 'Pt 06 Haz',
            totalTime: '13 saat 25 dakika',
            companyName: "Şirket Adı",
            ferryName: "Feribot Adı",
            isSelected: false,
          ),
          FerryTicket(
            price: 634,
            originCode: 'FETHİYE',
            destinationCode: 'RODOS',
            departureTime: '14:55',
            departureDate: 'Pt 06 Haz',
            arrivalTime: '20:20',
            arrivalDate: 'Pt 06 Haz',
            totalTime: '13 saat 25 dakika',
            companyName: "Şirket Adı",
            ferryName: "Feribot Adı",
            isSelected: false,
          ),
        ],
      ),
    );
  }
}
