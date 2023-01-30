import 'package:feribot_lines/models/others/user.dart';
import 'package:feribot_lines/utils/colors_const.dart';
import 'package:feribot_lines/utils/theme_constants.dart';
import 'package:feribot_lines/utils/strings.dart';
import 'package:feribot_lines/utils/validations.dart';
import 'package:feribot_lines/viewModels/ferry/ferry_information_vm.dart';
import 'package:feribot_lines/views/payment/payment.dart';
import 'package:feribot_lines/widgets/custom_dropdown.dart';
import 'package:feribot_lines/widgets/custom_ferry_information_card.dart';
import 'package:feribot_lines/widgets/custom_price_info_card.dart';
import 'package:feribot_lines/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class FerryInformation extends StatelessWidget {
  FerryInformation({Key? key}) : super(key: key);

  final FerryInformationVM _vm = Get.find();

  final RxInt _currentPage = 0.obs;

  @override
  Widget build(BuildContext context) {
    _vm.init();
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      appBar: appBar(),
      body: Container(
        height: Get.size.height,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        color: ColorsConstants.lightGrey.withAlpha(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.size.height * .01,
              ),
              CustomFerryInfoCard(),
              SizedBox(
                height: Get.size.height * .01,
              ),
              CustomPriceInfoCard(),
              SizedBox(
                height: Get.size.height * .01,
              ),
              contactInfo(),
              SizedBox(
                height: Get.size.height * .01,
              ),
              passengerInfoCard(),
              SizedBox(
                height: Get.size.height * .01,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomButton(),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Get.theme.backgroundColor,
      elevation: 2,
      title: Text(
        Strings.booking,
        style: ThemeConstants.themeTitleStyle,
      ),
    );
  }

  Widget contactInfo() {
    return Card(
      color: Get.theme.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "İletişim Bilgileri",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            contactInfoView(),
          ],
        ),
      ),
    );
  }

  Widget contactInfoView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            "Ad",
            "Adınız",
            Icons.person,
            TextInputType.name,
            value: _vm.contactInfo.firstname ?? "",
            onChange: (newVal) {
              _vm.contactInfo.firstname = newVal;
              return;
            },
            validation: (val) {
              return Validation.nameValidation(text: val!);
            },
          ),
          CustomTextFormField(
            "Soyad",
            "Soyadınız",
            Icons.person,
            TextInputType.name,
            value: _vm.contactInfo.lastname ?? "",
            onChange: (newVal) {
              _vm.contactInfo.lastname = newVal;
              return;
            },
            validation: (val) {
              return Validation.surNameValidation(text: val!);
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Telefon Kodu",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: Obx(
                      () => CustomDropDown(
                        items: _vm.phoneCodes,
                        value: _vm.contactInfo.phoneCode.value,
                        onChange: (val) {
                          _vm.contactInfo.phoneCode.value = _vm.phoneCodes
                              .firstWhere((element) => element.key == val!)
                              .key;
                          return;
                        },
                        bgColor: ColorsConstants.lightPrimary2,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          CustomTextFormField(
            "Telefon",
            "Telefon Numaranız",
            Icons.phone,
            TextInputType.phone,
            value: _vm.contactInfo.phone.toString(),
            onChange: (val) {
              _vm.contactInfo.phone = val;
              return;
            },
            validation: (val) {
              return Validation.phoneNumberValidation(text: val!);
            },
          ),
          CustomTextFormField(
            "E-Mail",
            "Mail Adresiniz",
            Icons.mail,
            TextInputType.emailAddress,
            value: _vm.contactInfo.mailperm.toString(),
            onChange: (val) {
              _vm.contactInfo.email = val;
              return;
            },
            validation: (val) {
              return Validation.eMailValidation(text: val!);
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Sefer ve bilet bilgilerinizi e-posta ve ücretsiz SMS yoluyla ileteceğiz.",
              style: TextStyle(
                color: ColorsConstants.lightGrey,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
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
                  value: _vm.contactInfo.mailperm.value == "1",
                  onChanged: (bool? value) {
                    _vm.contactInfo.mailperm.value =
                        (value ?? false) ? "1" : "0";
                  },
                ),
              ),
              Expanded(
                child: Text(
                  Strings.confirmSMS,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey.shade800,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget passengerInfoCard() {
    return Card(
      color: Get.theme.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Bilet Bilgileri",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ResponsiveGridList(
              shrinkWrap: true,
              horizontalGridMargin: 10,
              verticalGridMargin: 10,
              verticalGridSpacing: 10,
              horizontalGridSpacing: 10,
              minItemWidth: Get.size.width * .2,
              rowMainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _vm.passengers
                  .map(
                    (e) => ElevatedButton(
                      onPressed: () {
                        _vm.pageController.animateToPage(
                          e.pageNumber,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      child: Obx(() => Text(e.title.value)),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(
              height: 5,
            ),
            Obx(
              () => SizedBox(
                height: 580,
                child: PageView.builder(
                  controller: _vm.pageController,
                  itemCount: _vm.passengers.length,
                  itemBuilder: (context, index) {
                    return passengerInfoView(_vm.passengers[index]);
                  },
                  onPageChanged: (curr) {
                    _currentPage.value = curr;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget passengerInfoView(InfoModel passenger) {
    User user = passenger.user;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
            child: Text(
              passenger.title.value,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
          CustomTextFormField(
            "Ad",
            "Adınız",
            FontAwesomeIcons.userAlt,
            TextInputType.name,
            value: user.firstname.toString(),
            onChange: (newVal) {
              user.firstname = newVal;
              return;
            },
            validation: (val) {
              return Validation.nameValidation(text: val!);
            },
          ),
          CustomTextFormField(
            "Soyad",
            "Soyadınız",
            FontAwesomeIcons.userAlt,
            TextInputType.name,
            value: user.lastname.toString(),
            onChange: (newVal) {
              user.lastname = newVal;
              return;
            },
            validation: (val) {
              return Validation.surNameValidation(text: val!);
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Doğum Tarihi",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => CustomDropDown(
                      items: _vm.days,
                      value: user.birthday!.value.day,
                      onChange: (val) {
                        user.birthday!.value = DateTime(
                          user.birthday!.value.year,
                          user.birthday!.value.month,
                          val ?? 0,
                        );
                      },
                      bgColor: ColorsConstants.lightPrimary2,
                    ),
                  ),
                  Obx(
                    () => CustomDropDown(
                      items: _vm.months,
                      value: user.birthday!.value.month,
                      onChange: (val) {
                        user.birthday!.value = DateTime(
                          user.birthday!.value.year,
                          val ?? 0,
                          user.birthday!.value.day,
                        );
                      },
                      bgColor: ColorsConstants.lightPrimary2,
                    ),
                  ),
                  Obx(
                    () => CustomDropDown(
                      items: _vm.years,
                      value: user.birthday!.value.year,
                      onChange: (val) {
                        user.birthday!.value = DateTime(
                          val ?? 0,
                          user.birthday!.value.month,
                          user.birthday!.value.day,
                        );
                      },
                      bgColor: ColorsConstants.lightPrimary2,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Uyruk",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: Obx(
                      () => CustomDropDown(
                        items: _vm.nations,
                        value: user.countryCode.value,
                        onChange: (val) {
                          user.countryCode.value = val ?? -1;
                          if (val != 90 && user.identitynumber!.isNotEmpty) {
                            user.identitynumber = "";
                          }
                        },
                        bgColor: ColorsConstants.lightPrimary2,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          CustomTextFormField(
            "Pasaport Numarası",
            "Pasaport Numaranız",
            FontAwesomeIcons.passport,
            TextInputType.phone,
            value: user.passportnumber.toString(),
            onChange: (newVal) {
              user.passportnumber = newVal;
              return;
            },
            validation: (val) {
              return Validation.passportNumberValidation(text: val!);
            },
          ),
          Obx(
            () => Visibility(
              visible: user.countryCode.value == "90",
              child: CustomTextFormField(
                "TC Kimlik No",
                "Türkiye Cumhuriyeti Kimlik Numaranız",
                FontAwesomeIcons.idCard,
                TextInputType.phone,
                value: user.identitynumber.toString(),
                onChange: (newVal) {
                  user.identitynumber = newVal;
                  return;
                },
                validation: (val) {
                  return Validation.identificationNumberValidation(text: val!);
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Cinsiyet",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Obx(
                        () => Radio<bool>(
                          value: true,
                          groupValue: user.gender.value == "male",
                          onChanged: (val) {
                            user.gender.value =
                                (val ?? false) ? "male" : "female";
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          user.gender.value = "male";
                        },
                        child: Text(Strings.male),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Row(
                    children: [
                      Obx(
                        () => Radio<bool>(
                          value: false,
                          groupValue: user.gender.value == "male",
                          onChanged: (val) {
                            user.gender.value =
                                (val ?? false) ? "female" : "male";
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          user.gender.value = "female";
                        },
                        child: Text(Strings.female),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget bottomButton() {
    return InkWell(
      onTap: () {
        if (/*_vm.isSuccess()*/ true) {
          // OrderService.createOrder(
          //   user: user,
          // );
          Get.to(
            () => Payment(),
            duration: Duration(milliseconds: 300),
            transition: Transition.rightToLeft,
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12, right: 16, left: 16),
        padding: const EdgeInsets.only(top: 12, bottom: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorsConstants.lightPrimary,
        ),
        child: Text(
          Strings.continueText,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
