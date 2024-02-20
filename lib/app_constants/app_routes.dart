import 'package:get/get.dart';
import 'package:mudad_app/view/auth/login/view.dart';
import 'package:mudad_app/view/auth/sign_up/view.dart';
import '../view/home/drawer_pages/orders_page.dart';
import '../view/home/drawer_pages/policy_page.dart';
import '../view/home/drawer_pages/settings_page.dart';
import '../view/home/drawer_pages/vision_page.dart';
import '../view/home/home_screen.dart';
import '../view/payment_page.dart';

appRoutes() => [
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
        page: () => HomeScreen(),
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
          page: () => const PaymentPage(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 600)),
    ];
