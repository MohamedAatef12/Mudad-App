import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudad_app/app_constants/app_colors.dart';
import 'package:mudad_app/view/drawer/drawer_pages/settings_page.dart';
import 'package:mudad_app/view/home_screen/HomeScreen.dart';
import 'package:share/share.dart';

import '../../app_constants/app_assets.dart';
import '../../reusable_widgets/custom_button.dart';
import '../../services/remote_API/user_data.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * .7,
      backgroundColor: AppColors.bgColor,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Column(children: [
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
                  SizedBox(height: MediaQuery.of(context).size.height * .03),
                  CustomButton("Subscriptions".tr, () {
                    Get.toNamed("/subscription");
                  }, AppAssets.subscription),
                  CustomButton("Terms and Conditions".tr, () {
                    Get.toNamed("/vision");
                  }, AppAssets.vision),
                  CustomButton("Privacy policies".tr, () {
                    Get.toNamed("/policy");
                  }, AppAssets.policy),
                  CustomButton("Settings".tr, () {
                    Get.toNamed("/settings");
                  }, AppAssets.settings),
                  CustomButton("Share the app".tr, () {
                    Share.share('Check out this awesome app',
                        subject: 'Check out this app!');
                  }, AppAssets.share),
                  storage.read("userPhoneNumber") == null
                      ? const SizedBox()
                      : CustomButton("sign_out".tr,
                          // "Order history".tr,
                          () {
                          // Get.toNamed("/orders");
                          // storage.remove("userName");
                          // storage.remove("userEmail");
                          // storage.remove("userPhone");
                          storage
                              .remove("userPhoneNumber")
                              .then((value) => (value) {
                                    Navigator.pushAndRemoveUntil(context,
                                        MaterialPageRoute(
                                      builder: (context) {
                                        return const HomePage();
                                      },
                                    ), (route) => false);
                                  });
                          print(User.token);
                        }, AppAssets.orders),
                  // const Spacer(),
                  // const Text("V 3.17.11"),
                  const SizedBox(height: 20)
                ]),
                // Positioned(
                //   top: MediaQuery.of(context).size.height * .2,
                //   child: const Column(
                //     children: [
                //       CircleAvatar(
                //           radius: 70,
                //           backgroundImage: NetworkImage(
                //               "https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Flag_of_Palestine.svg/640px-Flag_of_Palestine.svg.png")),
                //     ],
                //   ),
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
