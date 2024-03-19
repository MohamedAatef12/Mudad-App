import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mudad_app/app_constants/app_assets.dart';
import 'package:mudad_app/app_constants/app_colors.dart';
import 'package:mudad_app/app_constants/app_text_styles.dart';
import 'package:mudad_app/services/localization_service/localization_controller.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

String generateMudadCode(String token){
  return token.substring(token.length - 30);
}


final storage = GetStorage();

class _SettingsPageState extends State<SettingsPage> {
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
                    textDirection: TextDirection.rtl,
                    "{الَّذِينَ يُنفِقُونَ أَمْوَالَهُم بِاللَّيْلِ وَالنَّهَار"
                    "ِ \nسِرًّا وَعَلَانِيَةً فَلَهُمْ أَجْرُهُمْ عِندَ رَبِّهِم"
                    "ْ \nوَلَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونََ}",
                    style: AppTextStyle.quranFont,
                  )),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .1),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     FlutterSwitch(
              //       activeColor: AppColors.buttonColor,
              //       activeIcon: Image.asset(
              //         AppAssets.appLogo,
              //       ),
              //       width: 70.0,
              //       height: 40.0,
              //       valueFontSize: 15.0,
              //       toggleSize: 30.0,
              //       value: storage.read('notification') ??
              //           NotificationApi.notificationEnabled,
              //       borderRadius: 30.0,
              //       padding: 5.0,
              //       showOnOff: true,
              //       onToggle: (val) {
              //         setState(() {
              //           NotificationApi.notificationEnabled = val;
              //           storage.write("notification",
              //               NotificationApi.notificationEnabled);
              //           if (storage.read('notification') == true) {
              //             NotificationApi.sendNotificationAtSpecificTime(
              //                 const TimeOfDay(hour: 0, minute: 0));
              //             // print("${storage.read('notification' )}     ${NotificationApi.notificationEnabled}");
              //           } else {
              //             NotificationApi.cancel();
              //             // print("${storage.read('notification' )}     ${NotificationApi.notificationEnabled}");
              //           }
              //         });
              //       },
              //     ),
              //     const Spacer(),
              //     Text(
              //       "Notifications".tr,
              //       style: AppTextStyle.mainFont,
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .05,
                      width: MediaQuery.of(context).size.width * .2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: AppColors.buttonColor, width: 1),
                          image: DecorationImage(
                              image: AssetImage(
                                  storage.read("language").toString() == "en"
                                      ? AppAssets.englishImage
                                      : AppAssets.arabicImage),
                              fit: BoxFit.cover)),
                    ),
                    onTap: () {
                      String currentLanguage =
                          LocalizationService().getLanguage();
                      String newLanguage =
                          currentLanguage == 'en_US' ? 'العربيه' : 'English';
                      LocalizationService().changeLocale(newLanguage);
                    },
                  ),
                  const Spacer(),
                  Text(
                    "language".tr,
                    style: AppTextStyle.mainFont,
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              CouponCard(
                height: MediaQuery.of(context).size.height * .3,
                curvePosition: MediaQuery.of(context).size.height * .2,
                curveRadius: 30,
                borderRadius: 15,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.buttonColor.withRed(10),
                      AppColors.buttonColor.withGreen(150),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                firstChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          showDialog(context: context, builder: (context) {
                            return const AlertDialog(
                              title:  Text("What is Mudad code?"),
                              content:  Text("You need to share this code with your friends "
                                  "and anyone uses this code will get a 10% sale on his donation "
                                  "\nuse it now!"),
                            );
                          },);
                        }, icon: const Icon(Icons.info_outline)),
                    const Center(
                      child: Text(
                        'Sale value',
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Center(
                      child: Text(
                        '10%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                secondChild: Container(
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.white),
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 17, horizontal: 42),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {
                      showDialog(context: context, builder: (context) {
                        return  AlertDialog(
                          title:  const Text("Your code is:"),
                          content:  Container(
                            child: Row(
                              children: [
                                const Flexible(
                                  child: Text("You need to share this code with your friends "
                                      "and anyone uses this code will get a 10% sale on his donation "
                                      "\nuse it now!"),
                                ),
                             IconButton(onPressed: () {
                               Clipboard.setData(const ClipboardData(text: "generateMudadCode(test)"));
                               ScaffoldMessenger.of(context).showSnackBar(
                                 const SnackBar(
                                   content: Text('Text copied to clipboard'),
                                 ),
                               );
                             }, icon: const Icon(Icons.copy))
                              ],
                            ),
                          ),
                        );
                      },);
                    },
                    child: const Text(
                      'Get the code',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
