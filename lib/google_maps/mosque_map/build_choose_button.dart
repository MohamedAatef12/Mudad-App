import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mudad_app/view_model/orders_cubit/orders_cubit.dart';

import 'build_product.dart';

class BuildChooseButton extends StatelessWidget {
  BuildChooseButton(
      this.location,  this.total, this.orders,
      {super.key});

  String location;
  int total;
  List<Map<String,dynamic>> orders;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersCubit(),
      child: BlocConsumer<OrdersCubit, OrdersState>(
        listener: (context, state) {
        },
        builder: (context, state) {
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
                  OrdersCubit().submitOrder(location, totalOrder,
                  orders
                  );
                  print(totalOrder);
                },
                child: const Text(
                  "اخـتـيـار",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
