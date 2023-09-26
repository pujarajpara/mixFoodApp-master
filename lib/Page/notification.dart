import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:mixfoodapp/Constants/Color.dart';
import 'package:mixfoodapp/controller/lan_change_controller.dart';
import 'package:provider/provider.dart';


import 'package:mixfoodapp/local_notidication.dart';

class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  List<String> notifications = ['All', 'Unread', 'Read'];
  int isSec = 0;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final notificationList =
        Provider.of<LanguageChangeControllerProvider>(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            AppLocalizations.of(context)!.notification,
            style: const TextStyle(color: Colors.black, fontSize: 24),
          ),
          actions: [
            Image.asset('Assets/union.png'),
          ],
          backgroundColor: Colors.white,
          bottom: TabBar(
            tabs: notifications
                .map((notification) => Tab(text: notification))
                .toList(),

            // onTap: switchTab,
            indicator: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            //],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: 60,
                child: TabBarView(
                  children: [
                    NotificationList(type: 'All'),
                    NotificationList(type: 'Unread'),
                    NotificationList(type: 'read'),
                  ],
                ),
                // child: TabBar(
                //   padding: const EdgeInsets.all(8),
                //   tabs: const [
                //     Tab(text: 'All'),
                //     Tab(text: 'Unread'),
                //     Tab(text: 'Read')
                //   ],
                //   indicator: BoxDecoration(
                //     color: Colors.red,
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   labelColor: Colors.white,
                //   unselectedLabelColor: Colors.black,
                // ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 20, left: 20),
            //   child: SizedBox(
            //     height: 60,
            //     child: ListView.builder(
            //         scrollDirection: Axis.horizontal,
            //         itemCount: 3,
            //         itemBuilder: (context, index) {
            //           return GestureDetector(
            //             onTap: () {
            //               setState(() {
            //                 isSec = index;
            //               });
            //             },
            //             child: Container(
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10),
            //                 color:
            //                     index == isSec ? Colors.red : Colors.transparent,
            //               ),
            //               margin: const EdgeInsets.all(10),
            //               width: 107,
            //               height: 34,
            //               child: Center(
            //                 child: Text(
            //                   notification[index].toString(),
            //                   style: TextStyle(
            //                       color:
            //                           index == isSec ? Colors.white : Colors.red,
            //                       fontSize: 12),
            //                 ),
            //               ),
            //             ),
            //           );
            //         }),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 20),
              child: GestureDetector(
                onTap: () {
                  LocalNotification.showBigTextNotification(
                    id: 0,
                    title: 'hii',
                    body: 'hello',
                  );
                },
                child: Text(
                  AppLocalizations.of(context)!.today,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorsNeutral.Neutral20,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 28),
                    child: Image.asset('Assets/notif.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.newrecipe,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            AppLocalizations.of(context)!
                                .farfarawaybehindthewordmountainsfarfromthecountries,
                            style: TextStyle(
                              color: ColorsNeutral.Neutral40,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorsNeutral.Neutral20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 28),
                      child: Image.asset('Assets/notif.png')),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          AppLocalizations.of(context)!
                              .dontforgettotryyoursavedrecipe,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            AppLocalizations.of(context)!
                                .farfarawaybehindthewordmountainsfarfromthecountries,
                            style: TextStyle(
                              color: ColorsNeutral.Neutral40,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, top: 20),
              child: Text(
                AppLocalizations.of(context)!.yesterday,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorsNeutral.Neutral20,
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 28),
                        child: Image.asset('Assets/notif.png')),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            AppLocalizations.of(context)!
                                .dontforgettotryyoursavedrecipe,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              AppLocalizations.of(context)!
                                  .farfarawaybehindthewordmountainsfarfromthecountries,
                              style: TextStyle(color: ColorsNeutral.Neutral40),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.yourreallset,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: ColorsNeutral.Neutral40),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NotificationList extends StatelessWidget {
  final String type;

  NotificationList({required this.type});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Replace with the actual number of notifications
      itemBuilder: (context, index) {
        // return ListTile(
        //   title: Text('Notification $index'),
        //   subtitle: const Text('This is a notification message.'),
        //   trailing: Icon(Icons.arrow_forward),
        //   onTap: () {
        //     // Handle the notification tap event
        //   },
        // );
      },
    );
  }
}
