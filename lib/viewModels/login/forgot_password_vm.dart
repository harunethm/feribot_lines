import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:feribot_lines/models/response_model.dart';
import 'package:feribot_lines/views/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/login.dart';
import '../../utils/colors_const.dart';

class ForgotPasswordVM extends GetxController {
  RxBool isLoading = false.obs;
  var mailFormKey = GlobalKey<FormState>();

  forgotPassword(String mail) {
    if (mailFormKey.currentState!.validate()) {
      isLoading.value = true;
      isLoading.refresh();
      LoginService.forgotPassword(mail).then(
        (ResponseModel response) {
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
            Get.offAll(Login());
          }
        },
      );
    }
  }
}
