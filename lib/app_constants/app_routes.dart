import 'package:get/get.dart';
import '../view/home/drawer_pages/orders_page.dart';
import '../view/home/drawer_pages/policy_page.dart';
import '../view/home/drawer_pages/settings_page.dart';
import '../view/home/drawer_pages/vision_page.dart';
import '../view/home/home_screen.dart';
import '../view/payment_page.dart';

appRoutes() => [
      //we need to add splashscreen to the app
      // GetPage(name: '/Splash', page:()=> SplashScreen(),middlewares: )
      GetPage(
        name: '/home',
        page: () => HomeScreen(),
      ),
      GetPage(
        name: '/vision',
        page: () =>  const VisionPage(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 600)
      ),
      GetPage(
        name: '/policy',
        page: () =>  const PolicyPage(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 600)
      ),
      GetPage(
        name: '/settings',
        page: () =>  const SettingsPage(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 600)
      ),
      GetPage(
        name: '/orders',
        page: () =>  const OrdersPage(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 600)
      ),
      GetPage(
        name: '/payment',
        page: () =>  const PaymentPage(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 600)
      ),
    ];
