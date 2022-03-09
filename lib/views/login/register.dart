import 'package:feribot_lines/views/ferry/ferry_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors_const.dart';
import '../../utils/strings.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          color: Get.theme.backgroundColor,
                          height: Get.size.height * 0.4,
                          width: double.infinity,
                          child: Image.asset(
                            'assets/icons/waves.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        // Expanded(child: Container()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: TextField(
                            onChanged: (text) {},
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              prefixIconConstraints: const BoxConstraints(
                                  minWidth: 35, maxHeight: 35),
                              prefixIcon: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 12.0, end: 5.0),
                                child: Icon(Icons.email),
                              ),
                              hintText: Strings.hintEmail,
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              focusedBorder: (OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(100),
                              )),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: TextField(
                            onChanged: (text) {},
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              prefixIconConstraints: const BoxConstraints(
                                  minWidth: 35, maxHeight: 35),
                              prefixIcon: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 12.0, end: 5.0),
                                child: Icon(Icons.phone),
                              ),
                              hintText: Strings.hintPhoneNumber,
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              focusedBorder: (OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(100),
                              )),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: TextField(
                            onChanged: (text) {},
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIconConstraints: const BoxConstraints(
                                  minWidth: 35, maxHeight: 35),
                              prefixIcon: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 12.0, end: 5.0),
                                child: Icon(Icons.key),
                              ),
                              hintText: Strings.hintPassword,
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              focusedBorder: (OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(100),
                              )),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: TextField(
                            onChanged: (text) {},
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIconConstraints: const BoxConstraints(
                                  minWidth: 35, maxHeight: 35),
                              prefixIcon: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 12.0, end: 5.0),
                                child: Icon(Icons.key),
                              ),
                              hintText: Strings.hintConfirmPassword,
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              focusedBorder: (OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(100),
                              )),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(
                                () => FerryScreen(),
                                duration: const Duration(milliseconds: 800),
                              );
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.only(top: 15, bottom: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: ColorsConstants.lightPrimary),
                              child: Center(
                                child: Text(
                                  Strings.signUp,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            "Kayıt yaptıktan sonra kişisel bilgilerini profil sayfandan düzenleyebilirsin.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorsConstants.lightGrey,
                            ),
                          ),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Zaten bir hesabın var mı ? ",
                              style:
                                  TextStyle(color: ColorsConstants.lightAccent),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                Strings.signIn,
                                style: TextStyle(
                                  color: ColorsConstants.lightAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                    Positioned(
                      left: 0,
                      top: Get.size.height * 0.1,
                      right: 0,
                      child: Container(
                          margin: EdgeInsets.zero,
                          width: 100,
                          height: 100,
                          child: Icon(
                            Icons.directions_ferry,
                            color: Colors.white,
                            size: 100,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
