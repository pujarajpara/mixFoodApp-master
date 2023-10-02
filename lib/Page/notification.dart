

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mixfoodapp/Constants/Color.dart';
import 'package:mixfoodapp/controller/lan_change_controller.dart';
import 'package:mixfoodapp/local_notidication.dart';
import 'package:provider/provider.dart';

import 'package:timezone/timezone.dart' as tz;

FlutterLocalNotificationsPlugin _localNotification =
    FlutterLocalNotificationsPlugin();

class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  _notificationState createState() => _notificationState();
}

class _notificationState extends State<notification> {
  List<String> notifications = ['All', 'Unread', 'Read'];

  @override
  void initState() {
    super.initState();
    LocalNotification.initilization();
    LocalNotification();
    _localNotification = FlutterLocalNotificationsPlugin();
  }

  void showImmediateNotification() {
    LocalNotification.showBigTextNotification(
      id: 0,
      title: 'Hello',
      body: 'Good Morning.',
    );
  }

  Future<void> showDelayedNotification() async {
    await Future.delayed(const Duration(minutes: 10));
    await LocalNotification.showBigTextNotification(
      id: 1,
      title: 'Hello',
      body: 'This is a delayed notification after 10 minutes.',
    );
  }

  Future<void> _showPopupMenu(BuildContext context) async {
    final selectedValue = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 150,
          child: SimpleDialog(
            backgroundColor: Colors.white,
            title: Text(AppLocalizations.of(context)!.selectNotificationOption,
              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 'immediate_notification',);
                },
                child:
                    Text(AppLocalizations.of(context)!.showImmediateNotification,style: const TextStyle(fontSize: 15),),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 'delayed_notification');
                },
                child:
                    Text(AppLocalizations.of(context)!.showDelayedNotification,style: const TextStyle(fontSize: 15),),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 'schedule_notification');
                },
                child: Text(AppLocalizations.of(context)!.scheduleNotification,style: const TextStyle(fontSize: 15),),
              ),
            ],
          ),
        );
      },
    );

    if (selectedValue == 'immediate_notification') {
      showImmediateNotification();
    } else if (selectedValue == 'delayed_notification') {
      showDelayedNotification();
    } else if (selectedValue == 'schedule_notification') {
      _showDateTimePickers(context);
    }
  }

  Future<void> _showDateTimePickers(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (selectedDate != null) {
      final selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (selectedTime != null) {
        final scheduledDateTime = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          selectedTime.hour,
          selectedTime.minute,
        );
        _scheduleNotification(scheduledDateTime);
      }
    }
  }

  Future<void> _scheduleNotification(DateTime scheduledDateTime) async {
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your_channel_id',
      'Scheduled Notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    final platformChannelSpecifics =
        const NotificationDetails(android: androidPlatformChannelSpecifics);

    await _localNotification.zonedSchedule(
      2,
      'Scheduled Notification',
      'This notification is scheduled for $scheduledDateTime',
      tz.TZDateTime.from(scheduledDateTime, tz.local),
      platformChannelSpecifics,
      payload: 'Scheduled Notification',
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation
              .absoluteTime, // Specify interpretation
    );
  }

  // void _showPopupMenu(BuildContext context) {
  //   final button = context.findRenderObject() as RenderBox;
  //   final offset = button.localToGlobal(Offset.zero);
  //   final position = RelativeRect.fromLTRB(
  //     offset.dx,
  //     offset.dy + 50,
  //     offset.dx + button.size.width,
  //     offset.dy + 50,
  //   );
  //
  //   showMenu(
  //     context: context,
  //     position: position,
  //     items: [
  //       const PopupMenuItem(
  //         value: 'show_notification',
  //         child: Text('Show Notification'),
  //       ),
  //       const PopupMenuItem(
  //         value: 'show_notification_delayed',
  //         child: Text('Show Notification 10 Minutes Later'),
  //       ),
  //       const PopupMenuItem(
  //         value: 'schedule_notification',
  //         child: Text('Schedule Notification'),
  //       )
  //     ],
  //     elevation: 8.0,
  //   ).then((value) {
  //     if (value == 'show_notification') {
  //       showImmediateNotification();
  //     } else if (value == 'show_notification_delayed') {
  //       showDelayedNotification();
  //     }
  //   });
  // }

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
            indicator: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
              child: TabBarView(
                children: [],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
              ),
              child: GestureDetector(
                onTap: () {
                  _showPopupMenu(context);
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
                          style: const TextStyle(
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
                          style: const TextStyle(
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
              padding: const EdgeInsets.only(left: 40, top: 20),
              child: Text(
                AppLocalizations.of(context)!.yesterday,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
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
                              style: TextStyle(
                                color: ColorsNeutral.Neutral40,
                              ),
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
              )),
            )
          ],
        ),
      ),
    );
  }
}
