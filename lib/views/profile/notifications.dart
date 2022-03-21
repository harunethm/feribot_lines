import 'package:feribot_lines/models/profile/notification_model.dart';
import 'package:feribot_lines/models/response_model.dart';
import 'package:feribot_lines/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/theme_constants.dart';
import '../../utils/strings.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Get.theme.backgroundColor,
        title: Text(
          Strings.notifications,
          style: ThemeConstants.themeTitleStyle,
        ),
      ),
      body: Column(
        children: [
          Divider(
            color: Colors.grey.shade300,
          ),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: notificationModelList.length,
          //     shrinkWrap: true,
          //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          //     physics: const BouncingScrollPhysics(),
          //     itemBuilder: (context, index) {
          //       NotificationModel model = notificationModelList[index];
          //       return Card(
          //         shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(10)),
          //         child: Padding(
          //           padding: const EdgeInsets.symmetric(
          //               horizontal: 10, vertical: 10),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text(
          //                 model.date,
          //                 style:
          //                     const TextStyle(color: Colors.grey, fontSize: 12),
          //               ),
          //               const SizedBox(
          //                 height: 5,
          //               ),
          //               Text(
          //                 model.tagLine,
          //               ),
          //               const SizedBox(
          //                 height: 5,
          //               ),
          //               Text(
          //                 model.description,
          //                 style:
          //                     const TextStyle(color: Colors.grey, fontSize: 12),
          //               ),
          //               const SizedBox(
          //                 height: 15,
          //               ),
          //               model.isTextNotification
          //                   ? Container()
          //                   : SizedBox(
          //                       height: 150,
          //                       width: MediaQuery.of(context).size.width,
          //                       child: ClipRRect(
          //                         borderRadius: BorderRadius.circular(10),
          //                         child: Image.network(
          //                           model.image,
          //                           fit: BoxFit.contain,
          //                         ),
          //                       ),
          //                     )
          //             ],
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),
          Expanded(
            child: FutureBuilder(
              future: NotificationService.getNotifications(),
              builder: (context,
                  AsyncSnapshot<ResponseModel<List<NotificationModel>>>
                      snapshot) {
                while (true) {
                  if (snapshot.data != null) {
                    ResponseModel _data = snapshot.data!;
                    List<NotificationModel> _notifs = _data.data;
                    return ListView.builder(
                      itemCount: _notifs.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        NotificationModel model = _notifs[index];
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  model.date,
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  model.tagLine,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  model.description,
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                model.isTextNotification
                                    ? Container()
                                    : SizedBox(
                                        height: 150,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            model.image,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
