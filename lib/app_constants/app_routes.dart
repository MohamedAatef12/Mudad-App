import 'package:get/get.dart';

import '../google_maps/home_map/choose_location.dart';
import '../google_maps/mosque_map/search_map.dart';
import '../google_maps/orphanage_map/orphanage_map.dart';
import '../view/drawer/drawer_pages/orders_page.dart';
import '../view/drawer/drawer_pages/policy_page.dart';
import '../view/drawer/drawer_pages/settings_page.dart';
import '../view/drawer/drawer_pages/vision_page.dart';
import '../view/home_screen/HomeScreen.dart';
import '../view/payment_page.dart';

appRoutes() => [
      //we need to add splashscreen to the app
      // GetPage(name: '/Splash', page:()=> SplashScreen(),middlewares: )
      GetPage(
        name: '/home',
        page: () => const HomePage(),
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
          page: () => const PaymentPage(
                selectedImage: '',
              ),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 600)),
      GetPage(
        name: '/home_map',
        page: () => const ChooseLocation(),
      ),
      GetPage(name: '/mosque_map', page: () => const SearchMap()),
      GetPage(name: '/orphanage_map', page: () => const OrphanageMap()),
    ];
