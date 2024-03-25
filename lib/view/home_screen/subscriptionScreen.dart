import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

import '../../app_constants/app_colors.dart';
import '../../app_constants/app_text_styles.dart';
import '../../reusable_widgets/custom_button.dart';
import '../../services/localization_service/localization_controller.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  int NumberOfMonths = 1;
  String choosePachage = "bronze";
  List<DateTime?> _dates = [
    DateTime(2021, 8, 10),
  ];

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
                    child: Image.asset("assets/subscriptions/back.png")),
              ),
            ]),
          ),
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
          SubscriptionButton(
            imageIcon: "assets/subscriptions/bronze.png",
            title: "Bronze package",
            subtitle: "Once a month",
          ),
          SubscriptionButton(
            imageIcon: "assets/subscriptions/silver.png",
            title: "Silver package",
            subtitle: "Once a week",
          ),
          SubscriptionButton(
            imageIcon: "assets/subscriptions/gold.png",
            title: "Golden package",
            subtitle: "twice a week",
          ),
          SubscriptionButton(
            imageIcon: "assets/subscriptions/award.png",
            title: "Diamond package",
            subtitle: "Daily",
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Number of months :".tr,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.normalFont2,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            if (NumberOfMonths != 1) {
                              setState(() {
                                NumberOfMonths--;
                              });
                            }
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: AppColors.buttonColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
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
                        InkWell(
                          onTap: () {
                            NumberOfMonths++;
                            setState(() {});
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: AppColors.buttonColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
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
                    Showpicker();
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
                  child: Text(
                    //"12 / Feb / 2024",
                    "${_dates.first}",
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

  SubscriptionButton({
    required String imageIcon,
    required String title,
    required String subtitle,
  }) {
    return InkWell(
      onTap: () {
        choosePachage = title;

        setState(() {});
      },
      child: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          // height: 70,
          decoration: BoxDecoration(
              color: choosePachage == title
                  ? AppColors.buttonColor
                  : Colors.grey[300],
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey)),
          child: ListTile(
            trailing: Image.asset(imageIcon),
            title: Center(
              child: Text(
                title,
                style: choosePachage == title
                    ? const TextStyle(color: Colors.white, fontSize: 17)
                    : const TextStyle(
                        color: AppColors.buttonColor, fontSize: 17),
              ),
            ),
            subtitle: Center(child: Text(subtitle)),
          )),
    );
  }

  // Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       //  crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Image.asset("assets/subscriptions/bronze.png"),
  //         Container(
  //           //   color: Colors.amber,
  //           width: MediaQuery.of(context).size.width / 1.5,
  //           alignment: Alignment.centerLeft,
  //           child: const Column(
  //             children: [
  // Text(
  //   "Bronze package",
  //   style: TextStyle(color: AppColors.buttonColor, fontSize: 17),
  // ),
  //               Text("Once a month"),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  Showpicker() async {
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
    return results;
  }
}
