import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mudad_app/google_maps/mosque_map/product.dart';
import 'package:mudad_app/view_model/products_cubit/products_cubit.dart';

List<String> products = [], productImages = [];
List<int> productPrice = [], orderCounter = [];
List<Map<String, dynamic>> selectedOrders = [];
int totalOrder=0;
int p1Total = 0,p2Total=0;

class BuildProduct extends StatelessWidget {
  const BuildProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final productCubit = BlocProvider.of<ProductsCubit>(context);

    return Positioned(
      bottom: 80,
      child: BlocProvider(
        create: (context) => ProductsCubit()..loadProducts(),
        child: BlocConsumer<ProductsCubit, ProductsState>(
          listener: (context, state) {
            if (state is ProductsSuccess) {
              productPrice = state.prices;
              products = state.products;
              productImages = state.images;
              orderCounter = state.quantity;
              selectedOrders = state.orders;
            }
          },
          builder: (context, state) {
            return SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    quantityCounter: orderCounter[index],
                    addition: () {
                      context.read<ProductsCubit>().addProducts(index);
                      orderCounter[index] =
                          productCubit.addProducts(orderCounter[index]);
                      selectedOrders[index]["qty"] = orderCounter[index];
                      if(index == 0 ){
                        p1Total =selectedOrders[index]["qty"]*selectedOrders[index]["price"];
                      }else{
                        p2Total =selectedOrders[index]["qty"]*selectedOrders[index]["price"];
                      }

                      totalOrder = p1Total+p2Total;
                      print("1:  $p1Total,2:   $p2Total   overAll:   $totalOrder");

                      //  total.clear();
                      // Map<String,dynamic> totalAdded=
                      //   {
                      //     "total$index": selectedOrders[index]["qty"]*selectedOrders[index]["price"]
                      //   };
                      // total.add(totalAdded);
                      // print(total);
                    },
                    remove: () {
                      context.read<ProductsCubit>().removeProducts(index);
                      orderCounter[index] =
                          productCubit.removeProducts(orderCounter[index]);
                      selectedOrders[index]["qty"] = orderCounter[index];
                      if(index == 0 ){
                        p1Total =selectedOrders[index]["qty"]*selectedOrders[index]["price"];
                      }else{
                        p2Total =selectedOrders[index]["qty"]*selectedOrders[index]["price"];
                      }

                      totalOrder = p1Total+p2Total;
                      print("1:  $p1Total,2:   $p2Total   overAll:   $totalOrder");
                      // total.add( selectedOrders[index]["qty"]*selectedOrders[index]["price"]);
                    },
                    imagePath: 'assets/images/3.png',
                    productName: products[index],
                    productDetails: 'ضمان لمدة سنتين',
                    price: productPrice[index],
                  );
                },
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 22),
                scrollDirection: Axis.horizontal,
                reverse: true,
              ),
            );
          },
        ),
      ),
    );
  }
}
