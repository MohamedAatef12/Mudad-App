import 'package:get/get.dart';
import 'package:mudad_app/view/auth/login/view.dart';
import 'package:mudad_app/view/auth/sign_up/view.dart';
import '../view/drawer/drawer_pages/orders_page.dart';
import '../view/drawer/drawer_pages/policy_page.dart';
import '../view/drawer/drawer_pages/settings_page.dart';
import '../view/drawer/drawer_pages/vision_page.dart';
import '../view/SplashScreen.dart';
import '../view/home_screen/HomeScreen.dart';
import '../view/payment_page.dart';

appRoutes() => [
      GetPage(
        name: '/splash',
        page: () => const SplashScreen(),
      ),
      GetPage(
        name: '/login',
        page: () => const LoginScreen(),
      ),
      GetPage(
        name: '/signUp',
        page: () => const SignUpScreen(),
      ),
      GetPage(
        name: '/home',
        page: () => const homepage(),
        preventDuplicates: true,
      ),
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
      GetPage(
          name: '/payment',
          page: () => const PaymentPage(selectedImage: "",),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 600)),
    ];
