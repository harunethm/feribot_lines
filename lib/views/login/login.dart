import 'package:feribot_lines/views/Login/forgot_password.dart';
import 'package:feribot_lines/views/ferry/ferry_screen.dart';
import 'package:feribot_lines/views/login/register.dart';
import 'package:feribot_lines/widgets/custom_tabs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors_const.dart';
import '../../utils/strings.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
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
                          color: Theme.of(context).backgroundColor,
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: double.infinity,
                          child: Image.asset(
                            'assets/icons/waves.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 16),
                          child: CustomTabs(
                            tabs: ["E-Posta", "Telefon Numarası"],
                            padding: 64,
                            borderColor: Colors.grey,
                            selectedBGColor: ColorsConstants.lightPrimary,
                            unSelectedTextColor: ColorsConstants.lightPrimary,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: TextField(
                            onChanged: (text) {},
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              prefixIconConstraints: const BoxConstraints(
                                  minWidth: 35, maxHeight: 35),
                              prefixIcon: const Padding(
                                padding: EdgeInsetsDirectional.only(
                                    start: 12.0, end: 5.0),
                                child: Icon(
                                  Icons.email_rounded,
                                  color: ColorsConstants.lightAccent,
                                ),
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
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIconConstraints: const BoxConstraints(
                                  minWidth: 35, maxHeight: 35),
                              prefixIcon: const Padding(
                                padding: EdgeInsetsDirectional.only(
                                    start: 12.0, end: 5.0),
                                child: Icon(
                                  Icons.key,
                                  color: ColorsConstants.lightAccent,
                                ),
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
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: GestureDetector(
                            onTap: () {
                              Get.offAll(() => FerryScreen());
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.only(top: 15, bottom: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: ColorsConstants.lightPrimary),
                              child: Center(
                                child: Text(
                                  Strings.signIn,
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
                        TextButton(
                          onPressed: () => {
                            Get.to(
                              () => ForgotPassword(),
                            ),
                          },
                          child: Text(
                            Strings.forgotPassword,
                            style: TextStyle(
                              color: ColorsConstants.lightAccent,
                              letterSpacing: 2,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Hesabın yok mu ? ",
                              style:
                                  TextStyle(color: ColorsConstants.lightAccent),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.to(Register());
                              },
                              child: Text(
                                "Hemen Kaydol",
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
                      top: MediaQuery.of(context).size.height * 0.1,
                      right: 0,
                      child: Container(
                        margin: EdgeInsets.zero,
                        width: 100,
                        height: 100,
                        child: Icon(
                          Icons.directions_ferry,
                          size: 100,
                          color: Colors.white,
                        ),
                      ),
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
