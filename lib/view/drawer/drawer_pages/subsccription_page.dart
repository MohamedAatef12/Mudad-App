import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app_constants/app_colors.dart';
import '../../../app_constants/app_text_styles.dart';
import '../../../services/localization_service/localization_controller.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  int NumberOfMonths = 1;
  String choosepackage = "Silver package".tr;
  DateTime? choosedDate = DateTime.now();
  //
  final List<DateTime?> _dates = [
    DateTime.now(),
  ];
  bool isArbic = LocalizationService().getLanguage() == "ar" ? true : false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Stack(children: [
              Image.asset(
                "assets/subscriptions/subscriptionsPar.png",
                //height: MediaQuery.of(context).size.height / 3 ,
                width: double.maxFinite,
                fit: BoxFit.contain,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                    onTap: () => Get.back(),
                    child: isArbic
                        ? Image.asset("assets/subscriptions/backAR.png")
                        : Image.asset("assets/subscriptions/back.png")),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: InkWell(
              onTap: () {
                // print('ok');
                // LocalizationService().changeLocale('');
                // print(isArbic);
                // print(Arbic);
                // print(LocalizationService().getLanguage().toString());

                // setState(() {});
              },
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: MediaQuery.of(context).size.height / 10,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.buttonColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text("Monthly subscriptions".tr,
                        style: AppTextStyle.mainFont,
                        textAlign: TextAlign.center),
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: Text(
              "Choose the preferred package".tr,
              style: AppTextStyle.mainBlackFont,
            ),
          ),
          subscriptionButton(
            imageIcon: "assets/subscriptions/bronze.png",
            title: "Bronze package".tr,
            subtitle: "Once a month".tr,
          ),
          subscriptionButton(
            imageIcon: "assets/subscriptions/silver.png",
            title: "Silver package".tr,
            subtitle: "Once a week".tr,
          ),
          subscriptionButton(
            imageIcon: "assets/subscriptions/gold.png",
            title: "Golden package".tr,
            subtitle: "twice a week".tr,
          ),
          subscriptionButton(
            imageIcon: "assets/subscriptions/award.png",
            title: "Diamond package".tr,
            subtitle: "Daily".tr,
          ),

          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: Text(
              "Choose the subscription period".tr,
              style: AppTextStyle.mainBlackFont,
            ),
          ),
          // box
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  strokeAlign: 0,
                  style: BorderStyle.solid,
                  color: Colors.grey.shade400,
                  width: 2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Number of months :".tr,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.mainBlackFont,
                      ),
                    ),
                    Center(
                      child: Row(
                        children: [
                          isArbic
                              ? incrementButton(
                                  onTap: () {
                                    NumberOfMonths++;
                                    setState(() {});
                                  },
                                  icon: Icons.add,
                                )
                              : incrementButton(
                                  onTap: () {
                                    NumberOfMonths++;
                                    setState(() {});
                                  },
                                  icon: Icons.remove,
                                ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "$NumberOfMonths",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          isArbic
                              ? incrementButton(
                                  onTap: () {
                                    NumberOfMonths++;
                                    setState(() {});
                                  },
                                  icon: Icons.remove,
                                )
                              : incrementButton(
                                  onTap: () {
                                    NumberOfMonths++;
                                    setState(() {});
                                  },
                                  icon: Icons.add,
                                ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                TextButton(
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.zero),
                      foregroundColor:
                          MaterialStatePropertyAll(AppColors.buttonColor)),
                  onPressed: () {
                    showpicker();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Determine the delivery day of the first order ".tr,
                      ),
                      Image.asset(
                        "assets/subscriptions/schedule.png",
                        height: 30,
                        width: 30,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => showpicker(),
                  child: Text(
                    isArbic
                        ? "${choosedDate!.year} / ${choosedDate!.month} / ${choosedDate!.day}"
                        : "${choosedDate!.day} / ${choosedDate!.month} / ${choosedDate!.year}",
                    style: AppTextStyle.mainBlackFont,
                  ),
                )
              ],
            ),
          ),

          ///
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: MediaQuery.of(context).size.height / 10,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.buttonColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text("Confirm".tr,
                        style: AppTextStyle.mainFont,
                        textAlign: TextAlign.center),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  incrementButton({Function()? onTap, IconData? icon}) {
    return InkWell(
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(8)),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }

  subscriptionButton({
    required String imageIcon,
    required String title,
    required String subtitle,
  }) {
    return InkWell(
      onTap: () {
        choosepackage = title;

        setState(() {});
      },
      child: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          // height: 70,
          decoration: BoxDecoration(
              color: choosepackage == title
                  ? AppColors.buttonColor
                  : Colors.grey[300],
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey)),
          child: ListTile(
            trailing: Image.asset(imageIcon),
            title: Center(
              child: Text(
                title,
                style: choosepackage == title
                    ? GoogleFonts.lalezar(
                        fontSize: 25,
                        fontWeight: FontWeight.w100,
                        color: Colors.white)
                    : GoogleFonts.lalezar(
                        fontSize: 20,
                        fontWeight: FontWeight.w100,
                        color: AppColors.buttonColor),
              ),
            ),
            subtitle: Center(
                child: Text(
              subtitle,
              style: const TextStyle(fontSize: 15),
            )),
          )),
    );
  }

  Future<List<DateTime?>?>? showpicker() async {
    var results = await showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
        calendarType: CalendarDatePicker2Type.single,
        firstDate: DateTime.now(),
        currentDate: DateTime.now(),
        selectedDayHighlightColor: AppColors.buttonColor,
        selectedRangeHighlightColor: AppColors.buttonColor,
      ),
      dialogSize: const Size(325, 400),
      value: _dates,
      borderRadius: BorderRadius.circular(15),
      // barrierColor: AppColors.buttonColor,
      // dialogBackgroundColor: AppColors.buttonColor,
    );
    print(results);
    if (results != null) {
      setState(() {
        choosedDate = results.first;
      });
    }

    return results;
  }
}
