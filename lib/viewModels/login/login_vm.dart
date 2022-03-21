import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:feribot_lines/models/login/login_model.dart';
import 'package:feribot_lines/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/login.dart';
import '../../utils/colors_const.dart';
import '../../views/ferry/ferry_screen.dart';

class LoginVM extends GetxController {
  RxBool isLoading = false.obs;
  var formKey = GlobalKey<FormState>();

  loginUser(LoginModel model) {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      isLoading.refresh();
      LoginService.login(model.name, model.password).then(
        (response) {
          isLoading.value = false;
          isLoading.refresh();
          if (response.error) {
            var _dialog = AwesomeDialog(
              context: Get.context!,
              dialogType: DialogType.WARNING,
              animType: AnimType.BOTTOMSLIDE,
              headerAnimationLoop: false,
              title: "Bir terslik var!",
              desc: response.errorMessage,
              btnOkText: "Tamam",
              btnOkColor: ColorsConstants.lightPrimary,
              btnOkOnPress: () {},
            );

            _dialog.show();
          } else {
            // TODO devam ettir
            USER.name = model.name;
            Get.offAll(() => FerryScreen());
          }
        },
      );
    }
  }
}
