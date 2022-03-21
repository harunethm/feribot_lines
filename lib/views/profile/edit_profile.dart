import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../utils/colors_const.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);

  RxBool showPassword = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.lightPrimary,
      appBar: AppBar(
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "Profili Düzenle",
        ),
      ),
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: Get.size.height * 0.05,
                bottom: Get.size.height * 0.05,
              ),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        shape: BoxShape.circle,
                        color: ColorsConstants.lightAccent,
                      ),
                      child: Center(
                        child: Text(
                          "HÇ",
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Get.size.height * .1 + 120),
              child: Container(
                width: Get.size.width,
                padding: const EdgeInsets.only(left: 15, right: 15),
                constraints: BoxConstraints(
                  minHeight: Get.size.height - (Get.size.height * .1) - 120,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 15,
                      ),
                      MyTextFormField(
                          icon: FontAwesomeIcons.userAlt, hint: "Ad"),
                      MyTextFormField(
                          icon: FontAwesomeIcons.userAlt, hint: "Soyad"),
                      MyTextFormField(
                          icon: FontAwesomeIcons.solidEnvelope,
                          hint: "E-Posta"),
                      MyTextFormField(
                          icon: FontAwesomeIcons.phoneAlt,
                          hint: "Telefon Numarası"),
                      MyTextFormField(
                          icon: FontAwesomeIcons.key, hint: "Şifre"),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 50,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: ColorsConstants.danger,
                                    style: BorderStyle.solid,
                                    width: 1,
                                  ),
                                ),
                                child: const Text(
                                  "VAZGEÇ",
                                  style: TextStyle(
                                    fontSize: 14,
                                    letterSpacing: 2.2,
                                    color: ColorsConstants.danger,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 50,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: ColorsConstants.lightPrimary,
                                ),
                                child: const Text(
                                  "KAYDET",
                                  style: TextStyle(
                                    fontSize: 14,
                                    letterSpacing: 2.2,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  String hint;
  IconData icon;
  MyTextFormField({
    this.hint = "",
    this.icon = FontAwesomeIcons.userAlt,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: TextFormField(
            obscureText: false,
            style: const TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                gapPadding: 15,
              ),
              hintText: hint,
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
              prefixIcon: Icon(
                icon,
                size: 20,
                color: ColorsConstants.lightAccent,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
