import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mudad_app/google_maps/mosque_map/product.dart';
import 'package:mudad_app/view_model/products_cubit/products_cubit.dart';

List<String> products=[], productImages=[];
 List <int>productPrice=[] ,orderCounter= [];

class BuildProduct extends StatelessWidget {

  BuildProduct( {super.key});

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
                    addition: (){
                      context.read<ProductsCubit>().addProducts(index);
                      orderCounter[index] = productCubit.addProducts(orderCounter[index]);
                    },
                    remove: (){
                      context.read<ProductsCubit>().removeProducts(index);
                      orderCounter[index] = productCubit.removeProducts(orderCounter[index]);
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
