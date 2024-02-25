import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mudad_app/google_maps/home_map/choose_location.dart';
import 'package:mudad_app/google_maps/orphanage_map/orphanage_map.dart';

import '../../google_maps/mosque_map/search_map.dart';
import 'HomeModels.dart';

class HomeVm {
  var models = HomeModel();
  //__________________________________
  String appBarImage = "assets/AppBar.jpg";
  String floatingActionButtonImage = "assets/help.png";
  List<Map> images = [
    {
      "houses": "assets/houses.png",
      "mosques": "assets/mosques.png",
      "orphanage": "assets/orphanage.png"
    },
    {
      "islamic mosque": "assets/islamic mosque.png",
      "cartoonhouse": "assets/cartoonhouse.png",
      "Vector": "assets/Vector.png"
    },
  ];
  String selectedButton = "";
  //__________________________________
  List<String> titles = [
    "إختيار الخدمة",
    "التبرع للمساجد",
    "التبرع للمنازل",
    "التبرع لدور الأيتام",
  ];

  //__________________________________
  var mainButtonColor = const Color.fromARGB(156, 60, 153, 240);

  var backgroundButtonColor = const Color.fromRGBO(209, 240, 255, 100);
  //__________________________________
  TextStyle textStyleForMainButton = GoogleFonts.lalezar(
      fontSize: 25, fontWeight: FontWeight.w200, color: Colors.white);
  TextStyle textStyleForButtons = GoogleFonts.lalezar(
      fontSize: 18,
      fontWeight: FontWeight.w200,
      color: const Color.fromRGBO(0, 117, 223, 100));
  //__________________________________
  floatingActionButtonOnpress() {}

  mainButtonOnTap() {}

  forMosqueOnTap() {
    //do not remove it
    selectedButton == titles[1]
        ? selectedButton = ""
        : selectedButton = titles[1];
    Get.to(() => const SearchMap());
    //
  }

  forHomeOnTap() {
    //do not remove it
    selectedButton == titles[2]
        ? selectedButton = ""
        : selectedButton = titles[2];

    Get.to(() => const ChooseLocation());

    //
  }

  forOrphanageOnTap() {
    //do not remove it
    selectedButton == titles[3]
        ? selectedButton = ""
        : selectedButton = titles[3];
    Get.to(() => const OrphanageMap());
    //
  }
}
