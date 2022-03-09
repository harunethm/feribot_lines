import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../utils/colors_const.dart';
import '../../utils/common_functions.dart';
import '../../utils/const.dart';
import '../../utils/strings.dart';
import '../../widgets/custom_tabs.dart';
import '../../widgets/custom_text_form_field.dart';
import '../payment/payment.dart';

class FerryInformation extends StatelessWidget {
  FerryInformation({Key? key}) : super(key: key);

  RxBool checkBoxValue = true.obs;
  @override
  Widget build(BuildContext context) {
    bool isLightTheme = CommonFunctions.isLightTheme();
    initializeDateFormatting('tr');
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Get.theme.backgroundColor,
        elevation: 2,
        title: Text(
          Strings.booking,
          style: Constants.themeTitleStyle,
        ),
      ),
      body: Container(
        height: Get.size.height,
        color: ColorsConstants.lightGrey.withAlpha(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
                child: Card(
                  color: Get.theme.backgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    // Strings.address1,
                                    "Şirket Adı",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    // Strings.addressLocation,
                                    "Gemi Adı",
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  ),
                                ],
                              ),
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    // colorFilter: ColorFilter.mode(
                                    //     Colors.black.withOpacity(0.2),
                                    //     BlendMode.dstATop),
                                    image: AssetImage(
                                        "assets/images/fethiye-rodos-ferry-tilos.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    width: 20,
                                    padding: const EdgeInsets.all(5),
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: ColorsConstants.lightPrimary,
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                        topLeft: Radius.circular(5),
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "4",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
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
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  Strings.infoTitle,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 5),
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: isLightTheme
                                          ? Colors.black.withAlpha(200)
                                          : Colors.white.withAlpha(200),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Text(
                                      // Strings.roomCancel,
                                      "2 saatlik yolculuk.",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: 14,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 5),
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: isLightTheme
                                          ? Colors.black.withAlpha(200)
                                          : Colors.white.withAlpha(200),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    // Strings.breakFast,
                                    "İkramlı.",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Icon(
                                      Icons.check,
                                      color: ColorsConstants.lightPrimary,
                                      size: 10,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 18,
                                  ),
                                  Text(
                                    Strings.cancelIn,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: ColorsConstants.lightPrimary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 30,
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          Strings.cancelFees,
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Now",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Text(
                                      "23 Sep",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800),
                                    )
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
                                height: 8,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  Strings.ferryPolicy,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      color: Colors.blue,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
                child: Card(
                  color: Get.theme.backgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 10),
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
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
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
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
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
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
                child: Card(
                  color: Get.theme.backgroundColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 10, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text(
                          "Bilet Bilgileri",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: CustomTabs(
                            tabs: const [
                              "İletişim\nBilgileri",
                              "Yetişkin 1",
                              "Yetişkin 2",
                              "Çocuk 1",
                              "Çocuk 2",
                              "Araç",
                            ],
                            activeTab: 0,
                            selectedBGColor: ColorsConstants.lightAccent,
                            selectedTextColor: Colors.white,
                            unSelectedTextColor: ColorsConstants.lightPrimary,
                            borderColor: ColorsConstants.lightPrimary,
                            padding: 60,
                          ),
                        ),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "Sefer ve bilet bilgilerinizi e-posta ve ücretsiz SMS yoluyla ileteceğiz.",
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
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
                            // Text(
                            //   "(Zorunlu Değil)",
                            //   style: TextStyle(
                            //     color: Colors.grey.shade600,
                            //     fontSize: 12,
                            //   ),
                            // )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  text: TextSpan(
                    text: Strings.bookProcess,
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                    children: <TextSpan>[
                      TextSpan(
                        text: Strings.userAgreement,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 13,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            // open desired screen
                          },
                      ),
                      const TextSpan(
                        text: 've ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                      TextSpan(
                        text: Strings.cancelPolicy,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 13,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // open desired screen
                          },
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  onTap: () {
                    Get.to(
                      () => Payment(),
                    );
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.only(bottom: 10, right: 15, left: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorsConstants.lightPrimary),
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Center(
                      child: Text(
                        Strings.continueText,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row tourInfo(
    DateTime depertureTime,
    String departurePortName,
    DateTime arriveTime,
    String arrivePortName,
    String directionText,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    "${departurePortName}",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "${Strings.departure}: ",
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Text(
                        "${depertureTime.hour.toString().padLeft(2, "0")}:${depertureTime.minute.toString().padLeft(2, "0")}",
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                "${depertureTime.day.toString().padLeft(2, "0")}.${depertureTime.month.toString().padLeft(2, "0")}.${depertureTime.year}",
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
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
                style: const TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.w800),
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
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${Strings.arrive}: ",
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Text(
                    "${arriveTime.hour.toString().padLeft(2, "0")}:${arriveTime.minute.toString().padLeft(2, "0")}",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
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
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
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
}
