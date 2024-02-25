import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mudad_app/app_constants/app_assets.dart';
import 'package:mudad_app/app_constants/app_colors.dart';
import 'package:mudad_app/app_constants/app_text_styles.dart';
import '../../../services/notification_services.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlutterSwitch(
                    activeColor: AppColors.buttonColor,
                    activeIcon: Image.asset(
                      AppAssets.appLogo,
                    ),
                    width: 70.0,
                    height: 40.0,
                    valueFontSize: 15.0,
                    toggleSize: 30.0,
                    value:
                    storage.read('notification') ??
                        NotificationApi.notificationEnabled,
                    borderRadius: 30.0,
                    padding: 5.0,
                    showOnOff: true,
                    onToggle: (val) {

                      setState(() {
                        NotificationApi.notificationEnabled = val;
                        storage.write("notification",
                            NotificationApi.notificationEnabled);
                        if(storage.read('notification')==true){
                          NotificationApi.sendNotificationAtSpecificTime( const TimeOfDay(hour: 0, minute:0));
                          // print("${storage.read('notification' )}     ${NotificationApi.notificationEnabled}");
                        }else {
                          NotificationApi.cancel();
                          // print("${storage.read('notification' )}     ${NotificationApi.notificationEnabled}");
                        }
                      });
                    },
                  ),
                  const Spacer(),
                  Text(
                    "الاشعارات",
                    style: AppTextStyle.mainFont,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
