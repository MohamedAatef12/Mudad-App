import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mudad_app/google_maps/build_product.dart';
import 'package:mudad_app/view/drawer/drawer_pages/settings_page.dart';
import 'package:mudad_app/view/payment_page.dart';
import 'package:mudad_app/view/vertical_broducts.dart';
import '../app_constants/app_colors.dart';
import '../app_constants/app_text_styles.dart';
import '../services/otp_verfication_service/register.dart';
import '../services/otp_verfication_service/twilio_controller.dart';
import '../view_model/orders_cubit/orders_cubit.dart';

class StaticMosques extends StatelessWidget {
  const StaticMosques({super.key});

  @override
  Widget build(BuildContext context) {    final orderCubit = BlocProvider.of<OrdersCubit>(context);

  return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.bgColor,
      body: Column(
        children: [
          Image.asset(
              "assets/vecteezy_arab-family-in-traditional-saudi-clothes-people_13455258 1.png"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 20),
            child: Container(
              height: MediaQuery.of(context).size.height * .07,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.buttonColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                //// tr
                child: Text("Products list",
                    style: AppTextStyle.mainFont, textAlign: TextAlign.center),
              ),
            ),
          ),
          Expanded(child: VerticalBuildProduct()),

          BlocConsumer<OrdersCubit, OrdersState>(listener: (context, state) {
            if (state is OrdersError){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please select a location")));
            }
            if (state is OrdersSubmitted) {
              // Get.toNamed("payment")
              Navigator.push(context,MaterialPageRoute(builder: (context) {
               return PaymentPage(isMap: false);
              },));
            }
          }, builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.06,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        splashFactory: NoSplash.splashFactory,
                        backgroundColor: const Color(0xff609FD8),
                        fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.7,
                          MediaQuery.of(context).size.height * 0.06,
                        ),
                      ),
                      onPressed: TwilioVerification.twilioId == null
                          ? () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return RegisterPage();
                          },
                        ));
                      }
                          : () {
                        // if (totalOrder == 0) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(
                        //       content: Text("empty_order".tr),
                        //     ),
                        //   );
                        // }
                        // else
                        // {
                        orderCubit.submitOrder(
                            "المساجد الاكثر احتياجا", verticalTotalOrder, verticalSelectedOrders);

                        // log(location);
                        log(totalOrder.toString());
                        log(verticalSelectedOrders.toString());
                        // }
                      },
                      child: FittedBox(
                        child: Text(
                          storage.read("userPhoneNumber") == null
                              ? "SignUp"
                              : "Go to Payment Page",
                          style: GoogleFonts.lalezar(
                            color: Colors.white,
                            fontSize: 28,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          })
        ],
      ),
    ));
  }
}
