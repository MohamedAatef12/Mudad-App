import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mudad_app/view_model/orders_cubit/orders_cubit.dart';

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
      if (state is OrdersSubmitted) {
        Get.toNamed("payment");
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
            child: ModalProgressHUD(
              inAsyncCall: state is OrdersLoading,
              color: Colors.black,
              opacity: 0.6,
              progressIndicator: const SpinKitFadingCircle(color: Colors.blue),
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
                  onPressed: () {
                    if (totalOrder == 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("empty_order".tr),
                        ),
                      );
                    } else {
                      orderCubit.submitOrder(location, totalOrder, orders);
                      log(location);
                      log(totalOrder.toString());
                      log(orders.toString());
                    }
                  },
                  child: FittedBox(
                    child: Text(
                      "Add to Cart".tr,
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
        ),
      );
    });
  }
}
