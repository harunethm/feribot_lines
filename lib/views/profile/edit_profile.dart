import 'package:feribot_lines/utils/common_functions.dart';
import 'package:flutter/material.dart';
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
                    child: Stack(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            border: Border.all(width: 4, color: Colors.white),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color:
                                    ColorsConstants.lightBlack.withOpacity(.3),
                                offset: const Offset(0, 10),
                              )
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "assets/images/fethiye-rodos-ferry-tilos.jpg",
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color: Colors.white.withOpacity(0.7),
                              ),
                              color: ColorsConstants.lightPrimary,
                            ),
                            child: const Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
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
                      MyTextFormField(icon: Icons.person, hint: "Ad"),
                      MyTextFormField(icon: Icons.person, hint: "Soyad"),
                      MyTextFormField(
                          icon: Icons.mail_rounded, hint: "E-Posta"),
                      MyTextFormField(
                          icon: Icons.call_rounded, hint: "Telefon Numarası"),
                      MyTextFormField(icon: Icons.key, hint: "Şifre"),
                      MyTextFormField(icon: Icons.key, hint: "Şifre Tekrar"),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 50,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: ColorsConstants
                                        .danger, //Color of the border
                                    style:
                                        BorderStyle.solid, //Style of the border
                                    width: 1, //width of the border
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
    this.icon = Icons.person,
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
                color: Colors.grey,
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
