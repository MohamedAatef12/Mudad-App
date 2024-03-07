import 'package:flutter/material.dart';
import 'package:mudad_app/google_maps/mosque_map/product.dart';

class BuildOrphanageProduct extends StatelessWidget {
  const BuildOrphanageProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 80,
      child: SizedBox(
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 22),
          scrollDirection: Axis.horizontal,
          reverse: true,
          children:  [
            ProductCard(
              remove: (){},
              addition: () {

              },
              quantityCounter: 0,
              imagePath: 'assets/images/3.png',
              productName: 'ثلاجة مياه',
              productDetails: 'ضمان لمدة سنتين',
              price: 2500,
            ),
            SizedBox(width: 20),
            ProductCard(
              remove: (){},
              addition: () {

              },
              quantityCounter: 0,
              imagePath: 'assets/images/2.png',
              productName: 'كراتين',
              productDetails: 'عبوة 20 × مل 330',
              price: 100,
            ),
            SizedBox(width: 20),
            ProductCard(
              remove: (){},
              addition: () {

              },
              quantityCounter: 0,
              imagePath: 'assets/images/2.png',
              productName: 'كراتين',
              productDetails: 'عبوة 20 × مل 330',
              price: 100,
            ),
            // Add more ProductCard widgets as needed
          ],
        ),
      ),
    );
  }
}
