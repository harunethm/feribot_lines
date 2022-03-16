import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:feribot_lines/widgets/custom_dropdown_sort.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../models/key_value_model.dart';
import '../../utils/colors_const.dart';
import '../../utils/const.dart';
import '../../utils/strings.dart';
import '../../viewModels/ferry/ferry_information_vm.dart';
import '../../widgets/custom_text_form_field.dart';
import '../payment/payment.dart';

class FerryInformation extends StatelessWidget {
  FerryInformation({Key? key}) : super(key: key);

  RxBool checkBoxValue = true.obs;

  PageController _pageController =
      PageController(initialPage: 0, keepPage: true);

  RxInt currentPage = 0.obs;
  List<String> passangers = [
    "Yetişkin 1",
    "Yetişkin 2",
    "Yetişkin 3",
    "Çocuk 1",
    "Çocuk 2",
  ];

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('tr');
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      appBar: appBar(),
      body: Container(
        height: Get.size.height,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        color: ColorsConstants.lightGrey.withAlpha(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.size.height * .01,
              ),
              ferryInfo(),
              SizedBox(
                height: Get.size.height * .01,
              ),
              priceInfo(),
              SizedBox(
                height: Get.size.height * .01,
              ),
              contactInfo(),
              SizedBox(
                height: Get.size.height * .01,
              ),
              ticketInfo(),
              SizedBox(
                height: Get.size.height * .01,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomButton(),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Get.theme.backgroundColor,
      elevation: 2,
      title: Text(
        Strings.booking,
        style: Constants.themeTitleStyle,
      ),
    );
  }

