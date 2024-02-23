// import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mudad_app/services/notification_services.dart';
import 'package:mudad_app/view/home/drawer_pages/settings_page.dart';
import 'app_constants/app_routes.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  await GetStorage.init();
  tz.initializeTimeZones();
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationApi.initializeTimeZone();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('drawable/logo');
  const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,iOS: IOSInitializationSettings()
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  //
  // Workmanager().initialize(callbackDispatcher);
  // await z.scheduleNotificationBackground();
  if (storage.read("notification")==true){
   print("object");
   NotificationApi.sendNotificationAtSpecificTime(const TimeOfDay(hour: 12, minute:  0 ));
  }


  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // await AndroidAlarmManager.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      // home: homepage(),
      getPages: appRoutes(),
    );
  }
}
