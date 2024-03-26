import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import '../../app_constants/app_assets.dart';
import '../../reusable_widgets/custom_button.dart';
import '../auth/core/design/custom_container_facebook.dart';
import '../auth/core/design/custom_container_insta.dart';
import '../auth/core/design/custom_container_whats.dart';

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
                                ),
                            ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            AppAssets.appLogo,
                          ),
                        ),
                      ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .09),
                      CustomButton("order_history".tr, () {
                        Get.toNamed("orders".tr);
                      }, AppAssets.orders),
                      CustomButton("our_vision".tr, () {
                        Get.toNamed("vision".tr);
                      }, AppAssets.vision),
                      CustomButton("privacy_policy".tr, () {
                        Get.toNamed("policy".tr);
                      }, AppAssets.policy),
                      CustomButton("settings".tr, () {
                        Get.toNamed("setting".tr);
                      }, AppAssets.settings),
                      CustomButton("shared_project".tr, () {
                        Share.share('Check out app'.tr,
                            subject: 'Check app'.tr);
                      }, AppAssets.share),
                      // const Spacer(),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomContainerInstagram(),
                          SizedBox(
                            width: 40,
                          ),
                          CustomContainerFaceBook(),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("version".tr),
                      const SizedBox(height: 20)
                    ]),
                    Positioned(
                      top: MediaQuery.of(context).size.height * .2,
                      child: Column(
                        children: [
                          const CircleAvatar(
                              radius: 70,
                              backgroundImage: NetworkImage(
                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Flag_of_Palestine.svg/640px-Flag_of_Palestine.svg.png")),
                          Text(
                            "name".tr,
                            style: const TextStyle(fontSize: 20),
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








