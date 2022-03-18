import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:feribot_lines/viewModels/ferry/ferry_information_vm.dart';
import 'package:feribot_lines/widgets/custom_dropdown.dart';
import 'package:feribot_lines/widgets/custom_ferry_information_card.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../models/key_value_model.dart';
import '../../utils/colors_const.dart';
import '../../utils/const.dart';
import '../../utils/strings.dart';
import '../../widgets/custom_price_info_card.dart';
import '../../widgets/custom_text_form_field.dart';
import '../payment/payment.dart';

class FerryInformation extends StatelessWidget {
  FerryInformation({Key? key}) : super(key: key);

  final FerryInformationVM _vm = Get.put(FerryInformationVM());

  RxInt currentPage = 0.obs;

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
        style: Constants.themeTitleStyle,
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
            Obx(
              () => ResponsiveGridList(
                horizontalGridMargin: 10,
                verticalGridMargin: 10,
                minItemWidth: Get.size.width * .2,
                rowMainAxisAlignment: MainAxisAlignment.spaceEvenly,
                shrinkWrap: true,
                children: _vm.passengers
                    .map(
                      (e) => ElevatedButton(
                        onPressed: () {
                          _vm.pageController.animateToPage(
                            e.pageNumber.value,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text(e.title.value),
                      ),
                    )
                    .toList(),
              ),
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
                    currentPage.value = curr;
                  },
                ),
              ),
            ),
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
          const CustomTextFormField(
            "Ad",
            "Adınız",
            Icons.person,
            TextInputType.name,
          ),
          const CustomTextFormField(
            "Soyad",
            "Soyadınız",
            Icons.person,
            TextInputType.name,
          ),
          const CustomTextFormField(
            "Telefon",
            "Telefon Numaranız",
            Icons.phone,
            TextInputType.phone,
          ),
          const CustomTextFormField(
            "E-Mail",
            "Mail Adresiniz",
            Icons.mail,
            TextInputType.emailAddress,
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
                  value: _vm.confirmSMS.value,
                  onChanged: (bool? value) {
                    _vm.confirmSMS.value = value!;
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

  Widget passengerInfoView(PassengerModel passenger) {
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
          const CustomTextFormField(
            "Ad",
            "Adınız",
            FontAwesomeIcons.userAlt,
            TextInputType.name,
          ),
          const CustomTextFormField(
            "Soyad",
            "Soyadınız",
            FontAwesomeIcons.userAlt,
            TextInputType.name,
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 2,
                    child: Obx(
                      () => CustomDropDown(
                        items: _vm.days,
                        value: passenger.birthDay.value,
                        onChange: (val) {
                          passenger.birthDay.value = val!;
                        },
                        bgColor: ColorsConstants.lightPrimary2,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 3,
                    child: Obx(
                      () => CustomDropDown(
                        items: _vm.months,
                        value: passenger.birthMonth.value,
                        onChange: (val) {
                          passenger.birthMonth.value = val!;
                        },
                        bgColor: ColorsConstants.lightPrimary2,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 3,
                    child: Obx(
                      () => CustomDropDown(
                        items: _vm.years,
                        value: passenger.birthYear.value,
                        onChange: (val) {
                          passenger.birthYear.value = val!;
                        },
                        bgColor: ColorsConstants.lightPrimary2,
                      ),
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
                        value: passenger.nationalityCode.value,
                        onChange: (val) {
                          passenger.nationalityCode.value = val!;
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
          const CustomTextFormField(
            "Pasaport Numarası",
            "Pasaport Numaranız",
            FontAwesomeIcons.passport,
            TextInputType.phone,
          ),
          const CustomTextFormField(
            "TC Kimlik No",
            "Türkiye Cumhuriyeti Kimlik Numaranız",
            FontAwesomeIcons.idCard,
            TextInputType.phone,
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
                          groupValue: passenger.genderIsMale.value,
                          onChanged: (val) {
                            passenger.genderIsMale.value = val!;
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          passenger.genderIsMale.value = true;
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
                          groupValue: passenger.genderIsMale.value,
                          onChanged: (val) {
                            passenger.genderIsMale.value = val!;
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          passenger.genderIsMale.value = false;
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
        Get.to(
          () => Payment(),
          duration: Duration(milliseconds: 300),
          transition: Transition.rightToLeft,
        );
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
}
