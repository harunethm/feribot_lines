import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:feribot_lines/models/login/login_model.dart';
import 'package:feribot_lines/services/login.dart';
import 'package:feribot_lines/utils/common_functions.dart';
import 'package:feribot_lines/utils/validations.dart';
import 'package:feribot_lines/viewModels/login/login_vm.dart';
import 'package:feribot_lines/views/Login/forgot_password.dart';
import 'package:feribot_lines/views/ferry/ferry_screen.dart';
import 'package:feribot_lines/views/login/register.dart';
import 'package:feribot_lines/widgets/custom_tabs.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../utils/colors_const.dart';
import '../../utils/theme_constants.dart';
import '../../utils/strings.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  TextEditingController _mailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  LoginVM _vm = Get.put(LoginVM());

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
                    Form(
                      key: _vm.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            color: Theme.of(context).backgroundColor,
                            height: MediaQuery.of(context).size.height * 0.4,
                            width: double.infinity,
                            child: Image.asset(
                              Strings.waves,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const Spacer(),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(
                          //       horizontal: 32.0, vertical: 16),
                          //   child: CustomTabs(
                          //     tabs: ["E-Posta", "Telefon Numarası"],
                          //     padding: 64,
                          //     borderColor: Colors.grey,
                          //     selectedBGColor: ColorsConstants.lightPrimary,
                          //     unSelectedTextColor: ColorsConstants.lightPrimary,
                          //   ),
                          // ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 32.0, vertical: 16),
                            child: Center(
                              child: Text(
                                "ÜYE GİRİŞİ",
                                style: titleStyle,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: TextFormField(
                              controller: _mailController,
                              validator: (text) =>
                                  Validation.eMailValidation(text: text!),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                prefixIconConstraints: const BoxConstraints(
                                    minWidth: 35, maxHeight: 35),
                                prefixIcon: const Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      start: 12.0, end: 5.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.solidEnvelope,
                                    size: 20,
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
                            child: TextFormField(
                              controller: _passwordController,
                              validator: (text) =>
                                  Validation.passwordValidation(text: text!),
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIconConstraints: const BoxConstraints(
                                    minWidth: 35, maxHeight: 35),
                                prefixIcon: const Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      start: 12.0, end: 5.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.key,
                                    size: 20,
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
                            child: InkWell(
                              onTap: () {
                                if (!_vm.isLoading.value) {
                                  _vm.loginUser(
                                    LoginModel()
                                      ..name = _mailController.text
                                      ..password = _passwordController.text,
                                  );
                                }
                              },
                              child: Obx(
                                () => Container(
                                  padding: const EdgeInsets.only(
                                      top: 15, bottom: 15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: ColorsConstants.lightPrimary),
                                  child: Center(
                                    child: !_vm.isLoading.value
                                        ? Text(
                                            Strings.signIn,
                                            style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                            ),
                                          )
                                        : const Icon(
                                            FontAwesomeIcons.spinner,
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
                              Get.offAll(
                                () => ForgotPassword(),
                                duration: Duration(milliseconds: 300),
                                transition: Transition.rightToLeft,
                              ),
                            },
                            child: Text(
                              Strings.forgotPassword,
                              style: const TextStyle(
                                color: ColorsConstants.lightAccent,
                                letterSpacing: 2,
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () => {
                              Get.offAll(
                                () => FerryScreen(),
                                duration: const Duration(milliseconds: 300),
                                transition: Transition.rightToLeft,
                              ),
                            },
                            child: Text(
                              Strings.continueWithOutLogin,
                              style: const TextStyle(
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
                              const Text(
                                "Hesabın yok mu ? ",
                                style: TextStyle(
                                    color: ColorsConstants.lightAccent),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.offAll(
                                    () => Register(),
                                    duration: const Duration(milliseconds: 300),
                                    transition: Transition.rightToLeft,
                                  );
                                },
                                child: const Text(
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
                    ),
                    Positioned(
                      top: Get.size.height * 0.1,
                      left: 0,
                      right: 0,
                      child: Container(
                        margin: EdgeInsets.zero,
                        width: 100,
                        height: 100,
                        child: Image.asset(
                          "assets/images/ferry-card-bg.png",
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
