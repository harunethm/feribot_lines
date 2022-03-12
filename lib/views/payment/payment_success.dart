import 'package:feribot_lines/views/profile/all_tickets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors_const.dart';
import '../../utils/const.dart';

class PaymentSuccess extends StatelessWidget {
  PaymentSuccess({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      extendBody: true,
      appBar: appBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            children: <Widget>[
              ticketSuccessfullyCreated(),
              dividerWithTitle(""),
              goToMap(context),
              dividerWithTitle("Sefer Bilgileri"),
              tripInformation(),
              dividerWithTitle("İletişim Bilgileri"),
              contactInfo(),
              dividerWithTitle("Yolcu Bilgileri"),
              passangerInfo(),
              dividerWithTitle("Ödeme Bilgileri"),
              paymentInfo(),
              dividerWithTitle("Voucher Gönder"),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(
                            bottom: 15, left: 10, right: 10),
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorsConstants.success,
                        ),
                        child: const Center(
                          child: Text(
                            "Telefonuma",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.off(() => AllTickets());
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            bottom: 15, left: 10, right: 10),
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorsConstants.success,
                        ),
                        child: const Center(
                          child: Text(
                            "Mail Adresime",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNaviBarButton(),
    );
  }

  Widget row(
    String title,
    String description,
    String subTitle,
    String subDescription,
    bool divider, {
    Color? textColor,
    Color? descColor,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: textColor ?? Colors.grey.shade800,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: descColor ?? Colors.grey.shade800,
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                subTitle,
                style: TextStyle(
                  fontSize: 12,
                  color: textColor ?? Colors.grey.shade700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Text(
                subDescription,
                style: TextStyle(
                  fontSize: 12,
                  color: descColor ?? Colors.grey.shade700,
                ),
              ),
            ),
          ],
        ),
        divider
            ? Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: Divider(
                      color: Colors.grey.withAlpha(30),
                      thickness: 2,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              )
            : Container(),
      ],
    );
  }

  Widget paymentInfo() {
    return Card(
      color: Get.theme.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 10),
        child: Column(
          children: [
            row(
              "Fethiye - Rodos, Gidiş",
              "30 €",
              "1 Yetişkin",
              "464,06 ₺",
              true,
            ),
            row(
              "Fethiye - Rodos, Gidiş",
              "50 €",
              "1 Minivan",
              "464,06 ₺",
              true,
            ),
            row(
              "Fethiye - Rodos, Dönüş",
              "30 €",
              "1 Yetişkin",
              "464,06 ₺",
              true,
            ),
            row(
              "Fethiye - Rodos, Dönüş",
              "50 €",
              "1 Minivan",
              "464,06 ₺",
              true,
            ),
            row(
              "Toplam Fiyat (€)",
              "110 €",
              "",
              "",
              true,
              textColor: ColorsConstants.info,
              descColor: ColorsConstants.info,
            ),
            row(
              "Toplam Fiyat (₺)",
              "1705,21 ₺",
              "",
              "",
              true,
              textColor: ColorsConstants.info,
              descColor: ColorsConstants.info,
            ),
            row(
              "Taksit Miktarı",
              "1",
              "",
              "",
              true,
              textColor: ColorsConstants.info,
              descColor: ColorsConstants.info,
            ),
            row(
              "Ödenen Miktar",
              "1705,21 ₺",
              "",
              "",
              false,
              textColor: ColorsConstants.success,
              descColor: ColorsConstants.success,
            ),
          ],
        ),
      ),
    );
  }

  Widget passangerInfo() {
    return Column(
      children: [
        PassengerInfo(
          name: "Harun",
          surName: "Calis",
          tcNo: "11111111111",
          passengerNo: 1,
          passengerType: "Yetişkin",
        ),
        const SizedBox(
          height: 10,
        ),
        PassengerInfo(
          name: "Harun",
          surName: "Calis",
          tcNo: "11111111111",
          passengerNo: 2,
          passengerType: "Yetişkin",
        ),
        const SizedBox(
          height: 10,
        ),
        PassengerInfo(
          name: "Harun",
          surName: "Calis",
          tcNo: "11111111111",
          passengerNo: 3,
          passengerType: "Yetişkin",
        ),
      ],
    );
  }

  Widget contactInfo() {
    return Column(
      children: [
        ContactInfo(
          name: "Harun",
          surName: "Calis",
          emailAdress: "test@gmail.com",
          phoneNumber: "1111111111",
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget goToMap(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: true,
          barrierLabel: "label",
          builder: (context) {
            return Scaffold(
              backgroundColor: ColorsConstants.lightBG.withOpacity(0.2),
              body: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColorsConstants.lightBG,
                  ),
                  // constraints: BoxConstraints(
                  //   maxHeight: Get.size.height * 0.4,
                  //   maxWidth: Get.size.height * 0.4,
                  // ),
                  height: 150,
                  width: 300,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(15),
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                              "Haritalar uygulamasını açmak istiyor musunuz ?"),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              primary: ColorsConstants.danger,
                            ),
                            onPressed: () {
                              Get.back();
                            },
                            child: Text("İptal"),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              primary: ColorsConstants.success,
                            ),
                            onPressed: () {
                              // TODO haritalar uygulamasını aç
                            },
                            child: Text("Aç"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Container(
        height: 220,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: NetworkImage(
                "https://images.squarespace-cdn.com/content/v1/54ff63f0e4b0bafce6932642/1572988511564-XPIO8NOVBL7U5CQ1O1QY/Google+Maps.gif?format=750w"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Icon(
                  Icons.location_on,
                  color: ColorsConstants.lightPrimary2,
                  size: 50,
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorsConstants.grey.withAlpha(200),
                ),
                child: Text(
                  "Haritalara gitmek için dokunun.",
                  style: TextStyle(
                    color: ColorsConstants.lightWhite,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ticketSuccessfullyCreated() {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: ColorsConstants.lightPrimary,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Center(
              heightFactor: 1,
              widthFactor: 1,
              child: Image.asset(
                "assets/icons/invoice.png",
                alignment: Alignment.center,
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          Flexible(
            flex: 5,
            child: Column(
              children: const <Widget>[
                Text(
                  "Biletiniz başarıyla oluşturuldu.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.0),
                Text(
                  "Bilet bilgilerinizi aşağıdan kontrol edebilirsiniz. Bu bilgiler E-Posta adresinize ve cep telefonunuza da gönderilmiştir.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Get.theme.backgroundColor,
      elevation: 4,
      shadowColor: Colors.grey.shade300,
      title: Text(
        "Bilet Bilgileri",
        style: Constants.themeTitleStyle,
      ),
    );
  }

  Widget bottomNaviBarButton() {
    return InkWell(
      onTap: () {
        Get.off(() => AllTickets());
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorsConstants.lightPrimary,
        ),
        child: const Center(
          child: Text(
            "Tüm Biletlerim",
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget dividerWithTitle(String title) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Divider(
          color: Colors.grey.withAlpha(30),
          thickness: 2,
        ),
        title.isNotEmpty
            ? const SizedBox(
                height: 10,
              )
            : Container(),
        title.isNotEmpty
            ? Text(
                title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorsConstants.lightPrimary2),
              )
            : Container(),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }

  Widget tripInformation() {
    return Column(
      children: [
        travelInfo("Fethiye", "Rodos", "1 Saat 25 Dakika", DateTime.now(),
            DateTime.now(), "123"),
        const SizedBox(
          height: 15,
        ),
        travelInfo("Rodos", "Fethiye", "1 Saat 25 Dakika", DateTime.now(),
            DateTime.now(), "123"),
      ],
    );
  }

  Widget placesWidget(String from, String to) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: Get.size.width - 56,
      color: Get.theme.backgroundColor,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const Icon(Icons.location_on,
                  color: ColorsConstants.lightPrimary),
              Text(
                from,
                style: const TextStyle(color: ColorsConstants.lightPrimary),
              ),
            ],
          ),
          Row(
            children: [
              Row(
                children: List.generate(
                  3,
                  (ii) => Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 5, bottom: 5),
                    child: Container(
                      height: 2,
                      width: 3,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: const Icon(
                  Icons.directions_ferry,
                  color: ColorsConstants.grey,
                ),
              ),
              Row(
                children: List.generate(
                  3,
                  (ii) => Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 5, bottom: 5),
                    child: Container(
                      height: 2,
                      width: 3,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Icon(Icons.location_on, color: ColorsConstants.lightAccent),
              Text(
                to,
                style: const TextStyle(color: ColorsConstants.lightAccent),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget travelInfo(
    String from,
    String to,
    String tripTime,
    DateTime depertureDateTime,
    DateTime arriveDateTime,
    String ferryNo,
  ) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: ColorsConstants.lightBG,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: ColorsConstants.cartGrey,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          placesWidget(from, to),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    from,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 30),
                  ),
                  Text(
                    to,
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Yolculuk süresi: ",
                            style: TextStyle(
                              color: Colors.grey.shade700,
                            )),
                        TextSpan(
                          text: tripTime,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorsConstants.lightAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Image.asset(
                "assets/images/frame.png",
                width: Get.size.width * .3,
                height: Get.size.width * .3,
              ),
            ],
          ),
          const SizedBox(
            height: 9.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Kalkış",
                style: TextStyle(color: Colors.grey.shade800),
              ),
              Text(
                "Varış",
                style: TextStyle(color: Colors.grey.shade800),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${depertureDateTime.day.toString().padLeft(2, "0")}.${depertureDateTime.month.toString().padLeft(2, "0")}.${depertureDateTime.year.toString().substring(2, 4)}",
                style: TextStyle(color: Colors.grey.shade700),
              ),
              Icon(
                Icons.arrow_right_alt_rounded,
                color: Colors.grey.shade700,
              ),
              Text(
                "${arriveDateTime.day.toString().padLeft(2, "0")}.${arriveDateTime.month.toString().padLeft(2, "0")}.${arriveDateTime.year.toString().substring(2, 4)}",
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${depertureDateTime.hour.toString().padLeft(2, "0")}:${depertureDateTime.minute.toString().padLeft(2, "0")}",
                style: TextStyle(color: Colors.grey.shade700),
              ),
              Text(
                "${arriveDateTime.hour.toString().padLeft(2, "0")}:${arriveDateTime.minute.toString().padLeft(2, "0")}",
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Icon(
                    Icons.directions_ferry,
                    color: Colors.black54,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 9.0),
                    decoration: BoxDecoration(
                      color: ColorsConstants.lightAccent2,
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    child: Text(
                      ferryNo,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 9.0),
                    decoration: BoxDecoration(
                      color: ColorsConstants.lightPrimary2,
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    child: Text(
                      ferryNo,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const Icon(
                    Icons.directions_ferry,
                    color: Colors.black54,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ContactInfo extends StatelessWidget {
  final String name;
  final String surName;
  final String emailAdress;
  final String phoneNumber;

  const ContactInfo(
      {required this.name,
      required this.surName,
      required this.emailAdress,
      required this.phoneNumber,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9.0),
      decoration: BoxDecoration(
        color: ColorsConstants.lightBG,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: ColorsConstants.cartGrey,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "$name $surName",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              Text(
                emailAdress,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
          Text(
            phoneNumber,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: ColorsConstants.grey,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class PassengerInfo extends StatelessWidget {
  late final String name;
  late final String surName;
  late final String tcNo;
  late final int passengerNo;
  late final String passengerType;
  PassengerInfo(
      {required this.name,
      required this.surName,
      required this.tcNo,
      required this.passengerNo,
      required this.passengerType,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9.0),
      decoration: BoxDecoration(
        color: ColorsConstants.lightBG,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: ColorsConstants.cartGrey,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "$name $surName",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              Text(
                tcNo,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
          Text(
            "$passengerNo. $passengerType",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade700,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