  Widget ferryInfo() {
    return ExpansionTileCard(
      baseColor: Colors.white,
      borderRadius: BorderRadius.circular(16),
      title: Text(
        "Sefer Bilgileri",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text("Bilgileri görmek için tıklayınız."),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
          child: Row(
            children: [
              Image.asset(
                "assets/images/fethiye-rodos-ferry-tilos.jpg",
                fit: BoxFit.cover,
                width: 64,
                height: 64,
              ),
              SizedBox(
                width: Get.size.width * .02,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // Strings.address1,
                    "Şirket Adı",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    // Strings.addressLocation,
                    "Gemi Adı",
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: Get.size.width * .02,
              ),
              Image.asset(
                "assets/images/fethiye-rodos-ferry-tilos.jpg",
                fit: BoxFit.cover,
                width: 64,
                height: 64,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Divider(
                color: Colors.grey.withAlpha(30),
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: tourInfo(
                  DateTime(2022, 4, 23, 12),
                  "Fethiye",
                  DateTime(2022, 4, 23, 14),
                  "Rodos",
                  "Gidiş",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.grey.withAlpha(30),
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: tourInfo(
                  DateTime(2022, 4, 24, 12),
                  "Rodos",
                  DateTime(2022, 4, 24, 14),
                  "Fethiye",
                  "Dönüş",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.grey.withAlpha(30),
                thickness: 2,
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.adultsChildren,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      // "$adultCount Yetişkin, $childCount Çocuk",
                      "1 Yetişkin &\n2 Çocuk &\nAraçsız",
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.grey.withAlpha(30),
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: Get.context!,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            return Container(
                              width: Get.size.width * .8,
                              padding: const EdgeInsets.all(16),
                              margin: const EdgeInsets.only(
                                left: 16.0,
                                right: 16.0,
                              ),
                              decoration: BoxDecoration(
                                color: ColorsConstants.cartGrey,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        Text(
                                          "Sefer Kuralları",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Icon(
                                            FontAwesomeIcons.windowClose,
                                            color: ColorsConstants.danger,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: Get.size.height * .01,
                                    ),
                                    Text(Strings.tripRules),
                                    SizedBox(
                                      height: Get.size.height * .01,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: Text("Kapat"),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 30,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: ColorsConstants.lightPrimary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  Strings.tripRulesButton,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.size.height * .01,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget tourInfo(
    DateTime depertureTime,
    String departurePortName,
    DateTime arriveTime,
    String arrivePortName,
    String directionText,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${departurePortName}",
                textAlign: TextAlign.start,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "${Strings.departure}: ",
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Text(
                    "${depertureTime.hour.toString().padLeft(2, "0")}:${depertureTime.minute.toString().padLeft(2, "0")}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                "${depertureTime.day.toString().padLeft(2, "0")}.${depertureTime.month.toString().padLeft(2, "0")}.${depertureTime.year}",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                DateFormat(
                  DateFormat.WEEKDAY,
                  "tr_TR",
                ).format(
                  depertureTime,
                ),
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            height: 30,
            decoration: BoxDecoration(
              color: Colors.grey.withAlpha(30),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                directionText,
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${arrivePortName}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${Strings.arrive}: ",
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Text(
                    "${arriveTime.hour.toString().padLeft(2, "0")}:${arriveTime.minute.toString().padLeft(2, "0")}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                // "24 Sep'21",
                "${arriveTime.day.toString().padLeft(2, "0")}.${arriveTime.month.toString().padLeft(2, "0")}.${arriveTime.year}",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                DateFormat(
                  DateFormat.WEEKDAY,
                  "tr_TR",
                ).format(
                  arriveTime,
                ),
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget priceInfo() {
    return ExpansionTileCard(
      baseColor: Colors.white,
      borderRadius: BorderRadius.circular(16),
      title: Text(
        "Fiyat Bilgileri",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text("Bilgileri görmek için tıklayınız."),
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      // Strings.roomNight,
                      "1 Yetişkin, 2 Çocuk, Arabasız",
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 15,
                          fontWeight: FontWeight.w800),
                    ),
                    const Text(
                      "₺ 200",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    Strings.basePrice,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
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
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.tDiscount,
                      style: TextStyle(
                        color: ColorsConstants.lightPrimary,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "₺ 50",
                      style: TextStyle(
                        color: ColorsConstants.lightPrimary,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.grey.withAlpha(30),
                height: 2,
              ),
              Container(
                color: Colors.blue.withAlpha(10),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Strings.priceDiscount,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                      const Text(
                        "₺ 150",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.grey.withAlpha(30),
                height: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.serviceFee,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "₺ 10",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
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
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.amountPaid,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const Text(
                      "₺ 160",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget ticketInfo() {
    return Card(
      color: Get.theme.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                "Bilet Bilgileri",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ResponsiveGridList(
              minItemWidth: Get.size.width * .2,
              shrinkWrap: true,
              horizontalGridMargin: 10,
              verticalGridMargin: 10,
              children: passangers
                  .map(
                    (e) => ElevatedButton(
                      onPressed: () {
                        _pageController.animateToPage(passangers.indexOf(e),
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      },
                      child: Text(e),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: Get.height * .8,
              child: PageView.builder(
                controller: _pageController,
                itemCount: passangers.length,
                itemBuilder: (context, index) {
                  return personInfoPage(passangers[index]);
                },
                onPageChanged: (curr) {
                  currentPage.value = curr;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget contactInfoPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextFormField(
            "Ad",
            "Adınız",
            Icons.person,
            TextInputType.name,
          ),
          const CustomTextFormField(
            "Soyad",
            "Soyadınız",
            Icons.person,
            TextInputType.name,
          ),
          const CustomTextFormField(
            "Telefon",
            "Telefon Numaranız",
            Icons.phone,
            TextInputType.phone,
          ),
          const CustomTextFormField(
            "E-Mail",
            "Mail Adresiniz",
            Icons.mail,
            TextInputType.emailAddress,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Sefer ve bilet bilgilerinizi e-posta ve ücretsiz SMS yoluyla ileteceğiz.",
              style: TextStyle(
                color: ColorsConstants.lightGrey,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Obx(
                () => Checkbox(
                  checkColor: ColorsConstants.lightWhite,
                  activeColor: ColorsConstants.lightAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  value: checkBoxValue.value,
                  onChanged: (bool? value) {
                    checkBoxValue.value = value!;
                  },
                ),
              ),
              Expanded(
                child: Text(
                  'Feribotlines bana bilgilendirme ve tanıtım amaçlı eposta ve SMS mesajları gönderebilir.',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey.shade800,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget personInfoPage(String passenger) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
            child: Text(
              passenger,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
          const CustomTextFormField(
            "Ad",
            "Adınız",
            FontAwesomeIcons.userAlt,
            TextInputType.name,
          ),
          const CustomTextFormField(
            "Soyad",
            "Soyadınız",
            FontAwesomeIcons.userAlt,
            TextInputType.name,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Doğum Tarihi",
                style: const TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CustomDropDown(
                      items: List.generate(
                        31,
                        (index) {
                          return KeyValue(
                            index,
                            index == 0
                                ? "Gün"
                                : index.toString().padLeft(2, "0"),
                          );
                        },
                      ),
                      value: 0,
                      onChange: (val) {},
                      bgColor: ColorsConstants.lightPrimary2,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: CustomDropDown(
                      items: List.generate(
                        12,
                        (index) {
                          return KeyValue(
                            index,
                            index == 0
                                ? "Ay"
                                : index.toString().padLeft(2, "0"),
                          );
                        },
                      ),
                      value: 0,
                      onChange: (val) {},
                      bgColor: ColorsConstants.lightPrimary2,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: CustomDropDown(
                      items: List.generate(
                        100,
                        (index) {
                          return KeyValue(
                            index + 2000,
                            index == 0 ? "Yıl" : index.toString(),
                          );
                        },
                      ),
                      value: 2000,
                      onChange: (val) {},
                      bgColor: ColorsConstants.lightPrimary2,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Uyruk",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomDropDown(
                      items: [
                        KeyValue(0, "Türkiye"),
                        KeyValue(1, "Yunanistan"),
                        KeyValue(2, "Bulgaristan"),
                        KeyValue(3, "Azerbeycan"),
                      ],
                      value: 0,
                      onChange: (val) {},
                      bgColor: ColorsConstants.lightPrimary2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          const CustomTextFormField(
            "Pasaport Numarası",
            "Pasaport Numaranız",
            FontAwesomeIcons.passport,
            TextInputType.phone,
          ),
          const CustomTextFormField(
            "TC Kimlik No",
            "Türkiye Cumhuriyeti Kimlik Numaranız",
            FontAwesomeIcons.idCard,
            TextInputType.phone,
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Cinsiyet",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Row(
                children: [
                  Radio(
                    value: true,
                    groupValue: "cinsiyet",
                    onChanged: (val) {},
                  ),
                  Text("Bay"),
                  SizedBox(
                    width: 20,
                  ),
                  Radio(
                    value: false,
                    groupValue: "cinsiyet",
                    onChanged: (val) {},
                  ),
                  Text("Bayan"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget bottomButton() {
    return InkWell(
      onTap: () {
        Get.to(
          () => Payment(),
          duration: Duration(milliseconds: 300),
          transition: Transition.rightToLeft,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12, right: 16, left: 16),
        padding: const EdgeInsets.only(top: 12, bottom: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorsConstants.lightPrimary,
        ),
        child: Text(
          Strings.continueText,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget contactInfo() {
    return Card(
      color: Get.theme.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                "İletişim Bilgileri",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            contactInfoPage(),
          ],
        ),
      ),
    );
  }
}
