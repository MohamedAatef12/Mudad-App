import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app_constants/app_assets.dart';
import '../../../app_constants/app_text_styles.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppAssets.backGround), fit: BoxFit.fill)),
          child: Column(
            children: [
              Column(
                children: [
                  Image.asset(
                    AppAssets.appLogo,
                    height: 100,
                  ),
                  FittedBox(
                      child: Text(
                    "{إِن تُقْرِضُوا اللَّهَ قَرْضًا حَسَنًا يُضَاعِفْه"
                    "\nُ لَكُمْ وَيَغْفِرْ لَكُمْ ۚ وَاللَّهُ شَكُورٌ حَلِيمٌ}",
                    style: AppTextStyle.quranFont,
                  )),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15))

                        ),
                        child: ExpansionTile(
                          childrenPadding: const EdgeInsets.all(8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),),
                            leading: const Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Colors.black87,
                              size: 40,
                            ),
                            trailing: Text(
                              "عشره كراتين",
                              style: AppTextStyle.mainBlackFont,
                            ),
                            title: const SizedBox(),
                            children: [
                              FittedBox(
                                child: Text(
                                  textDirection: TextDirection.rtl,
                                  "مسجد عمر بن الخطاب             🕌"
                                  " \n مكه المكرمه"
                                  "\n التكلفه : 200 ريال سعودي",
                                  style: GoogleFonts.amiriQuran(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black54),
                                ),
                              ),
                            ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15))

                        ),
                        child: ExpansionTile(
                          childrenPadding: const EdgeInsets.all(8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),),
                            leading: const Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Colors.black87,
                              size: 40,
                            ),
                            trailing: Text(
                              "عشره كراتين",
                              style: AppTextStyle.mainBlackFont,
                            ),
                            title: const SizedBox(),
                            children: [
                              FittedBox(
                                child: Text(
                                  textDirection: TextDirection.rtl,
                                  "مسجد عمر بن الخطاب             🕌"
                                  " \n مكه المكرمه"
                                  "\n التكلفه : 200 ريال سعودي",
                                  style: GoogleFonts.amiriQuran(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black54),
                                ),
                              ),
                            ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15))

                        ),
                        child: ExpansionTile(
                          childrenPadding: const EdgeInsets.all(8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),),
                            leading: const Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Colors.black87,
                              size: 40,
                            ),
                            trailing: Text(
                              "عشره كراتين",
                              style: AppTextStyle.mainBlackFont,
                            ),
                            title: const SizedBox(),
                            children: [
                              FittedBox(
                                child: Text(
                                  textDirection: TextDirection.rtl,
                                  "مسجد عمر بن الخطاب             🕌"
                                  " \n مكه المكرمه"
                                  "\n التكلفه : 200 ريال سعودي",
                                  style: GoogleFonts.amiriQuran(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black54),
                                ),
                              ),
                            ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15))

                        ),
                        child: ExpansionTile(
                          childrenPadding: const EdgeInsets.all(8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),),
                            leading: const Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Colors.black87,
                              size: 40,
                            ),
                            trailing: Text(
                              "عشره كراتين",
                              style: AppTextStyle.mainBlackFont,
                            ),
                            title: const SizedBox(),
                            children: [
                              FittedBox(
                                child: Text(
                                  textDirection: TextDirection.rtl,
                                  "مسجد عمر بن الخطاب             🕌"
                                  " \n مكه المكرمه"
                                  "\n التكلفه : 200 ريال سعودي",
                                  style: GoogleFonts.amiriQuran(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black54),
                                ),
                              ),
                            ]),
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
