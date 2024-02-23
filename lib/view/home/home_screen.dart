import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import '../../app_constants/app_assets.dart';
import '../../reusable_widgets/custom_button.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
          width: MediaQuery.of(context).size.width * .7,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(children: [
                      Stack(alignment: Alignment.topRight, children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * .33,
                            child: DrawerHeader(
                                padding: const EdgeInsets.all(0),
                                child: Image.asset(
                                  AppAssets.drawerBackGround,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ))),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            AppAssets.appLogo,
                          ),
                        ),
                      ]),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .09),
                      CustomButton("سجل الطلبات", () {
                        Get.toNamed("/orders");
                      }, AppAssets.orders),
                      CustomButton("رؤيتنا", () {
                        Get.toNamed("/vision");
                      }, AppAssets.vision),
                      CustomButton("سياسات الخصوصية", () {
                        Get.toNamed("/policy");
                      }, AppAssets.policy),
                      CustomButton("الإعدادات", () {
                        Get.toNamed("/settings");
                      }, AppAssets.settings),
                      CustomButton("شارك التطبيق", () {
                        Share.share('Check out this awesome app',
                            subject: 'Check out this app!');
                      }, AppAssets.share),
                      // const Spacer(),
                      const Text("V 3.17.11"),
                      const SizedBox(height: 20)
                    ]),
                    Positioned(
                      top: MediaQuery.of(context).size.height * .2,
                      child: const Column(
                        children: [
                          CircleAvatar(
                              radius: 70,
                              backgroundImage: NetworkImage(
                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Flag_of_Palestine.svg/640px-Flag_of_Palestine.svg.png")),
                          Text(
                            "Name",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
  }
}








