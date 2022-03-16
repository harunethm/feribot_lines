import 'package:feribot_lines/views/ferry/ferry_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../utils/colors_const.dart';
import '../utils/strings.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final RxInt numPages = 3.obs;
  final PageController _pageController = PageController(initialPage: 0);
  RxInt currentPage = 0.obs;

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white.withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < numPages.value; i++) {
      list.add(
        i == currentPage.value ? _indicator(true) : _indicator(false),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // stops: [0.1, 0.5],
            colors: [
              ColorsConstants.lightPrimary,
              ColorsConstants.lightPrimary2,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.only(right: 10.0, top: 15.0),
                  child: InkWell(
                    onTap: () {
                      // _pageController.jumpToPage(2); // for regular jump
                      _pageController.animateToPage(
                        2,
                        curve: Curves.decelerate,
                        duration: const Duration(milliseconds: 300),
                      );
                    },
                    child: Text(
                      Strings.skip,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.zero,
                  height: Get.size.height * 0.7,
                  child: PageView(
                    physics: const ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      currentPage(page);
                    },
                    children: <Widget>[
                      walktroughtPage(
                          "assets/icons/01.png",
                          Strings.splashScreenTitle1,
                          Strings.splashScreenDescription1),
                      walktroughtPage(
                          "assets/icons/02.png",
                          Strings.splashScreenTitle2,
                          Strings.splashScreenDescription2),
                      walktroughtPage(
                          "assets/icons/03.png",
                          Strings.splashScreenTitle3,
                          Strings.splashScreenDescription3),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                currentPage.value != numPages.value - 1
                    ? Expanded(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: () {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.only(right: 10.0, top: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    Strings.next,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.0,
                                    ),
                                  ),
                                  const SizedBox(width: 10.0),
                                  const FaIcon(
                                    FontAwesomeIcons.arrowRight,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                  const SizedBox(width: 10.0),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Obx(
        () {
          return currentPage.value == numPages.value - 1
              ? InkWell(
                  onTap: () {
                    Get.offAllNamed(
                      "/FerryScreen",
                    );
                  },
                  child: Container(
                    height: Get.size.height * 0.1,
                    width: double.infinity,
                    color: Colors.white,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                        child: Text(
                          Strings.getStarted,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink();
        },
      ),
    );
  }

  Padding walktroughtPage(
      String assetImagePath, String title, String description) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: Colors.white12),
              child: Image(
                image: AssetImage(
                  assetImagePath,
                ),
                height: Get.size.height * 0.3,
                width: 400.0,
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15.0),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
