import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudad_app/app_constants/app_assets.dart';
import 'package:mudad_app/app_constants/app_text_styles.dart';

class PolicyPage extends StatelessWidget {
  const PolicyPage({Key? key}) : super(key: key);

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  Image.asset(
                    AppAssets.appLogo,
                    height: 100,
                  ),
                  FittedBox(
                      child: Text(
                    "{وَأَن تَصَدَّقُوا خَيْرٌ لَّكُمْ إِن كُنتُمْ تَعْلَمُونَ}",
                    style: AppTextStyle.quranFont,
                  )),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Text(
                        'policy'.tr,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w600),
                      ),
                    ],
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
