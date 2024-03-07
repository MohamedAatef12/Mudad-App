import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mudad_app/BolcOpserver.dart';
import 'package:mudad_app/services/localization_service/localization_controller.dart';
import 'package:mudad_app/view/drawer/drawer_pages/settings_page.dart';
import 'package:mudad_app/view_model/products_cubit/products_cubit.dart';
import 'package:mudad_app/view_model/services_cubit/services_cubit.dart';
import 'app_constants/app_routes.dart';
import 'google_maps/home_map/cubit/cubit.dart';

void main() async {
  GeocodingPlatform.instance;
  WidgetsFlutterBinding.ensureInitialized();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('drawable/logo');
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xff92C0FC),
    ),
  );
  Bloc.observer = MyBlocObserver();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ServicesCubit(),
      ),
      BlocProvider(
        create: (context) => ProductsCubit(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocationCubit>(
        create: (context) => LocationCubit(),
        child: GetMaterialApp(
          translations: LocalizationService(),
          locale: LocalizationService.local,
          fallbackLocale: LocalizationService.fallbackLocale,
          textDirection: storage.read("language") == 'ar'
              ? TextDirection.ltr
              : TextDirection.ltr,
          debugShowCheckedModeBanner: false,
          initialRoute: '/home',
          getPages: appRoutes(),
        ));
  }
}
