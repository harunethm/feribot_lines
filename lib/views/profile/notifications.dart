import 'package:flutter/material.dart';

import '../../utils/theme_constants.dart';
import '../../utils/strings.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
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
          Expanded(
            child: ListView.builder(
              itemCount: notificationModelList.length,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                NotificationModel model = notificationModelList[index];
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
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 12),
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
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        model.isTextNotification
                            ? Container()
                            : SizedBox(
                                height: 150,
                                width: MediaQuery.of(context).size.width,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
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
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationModel {
  String date;
  String tagLine;
  String image;
  String description;
  bool isTextNotification;

  NotificationModel(
    this.date,
    this.tagLine,
    this.image,
    this.description,
    this.isTextNotification,
  );
}

List<NotificationModel> notificationModelList = notificationDataList
    .map((item) => NotificationModel(
        item['date'].toString(),
        item['tagLine'].toString(),
        item['image'].toString(),
        item['description'].toString(),
        item['isTextNotification'] as bool))
    .toList();

var notificationDataList = [
  {
    "date": "Oct 7,2021",
    "tagLine": "Read your fav 📙 in Valleys of shimla",
    "image":
        "https://cdn.grabon.in/gograbon/images/web-images/uploads/1617092437646/hotel-offers.jpg",
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. L",
    "isTextNotification": false
  },
  {
    "date": "Oct 12,2021",
    "tagLine": "Have uoy Evere Fallen in Love?💝",
    "image":
        "https://www.easemytrip.com/images/hotel-img/emtfab-12oct20-lp.png",
    "description":
        "Lorem Ipsum has been the industry's standard dummy text ever  since the 1500s, when an unknown printer took a galley of type a",
    "isTextNotification": false
  },
  {
    "date": "Oct 18,2021",
    "tagLine": "🎁 Your Durga Puja Gift is Here",
    "image": "",
    "description":
        "Semarang City is the capital city of Central Java Province, Indonesia as well as the fifth largest metropolitan city in Indonesia",
    "isTextNotification": true
  },
  {
    "date": "Aug 31,2021",
    "tagLine": "Now is your chance 🙂 ",
    "image": "",
    "description":
        "Semarang City is the capital city of Central Java Province, Indonesia as well as the fifth largest metropolitan city in Indonesia",
    "isTextNotification": true
  },
  {
    "date": "Aug 16,2021",
    "tagLine": "Lake Boat Rides with Palace Views..",
    "image":
        "https://images.unsplash.com/photo-1514116799412-5876d319c242?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=704&q=80",
    "description":
        "survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    "isTextNotification": false
  },
  {
    "date": "Jul 10,2021",
    "tagLine": "Book 🚇 Ticket with ZERO* Cancellation",
    "image":
        "https://images.unsplash.com/photo-1514116799412-5876d319c242?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=704&q=80",
    "description":
        "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin",
    "isTextNotification": true
  },
  {
    "date": "Jul 14,2021",
    "tagLine": "Book 🚇 Ticket with ZERO* Cancellation",
    "image":
        "https://images.unsplash.com/photo-1514116799412-5876d319c242?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=704&q=80",
    "description": "RENINDER: Get your Leaves Approved! 🌿",
    "isTextNotification": true
  }
];
