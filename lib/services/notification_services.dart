import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationApi {
  static bool notificationEnabled = false;
  static final notifications = FlutterLocalNotificationsPlugin();
  static Future<void> cancel() async{
  await notifications.cancel(0);
}

  static Future<void> sendNotifications() async {
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
        '0',
        'madad',
        'madadNotifications',
        playSound: true,
        importance: Importance.max,
        priority: Priority.high,
        styleInformation: BigTextStyleInformation(
            'لَن تَنَالُوا الْبِرَّ حَتَّىٰ تُنفِقُوا مِمَّا تُحِبُّونَ وَمَا تُنفِقُوا مِن شَيْءٍ فَإِنَّ اللَّـهَ بِهِ عَلِيمٌ'),
      );
      const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
      await notifications.periodicallyShow(
        0,
        'Madad daily reminder',
        'لَن تَنَالُوا الْبِرَّ حَتَّىٰ تُنفِقُوا مِمَّا تُحِبُّونَ وَمَا تُنفِقُوا مِن شَيْءٍ فَإِنَّ اللَّـهَ بِهِ عَلِيمٌ',
        RepeatInterval.daily,
        platformChannelSpecifics,
        payload: 'daily_notification',
      );
      // print("ON");
    }

}
