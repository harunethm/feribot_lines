import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors_const.dart';

class CustomCreditCard extends StatelessWidget {
  CustomCreditCard({required this.showBackSide, Key? key}) : super(key: key);
  RxString bankName = "Ziraat Bankası".obs;
  RxString cardExpiry = "01/01".obs;
  RxString cardHolderName = "Harun Calis".obs;
  RxString cvv = "111".obs;
  RxString cardNumber = "1111111111111111".obs;
  bool showBackSide = false;
  Rx<CardType> cardType = CardType.masterCard.obs;

  @override
  Widget build(BuildContext context) {
    return CreditCard(
      frontBackground: cardBG(),
      backBackground: cardBG(),
      textExpDate: "Son Kullanma Tarihi",
      textName: "İsim Soyisim",
      textExpiry: "AA/YY",
      backTextColor: ColorsConstants.lightWhite,
      frontTextColor: ColorsConstants.lightWhite,
      showBackSide: showBackSide,
      cardType: cardType.value,
      bankName: bankName.value,
      cardExpiry: cardExpiry.value,
      cardHolderName: cardHolderName.value,
      cvv: cvv.value,
      cardNumber: cardNumber.value,
    );
  }

  Widget cardBG() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorsConstants.lightPrimary,
            ColorsConstants.lightPrimary2,
          ],
        ),
        image: DecorationImage(
          image: AssetImage("assets/images/ferry-card-bg.png"),
        ),
      ),
    );
  }
}
