import 'package:get/get.dart';
import 'package:mudad_app/view/auth/confirm_code/view.dart';
import 'package:mudad_app/view/auth/login/view.dart';
import 'package:mudad_app/view/auth/sign_up/view.dart';
import 'package:mudad_app/view/drawer/drawer_pages/subsccription_page.dart';

import '../view/SplashScreen.dart';
import '../view/drawer/drawer_pages/orders_page.dart';
import '../view/drawer/drawer_pages/policy_page.dart';
import '../view/drawer/drawer_pages/settings_page.dart';
import '../view/drawer/drawer_pages/vision_page.dart';
import '../view/home_screen/HomeScreen.dart';

appRoutes() => [
      //we need to add splashscreen to the app
      GetPage(
        name: '/splash',
        page: () => const SplashScreen(),
      ),
      GetPage(
        name: '/home',
        page: () => const HomePage(),
      ),
      GetPage(
          name: '/subscription',
          page: () => const SubscriptionPage(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 600)),
      GetPage(
          name: '/vision',
          page: () => const VisionPage(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 600)),
      GetPage(
          name: '/policy',
          page: () => const PolicyPage(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 600)),
      GetPage(
          name: '/settings',
          page: () => const SettingsPage(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 600)),
      GetPage(
          name: '/orders',
          page: () => const OrdersPage(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 600)),

      GetPage(name: '/signUp', page: () => const SignUpScreen()),
      GetPage(name: '/login', page: () => const LoginScreen()),
      GetPage(name: '/confirmCode', page: () => const ConfirmCodeView()),
    ];
