import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mudad_app/services/otp_verfication_service/register.dart';
import 'package:mudad_app/services/otp_verfication_service/twilio_controller.dart';
import 'package:mudad_app/view_model/orders_cubit/orders_cubit.dart';

import '../view/drawer/drawer_pages/settings_page.dart';
import '../view/payment_page.dart';
import 'build_product.dart';

class BuildChooseButton extends StatelessWidget {
  const BuildChooseButton(this.location, this.total, this.orders, {super.key});

  final String location;
  final int total;
  final List<Map<String, dynamic>> orders;

  @override
  Widget build(BuildContext context) {
    final orderCubit = BlocProvider.of<OrdersCubit>(context);
    return BlocConsumer<OrdersCubit, OrdersState>(listener: (context, state) {
      if (state is OrdersError) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Please select a location")));
      }
      if (state is OrdersSubmitted) {
        // Get.toNamed("payment");
        Navigator.push(context,MaterialPageRoute(builder: (context) {
          return PaymentPage(isMap: true);
        },));
      }
    }, builder: (context, state) {
      return Positioned(
        bottom: MediaQuery.of(context).size.height * 0.03,
        right: MediaQuery.of(context).size.width * 0.3,
        left: MediaQuery.of(context).size.width * 0.07,
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
                onPressed: storage.read("userPhoneNumber") == null
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
                        orderCubit.submitOrder(location, totalOrder, orders);

                        log(location);
                        log(totalOrder.toString());
                        log(orders.toString());
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
    });
  }
}
