import 'package:feribot_lines/views/Login/login.dart';
import 'package:feribot_lines/views/ferry/ferry_screen.dart';
import 'package:feribot_lines/views/profile/all_tickets.dart';
import 'package:feribot_lines/views/profile/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../utils/colors_const.dart';
import '../../utils/common_functions.dart';
import '../../utils/strings.dart';
import 'notifications.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Profil",
          style: titleStyle,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Material(
          color: Theme.of(context).backgroundColor,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 10.0,
            ),
            child: Column(
              //mainAxisSize: M ainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                profileDetail(
                  "assets/images/fethiye-rodos-ferry-tilos.jpg",
                  "Kullanıcı Adı",
                  "E-Mail Adresi",
                  "Telefon Numarası",
                ),
                const SizedBox(
                  height: 20,
                ),
                profileMenu(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget profileDetail(
    String imagePath,
    String name,
    String eMail,
    String phone,
  ) {
    debugPrint(imagePath);
    return Material(
      borderRadius: const BorderRadius.all(
        Radius.circular(20.0),
      ),
      elevation: 10.0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: const BoxDecoration(
          color: ColorsConstants.lightAccent,
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: Get.size.height * .02,
            ),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Center(
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          shape: BoxShape.circle,
                          color: ColorsConstants.lightPrimary2,
                        ),
                        child: Center(
                          child: Text(
                            "HÇ",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      eMail,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      phone,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: Get.size.height * .02,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                for (var item in profileItems)
                  Column(
                    children: <Widget>[
                      Text(
                        item['count'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        item['name'],
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            SizedBox(
              height: Get.size.height * .02,
            ),
          ],
        ),
      ),
    );
  }

  Widget profileMenu() {
    List<ProfileMenuModel> profileMenuList = [
      ProfileMenuModel(
          title: Strings.editProfile,
          subTitle: Strings.editProfileDes,
          iconColor: ColorsConstants.profileColor1,
          icon: FontAwesomeIcons.userEdit,
          suffix: const FaIcon(
            FontAwesomeIcons.chevronRight,
            size: 20,
            color: Colors.black54,
          ),
          onTap: () {
            Get.to(
              () => EditProfile(),
              duration: Duration(milliseconds: 300),
              transition: Transition.rightToLeft,
            );
          }),
      ProfileMenuModel(
          title: Strings.myTickets,
          subTitle: Strings.myTicketsDes,
          iconColor: ColorsConstants.profileColor3,
          icon: FontAwesomeIcons.ticketAlt,
          suffix: const FaIcon(
            FontAwesomeIcons.chevronRight,
            size: 20,
            color: Colors.black54,
          ),
          onTap: () {
            Get.to(
              () => AllTickets(),
              duration: Duration(milliseconds: 300),
              transition: Transition.rightToLeft,
            );
          }),
      ProfileMenuModel(
          title: Strings.notifications,
          subTitle: Strings.notificationsDes,
          iconColor: ColorsConstants.profileColor4,
          icon: FontAwesomeIcons.solidBell,
          suffix: const FaIcon(
            FontAwesomeIcons.chevronRight,
            size: 20,
            color: Colors.black54,
          ),
          onTap: () {
            Get.to(
              () => NotificationsPage(),
              duration: Duration(milliseconds: 300),
              transition: Transition.rightToLeft,
            );
          }),
      ProfileMenuModel(
          title: Strings.logout,
          subTitle: Strings.logoutDes,
          iconColor: ColorsConstants.profileColor5,
          icon: FontAwesomeIcons.signOutAlt,
          onTap: () {
            Get.to(
              () => Login(),
              duration: Duration(milliseconds: 300),
              transition: Transition.rightToLeft,
            );
          }),
    ];
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        for (var menu in profileMenuList)
          menuItem(
            menu,
          ),
      ],
    );
  }

  Widget menuItem(ProfileMenuModel menu) {
    return GestureDetector(
      onTap: () => menu.onTap(),
      child: Card(
        margin: const EdgeInsets.only(bottom: 10),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              30.0,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: menu.iconColor,
                      ),
                      child: Icon(
                        menu.icon,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              menu.title,
                              style: const TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                menu.subTitle,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              menu.suffix ?? Container(),
            ],
          ),
        ),
      ),
    );
  }
}

const List profileItems = [
  {'count': '+20 ₺', 'name': 'Onay Bekleyen'},
  {'count': '40 ₺', 'name': 'Para Puan'},
  {'count': '80 ₺', 'name': 'Cüzdan Bakiyesi'},
];

class ProfileMenuModel {
  String title;
  String subTitle;
  IconData icon;
  Color iconColor;
  VoidCallback onTap;
  Widget? suffix;
  ProfileMenuModel({
    required this.icon,
    required this.title,
    required this.iconColor,
    required this.subTitle,
    required this.onTap,
    this.suffix,
  });
}

class ProfileCategory {
  String name;
  IconData icon;
  int number;
  ProfileCategory(
      {required this.icon, required this.name, required this.number});
}
