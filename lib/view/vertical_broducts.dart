import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mudad_app/google_maps/product.dart';
import 'package:mudad_app/view_model/products_cubit/products_cubit.dart';

List<String> verticalProducts = [], verticalProductImages = [];
List<int> verticalProductPrice = [], verticalOrderCounter = [];
List<Map<String, dynamic>> verticalSelectedOrders = [];
int verticalTotalOrder = 0;
int verticalP1Total = 0, verticalP2Total = 0;

class VerticalBuildProduct extends StatelessWidget {
  const VerticalBuildProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final productCubit = BlocProvider.of<ProductsCubit>(context);

    return BlocProvider(
      create: (context) => ProductsCubit()..loadProducts(),
      child: BlocConsumer<ProductsCubit, ProductsState>(
        listener: (context, state) {
          if (state is ProductsSuccess) {
            verticalProductPrice = state.prices;
            verticalProducts = state.products;
            verticalProductImages = state.images;
            verticalOrderCounter = state.quantity;
            verticalSelectedOrders = state.orders;
          }
        },
        builder: (context, state) {
          return SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(

              padding: const EdgeInsets.symmetric(horizontal: 0),
              separatorBuilder: (context, index) => const SizedBox(
                height: 15,
              ),
              itemCount: verticalProducts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: ProductCard(
                    quantityCounter: verticalOrderCounter[index],
                    addition: verticalProducts[index] == verticalProducts[0]?() {
                      context
                          .read<ProductsCubit>()
                          .addProductsBy10(index);
                      verticalOrderCounter[index] = productCubit
                          .addProductsBy10(verticalOrderCounter[index]);
                      verticalSelectedOrders[index]["qty"] = verticalOrderCounter[index];
                      if (index == 0) {
                        verticalP1Total = verticalSelectedOrders[index]["qty"] *
                            verticalSelectedOrders[index]["price"];
                      } else {
                        verticalP2Total = verticalSelectedOrders[index]["qty"] *
                            verticalSelectedOrders[index]["price"];
                      }
                      verticalP1Total = verticalP1Total ~/ 10;
                      verticalTotalOrder = verticalP1Total + verticalP2Total;
                      print(
                          "1:  $verticalP1Total,2:   $verticalP2Total   overAll:   $verticalTotalOrder");
                    } : () {
                      context.read<ProductsCubit>().addProducts(index);
                      verticalOrderCounter[index] =
                          productCubit.addProducts(verticalOrderCounter[index]);
                      verticalSelectedOrders[index]["qty"] = verticalOrderCounter[index];
                      if (index == 0) {
                        verticalP1Total = verticalSelectedOrders[index]["qty"] *
                            verticalSelectedOrders[index]["price"];
                      } else {
                        verticalP2Total = verticalSelectedOrders[index]["qty"] *
                            verticalSelectedOrders[index]["price"];
                      }

                      verticalTotalOrder = verticalP1Total + verticalP2Total;
                      print(
                          "1:  $verticalP1Total,2:   $verticalP2Total   overAll:   $verticalTotalOrder");
                    },
                    remove:verticalProducts[index] == verticalProducts[0] ?(){
                      context.read<ProductsCubit>().removeProductsBy10(index);
                      verticalOrderCounter[index] =
                          productCubit.removeProductsBy10(verticalOrderCounter[index]);
                      verticalSelectedOrders[index]["qty"] = verticalOrderCounter[index];
                      if (index == 0) {
                        verticalP1Total = verticalSelectedOrders[index]["qty"] *
                            verticalSelectedOrders[index]["price"];
                      } else {
                        verticalP2Total = verticalSelectedOrders[index]["qty"] *
                            verticalSelectedOrders[index]["price"];
                      }
                      verticalP1Total = verticalP1Total ~/ 10;
                      verticalTotalOrder = verticalP1Total + verticalP2Total;
                      print(
                          "1:  $verticalP1Total,2:   $verticalP2Total   overAll:   $verticalTotalOrder");
                    }:() {
                      context.read<ProductsCubit>().removeProducts(index);
                      verticalOrderCounter[index] =
                          productCubit.removeProducts(verticalOrderCounter[index]);
                      verticalSelectedOrders[index]["qty"] = verticalOrderCounter[index];
                      if (index == 0) {
                        verticalP1Total = verticalSelectedOrders[index]["qty"] *
                            verticalSelectedOrders[index]["price"];
                      } else {
                        verticalP2Total = verticalSelectedOrders[index]["qty"] *
                            verticalSelectedOrders[index]["price"];
                      }

                      verticalTotalOrder = verticalP1Total + verticalP2Total;
                      print(
                          "1:  $verticalP1Total,2:   $verticalP2Total   overAll:   $verticalTotalOrder");
                      // total.add( selectedOrders[index]["qty"]*selectedOrders[index]["price"]);
                    },
                    imagePath: verticalProductImages[index],
                    productName: verticalProducts[index],
                    productDetails: 'Two-year warranty'.tr,
                    price: verticalProductPrice[index],
                  ),
                );
              },
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
            ),
          );
        },
      ),
    );
  }
}
