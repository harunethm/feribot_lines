import 'package:feribot_lines/models/login/register_model.dart';
import 'package:feribot_lines/utils/validations.dart';
import 'package:feribot_lines/viewModels/login/register_vm.dart';
import 'package:feribot_lines/views/ferry/ferry_screen.dart';
import 'package:feribot_lines/views/login/login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../utils/colors_const.dart';
import '../../utils/theme_constants.dart';
import '../../utils/strings.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  RegisterVM _vm = Get.put(RegisterVM());
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surNameController = TextEditingController();
  TextEditingController _mailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

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
                    Form(
                      key: _vm.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            color: Get.theme.backgroundColor,
                            height: Get.size.height * 0.4,
                            width: double.infinity,
                            child: Image.asset(
                              Strings.waves,
                              fit: BoxFit.fill,
                            ),
                          ),
                          // Expanded(child: Container()),
                          customTextFormField(
                            controller: _nameController,
                            hintText: Strings.hintName,
                            icon: FontAwesomeIcons.userAlt,
                            obsecure: false,
                            textInputType: TextInputType.text,
                            validator: Validation.nameValidation,
                          ),
                          const SizedBox(height: 20),
                          customTextFormField(
                            controller: _surNameController,
                            hintText: Strings.hintSurname,
                            icon: FontAwesomeIcons.userAlt,
                            obsecure: false,
                            textInputType: TextInputType.text,
                            validator: Validation.nameValidation,
                          ),
                          const SizedBox(height: 20),
                          customTextFormField(
                            controller: _mailController,
                            hintText: Strings.hintEmail,
                            icon: FontAwesomeIcons.solidEnvelope,
                            obsecure: false,
                            textInputType: TextInputType.emailAddress,
                            validator: Validation.eMailValidation,
                          ),
                          const SizedBox(height: 16),
                          customTextFormField(
                            controller: _phoneController,
                            hintText: Strings.hintPhoneNumber,
                            icon: FontAwesomeIcons.phoneAlt,
                            obsecure: false,
                            textInputType: TextInputType.phone,
                            validator: Validation.phoneNumberValidation,
                          ),
                          const SizedBox(height: 16),
                          customTextFormField(
                            controller: _passwordController,
                            hintText: Strings.hintPassword,
                            icon: FontAwesomeIcons.key,
                            obsecure: true,
                            textInputType: TextInputType.visiblePassword,
                            validator: Validation.passwordValidation,
                          ),
                          const SizedBox(height: 16),
                          customTextFormField(
                            controller: _confirmPasswordController,
                            hintText: Strings.hintConfirmPassword,
                            icon: FontAwesomeIcons.key,
                            obsecure: true,
                            textInputType: TextInputType.visiblePassword,
                            validator: Validation.passwordValidation,
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                if (!_vm.isLoading.value) {
                                  RegisterModel model = RegisterModel();
                                  model.name = _nameController.text;
                                  model.surName = _surNameController.text;
                                  model.eMail = _mailController.text;
                                  model.phoneNumber = _phoneController.text;
                                  model.password = _passwordController.text;
                                  model.confirmPassword =
                                      _confirmPasswordController.text;
                                  _vm.register(RegisterModel());
                                }
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
                          const Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              "Kayıt yaptıktan sonra kişisel bilgilerini profil sayfandan düzenleyebilirsin.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: ColorsConstants.lightGrey,
                              ),
                            ),
                          ),
                          //  const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                "Zaten bir hesabın var mı ? ",
                                style: TextStyle(
                                    color: ColorsConstants.lightAccent),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.offAll(
                                    () => Login(),
                                    duration: const Duration(milliseconds: 300),
                                    transition: Transition.rightToLeft,
                                  );
                                },
                                child: Text(
                                  Strings.signIn,
                                  style: const TextStyle(
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
                      left: 0,
                      top: Get.size.height * 0.1,
                      right: 0,
                      child: Container(
                        margin: EdgeInsets.zero,
                        width: 100,
                        height: 100,
                        child: const Icon(
                          Icons.directions_ferry,
                          color: Colors.white,
                          size: 100,
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

  Padding customTextFormField({
    required TextEditingController controller,
    required TextInputType textInputType,
    required bool obsecure,
    required String hintText,
    required IconData icon,
    required String? Function({required String text}) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: TextFormField(
        controller: controller,
        validator: (val) {
          return validator(text: val!);
        },
        keyboardType: textInputType,
        textInputAction: TextInputAction.next,
        obscureText: obsecure,
        decoration: InputDecoration(
          prefixIconConstraints:
              const BoxConstraints(minWidth: 35, maxHeight: 35),
          prefixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(start: 12.0, end: 5.0),
            child: FaIcon(
              icon,
              size: 20,
              color: ColorsConstants.lightAccent,
            ),
          ),
          hintText: hintText,
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
    );
  }
}
