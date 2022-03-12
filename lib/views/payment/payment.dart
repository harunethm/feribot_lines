import 'package:feribot_lines/views/_test_screen.dart';
import 'package:feribot_lines/views/ferry/ferry_screen.dart';
import 'package:feribot_lines/views/ferry/ferry_services.dart';
import 'package:feribot_lines/views/payment/payment_success.dart';
import 'package:feribot_lines/views/profile/ticket_details.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../utils/colors_const.dart';
import '../../utils/const.dart';
import '../../utils/strings.dart';
import '../../widgets/custom_dropdown_sort.dart';
import '../../widgets/custom_text_form_field.dart';

class Payment extends StatelessWidget {
  RxBool mssValue = false.obs;

  Payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.backgroundColor,
        elevation: 2,
        shadowColor: Colors.grey.shade300,
        title: Text(
          Strings.payment,
          style: Constants.themeTitleStyle,
        ),
      ),
      body: Container(
        height: Get.size.height,
        color: ColorsConstants.lightGrey.withAlpha(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Container(
              //   color: Colors.grey.shade300,
              //   height: 1,
              // ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        // CustomCreditCard(
                        //   showBackSide: false,
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextFormField(
                                "Kart Üzerindeki Ad Soyad",
                                "İsim Soyisim",
                                FontAwesomeIcons.creditCard,
                                TextInputType.number,
                              ),
                              CustomTextFormField(
                                "Kart Numarası",
                                "Kart Numarası",
                                FontAwesomeIcons.creditCard,
                                TextInputType.number,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Son Kullanma Tarihi",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: CustomDropDown(
                                            items: List.generate(
                                              12,
                                              (index) => (index + 1)
                                                  .toString()
                                                  .padLeft(2, "0"),
                                            ),
                                            values: List.generate(
                                              12,
                                              (index) => index.toString(),
                                            ),
                                            bgColor:
                                                ColorsConstants.lightPrimary2,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: CustomDropDown(
                                            items: List.generate(
                                              30,
                                              (index) =>
                                                  (index + DateTime.now().year)
                                                      .toString(),
                                            ),
                                            values: List.generate(
                                              30,
                                              (index) =>
                                                  (index + DateTime.now().year)
                                                      .toString(),
                                            ),
                                            bgColor:
                                                ColorsConstants.lightPrimary2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomTextFormField(
                                      "CVC",
                                      "CVC",
                                      FontAwesomeIcons.creditCard,
                                      TextInputType.number,
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          "Toplam Tutar",
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        Text(
                                          "60 €",
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "926,4 ₺",
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Obx(
                                    () => Checkbox(
                                      checkColor: ColorsConstants.lightWhite,
                                      activeColor: ColorsConstants.lightAccent,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      value: mssValue.value,
                                      onChanged: (val) {
                                        mssValue(val);
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        style: const TextStyle(
                                            color: Colors.grey, fontSize: 13),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "Mesafeli Satış Sözleşmesi",
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
                                            text: "'ni okudum kabul ediyorum.",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  child: Container(
                    margin:
                        const EdgeInsets.only(bottom: 10, right: 15, left: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorsConstants.lightPrimary),
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.shieldAlt,
                            size: 20,
                            color: Colors.white,
                          ),
                          Text(
                            "Güvenli Ödeme Yap",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          FaIcon(
                            FontAwesomeIcons.chevronRight,
                            size: 20,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Get.to(
                      () => PaymentSuccess(),
                      duration: Duration(milliseconds: 300),
                      transition: Transition.rightToLeft,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
