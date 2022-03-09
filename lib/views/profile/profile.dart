import 'package:feribot_lines/views/Login/login.dart';
import 'package:feribot_lines/views/profile/all_tickets.dart';
import 'package:feribot_lines/views/profile/edit_profile.dart';
import 'package:flutter/material.dart';
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
        height: Get.size.height * 0.2,
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
            Row(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorsConstants.lightAccent,
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      color: Colors.white,
                      width: 3.0,
                    ),
                  ),
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
            const SizedBox(
              height: 15.0,
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
            )
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
          // icon: Icons.border_color_rounded,
          icon: Icons.edit_note_rounded,
          suffix: const Icon(Icons.chevron_right),
          onTap: () {
            Get.to(() => EditProfile());
          }),
      ProfileMenuModel(
          title: Strings.myTickets,
          subTitle: Strings.myTicketsDes,
          iconColor: ColorsConstants.profileColor3,
          icon: Icons.confirmation_number_sharp,
          suffix: const Icon(Icons.chevron_right),
          onTap: () {
            Get.to(() => AllTickets());
          }),
      ProfileMenuModel(
          title: Strings.notifications,
          subTitle: Strings.notificationsDes,
          iconColor: ColorsConstants.profileColor4,
          icon: Icons.notifications,
          suffix: const Icon(Icons.chevron_right),
          onTap: () {
            Get.to(() => NotificationsPage());
          }),
      ProfileMenuModel(
          title: Strings.logout,
          subTitle: Strings.logoutDes,
          iconColor: ColorsConstants.profileColor5,
          icon: Icons.logout,
          onTap: () {
            Get.to(() => Login());
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
    Size deviceSize = Get.size;
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
          height: deviceSize.height * 0.09,
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
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: menu.iconColor,
                        ),
                        child: Icon(
                          menu.icon,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 15.0),
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
  {'count': '4', 'name': 'Alınan Biletler'},
  {'count': '8', 'name': 'Yolculuk Sayısı'},
  {'count': 'Rodos', 'name': 'En Çok Gidilen Liman'},
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
