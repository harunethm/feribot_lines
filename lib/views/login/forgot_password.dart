import 'package:feribot_lines/views/login/login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../utils/colors_const.dart';
import '../../utils/strings.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

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
                        // Expanded(child: Container()),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: Text(
                              Strings.forgotPassword,
                              style: const TextStyle(
                                  fontSize: 19.0, fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            )),
                        const SizedBox(height: 15),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: Text(
                              Strings.forgotPassDesc,
                              style: const TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            )),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: TextField(
                            onChanged: (text) {},
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              prefixIconConstraints: const BoxConstraints(
                                  minWidth: 35, maxHeight: 35),
                              prefixIcon: Padding(
                                padding: const EdgeInsetsDirectional.only(
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
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: Container(
                              padding:
                                  const EdgeInsets.only(top: 15, bottom: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: ColorsConstants.lightPrimary),
                              child: Center(
                                child: Text(
                                  Strings.send,
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
                              () => Login(),
                              duration: Duration(milliseconds: 300),
                              transition: Transition.rightToLeft,
                            ),
                          },
                          clipBehavior: Clip.hardEdge,
                          child: Text(
                            Strings.getBack,
                            style: TextStyle(
                              color: ColorsConstants.lightAccent,
                              letterSpacing: 2,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Expanded(child: Container()),
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
