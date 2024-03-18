import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mudad_app/BolcOpserver.dart';
import 'package:mudad_app/app_constants/app_colors.dart';
import 'package:mudad_app/services/localization_service/localization_controller.dart';
import 'package:mudad_app/view/drawer/drawer_pages/settings_page.dart';
import 'package:mudad_app/view_model/auth_cubit/auth_cubit.dart';
import 'package:mudad_app/view_model/orders_cubit/orders_cubit.dart';
import 'package:mudad_app/view_model/products_cubit/products_cubit.dart';
import 'package:mudad_app/view_model/services_cubit/services_cubit.dart';
import 'app_constants/app_routes.dart';
import 'firebase_options.dart';
import 'google_maps/home_map/cubit/cubit.dart';

void main() async {
  GeocodingPlatform.instance;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  //     FlutterLocalNotificationsPlugin();
  // const AndroidInitializationSettings initializationSettingsAndroid =
  //     AndroidInitializationSettings('drawable/logo');
  // const InitializationSettings initializationSettings = InitializationSettings(
  //   android: initializationSettingsAndroid,
  // );
  // await flutterLocalNotificationsPlugin.initialize(initializationSettings);
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
      BlocProvider(
        create: (context) => OrdersCubit(),
      ),
      BlocProvider(
        create: (context) => AuthCubit(),
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
        color: AppColors.buttonColor,
        // theme: ThemeData(
        //     primarySwatch: const MaterialColor(
        //       0xff609fd8,
        //       <int, Color>{
        //         50: Color(0xff609fd8),
        //         100: Color(0xff609fd8),
        //         200: Color(0xff609fd8),
        //         300: Color(0xff609fd8),
        //         400: Color(0xff609fd8),
        //         500: Color(0xff609fd8),
        //         600: Color(0xff609fd8),
        //         700: Color(0xff609fd8),
        //         800: Color(0xff609fd8),
        //         900: Color(0xff609fd8),
        //       },
        //     ),
        //     primaryColor: AppColors.buttonColor,),
        translations: LocalizationService(),
        locale: LocalizationService.local,
        fallbackLocale: LocalizationService.fallbackLocale,
        // textDirection: storage.read("language") == 'ar'
        //     ? TextDirection.ltr
        //     : TextDirection.ltr,
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        //initialRoute: '/home',
        getPages: appRoutes(),
      ),
    );
  }
}
