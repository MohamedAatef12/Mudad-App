import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mudad_app/BolcOpserver.dart';
import 'package:mudad_app/app_constants/app_colors.dart';
import 'package:mudad_app/google_maps/miqat_maps/miqat_map.dart';
import 'package:mudad_app/services/localization_service/localization_controller.dart';
import 'package:mudad_app/services/otp_verfication_service/register.dart';
import 'package:mudad_app/view/auth/confirm_code/view.dart';
import 'package:mudad_app/view/auth/sign_up/view.dart';
import 'package:mudad_app/view_model/auth_cubit/auth_cubit.dart';
import 'package:mudad_app/view_model/orders_cubit/orders_cubit.dart';
import 'package:mudad_app/view_model/products_cubit/products_cubit.dart';
import 'package:mudad_app/view_model/services_cubit/services_cubit.dart';

import 'app_constants/app_routes.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GeocodingPlatform.instance;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
    return GetMaterialApp(
      color: AppColors.buttonColor,
      translations: LocalizationService(),
      //locale: const Locale('ar', 'EG'),
      locale: LocalizationService.initLocale(),
      // locale: Locale("en", "US"),
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.buttonColor,
          selectionColor: AppColors.buttonColor.withOpacity(0.5),
          selectionHandleColor: AppColors.buttonColor.withOpacity(0.7),
        ),
      ),
      fallbackLocale: LocalizationService.fallbackLocale,
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      // home: const MiqatMap(),
      getPages: appRoutes(),
    );
  }
}
