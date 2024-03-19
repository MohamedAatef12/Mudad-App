import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
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

    return BlocConsumer<OrdersCubit, OrdersState>(
      listener: (context, state) {
        // if (state is OrdersSubmitted){
        //
        //   if(totalOrder == 0){
        //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("")));
        //   }
        // }

        if(state is OrdersSubmitted){

          Get.toNamed("payment");
        }
      },
      builder: (context, state) {
        if (state is OrdersLoading){
          return Center(child: CircularProgressIndicator(),);
        }else {
          return Positioned(
          bottom: 20,
          right: 120,
          left: 120,
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(20, 60)),
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color(0xFF609FD8),
                ),
              ),
              onPressed: () {
                orderCubit.submitOrder(location, totalOrder, orders);
                log(totalOrder.toString());
              },
              child: Text(
                "Choose".tr,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
        }
      },
    );
  }
}
