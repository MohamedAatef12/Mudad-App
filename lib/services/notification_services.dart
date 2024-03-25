// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import "package:timezone/data/latest.dart" as tz;
// import 'package:timezone/timezone.dart' as tz;
//
// class NotificationApi {
//   static bool notificationEnabled = false;
//   static final notifications = FlutterLocalNotificationsPlugin();
//
//   static Future<void> initializeTimeZone() async {
//     tz.initializeTimeZones();
//   }
//
//   static Future<void> sendNotificationAtSpecificTime(TimeOfDay time) async {
//     await initializeTimeZone();
//     DateTime now = DateTime.now();
//     DateTime scheduledDate =
//         DateTime(now.year, now.month, now.day, time.hour, time.minute);
//     if (scheduledDate.isBefore(now)) {
//       scheduledDate = scheduledDate.add(const Duration(days: 1));
//     }
//     print(now);
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       '0',
//       'madad',
//
//       playSound: true,
//       importance: Importance.max,
//       priority: Priority.high,
//       styleInformation: BigTextStyleInformation(
//           'لَن تَنَالُوا الْبِرَّ حَتَّىٰ تُنفِقُوا مِمَّا تُحِبُّونَ وَمَا تُنفِقُوا مِن شَيْءٍ فَإِنَّ اللَّـهَ بِهِ عَلِيمٌ'),
//     );
//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);
//
//     // Schedule the notification
//     await notifications.zonedSchedule(
//       0,
//       'Madad daily reminder',
//       'لَن تَنَالُوا الْبِرَّ حَتَّىٰ تُنفِقُوا مِمَّا تُحِبُّونَ وَمَا تُنفِقُوا مِن شَيْءٍ فَإِنَّ اللَّـهَ بِهِ عَلِيمٌ',
//       tz.TZDateTime.from(scheduledDate, tz.local),
//       platformChannelSpecifics,
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       payload: 'single_notification',
//     );
//   }
//
//   static Future<void> cancel() async {
//     await notifications.cancel(0);
//   }
// }
