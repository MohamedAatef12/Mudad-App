import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudad_app/google_maps/mosque_map/build_product.dart';
import 'package:mudad_app/reusable_widgets/custom_paymment_card.dart';
import 'package:mudad_app/services/payment_service/payment_controller.dart';
import 'package:mudad_app/view_model/orders_cubit/orders_cubit.dart';

import '../app_constants/app_colors.dart';
import '../app_constants/app_text_styles.dart';

class PaymentPage extends StatelessWidget {
  // final String selectedImage;
  const PaymentPage({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Image.asset(
            "assets/payment_assets/upper side.png",
            width: double.infinity,
            fit: BoxFit.fill,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
            child: InkWell(
              onTap: () {
                PaymentController().payPressed();
              },
              borderRadius: BorderRadius.circular(10),
              child: Container(
                  height: MediaQuery.of(context).size.height * .07,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: AppColors.buttonColor,
                  ),
                  child: Center(
                    child: Text("Choose the payment method".tr,
                        style: AppTextStyle.mainFont,
                        textAlign: TextAlign.center),
                  )),
            ),
          ),
        Container(
          height: 300,
          width: double.infinity,
          child: Column(children: [Text('Location'),Text(totalOrder.toString()),
          Row(
            children: [
              Text(products.first),
              Image.network(productImages.first,height: 70,),
              Text(orderCounter.first.toString()),

              Text(productPrice.first.toString()+"X"+orderCounter.first.toString()+"=" +p1Total.toString())
            ],
          ),


            Row(
            children: [
              Text(products.last),
              Image.network(productImages.last,height: 70,),
              Text(orderCounter.last.toString()),
              
              Text(productPrice.last.toString()+"X"+orderCounter.last.toString()+"=" +p2Total.toString())
            ],
          )
          ],),
        ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             const Icon(Icons.lock),
              const SizedBox(
                width: 2,
              ),
              Text(
                "All information about your computer is safe".tr,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          // PaymentCard(
          //   width: 150,
          //   height: 180,
          //   onTap: () {},
          //   child: Image.asset(
          //     "assets/payment_assets/paypal-svgrepo-com 1.png",
          //     height: 110,
          //     width: 110,
          //   ),
          // ),
          // const Center(
          //   child: Text(
          //     "باي بال",
          //     style: TextStyle(
          //       fontSize: 20,
          //       fontWeight: FontWeight.w400,
          //     ),
          //   ),
          // ),

          PaymentCard(
            width: 110,
            height: 150,
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Image.asset(
                    "assets/payment_assets/mastercard-svgrepo-com (1) 1.png",
                  ),
                ),
                const SizedBox(
                  height: 90,
                  child: VerticalDivider(
                    color: Colors.black,
                    thickness: .6,
                    width: 0,
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    "assets/payment_assets/visa-svgrepo-com 1.png",
                    height: 150,
                    width: 180,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Text(
              "Visa/MasterCard".tr,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          // PaymentCard(
          //   width: 150,
          //   height: 180,
          //   onTap: () {},
          //   child: Padding(
          //     padding: const EdgeInsets.all(50.0),
          //     child: Image.asset(
          //       "assets/payment_assets/apple_pay.png",
          //     ),
          //   ),
          // ),
          // const Center(
          //   child: Text(
          //     "أبل باي",
          //     style: TextStyle(
          //       fontSize: 20,
          //       fontWeight: FontWeight.w400,
          //     ),
          //   ),
          // ),
          // PaymentCard(
          //   width: 150,
          //   height: 80,
          //   onTap: () {},
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       Image.asset(
          //         "assets/payment_assets/gift-svgrepo-com 1.png",
          //         fit: BoxFit.fitHeight,
          //       ),
          //       const Text(
          //         "بطاقات هدايا",
          //         style: TextStyle(
          //           fontSize: 30,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // PaymentCard(
          //   width: 150,
          //   height: 80,
          //   onTap: () {},
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       Image.asset(
          //         "assets/payment_assets/voucher-coupon-svgrepo-com 1.png",
          //         fit: BoxFit.fitHeight,
          //       ),
          //       const Text(
          //         "بطاقات الخصم",
          //         style: TextStyle(
          //           fontSize: 30,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Container(
          //   height: MediaQuery.of(context).size.height * .3,
          //   color: AppColors.buttonColor,
          //   child: Column(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: [
          //         Container(
          //           height: 40,
          //           width: 180,
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             borderRadius: BorderRadius.circular(10),
          //           ),
          //           child: Center(
          //               child: Text(
          //             "مراجعه طلبك",
          //             style:GoogleFonts.lalezar(
          //                 fontSize: 20,
          //                 fontWeight: FontWeight.w100,
          //                 color: Colors.grey)
          //           )),
          //         ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceAround,
          //           children: [
          //             Container(
          //               height: 130,
          //               width: 130,
          //               decoration: BoxDecoration(
          //                 color: Colors.white,
          //                 borderRadius: BorderRadius.circular(10),
          //               ),
          //               child: Column(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   Text("عدد",
          //                       style: GoogleFonts.lalezar(
          //                           fontSize: 20,
          //                           fontWeight: FontWeight.w100,
          //                           color: Colors.grey)),
          //                   const SizedBox(
          //                     height: 10,
          //                   ),
          //                   Text("10 كرتونه ",
          //                       style: GoogleFonts.lalezar(
          //                           fontSize: 20,
          //                           fontWeight: FontWeight.w100,
          //                           color: Colors.black)),
          //                 ],
          //               ),
          //             ),
          //             SizedBox(
          //               height: MediaQuery.of(context).size.height * .15,
          //               child: const VerticalDivider(
          //                 color: Colors.white,
          //                 thickness: .6,
          //                 width: 0,
          //               ),
          //             ),
          //             Container(
          //               height: 130,
          //               width: 130,
          //               decoration: BoxDecoration(
          //                 color: Colors.white,
          //                 borderRadius: BorderRadius.circular(10),
          //               ),
          //               child: FittedBox(
          //                 child: Column(
          //                   children: [
          //                     Padding(
          //                       padding: const EdgeInsets.all(20.0),
          //                       child: Image.asset(
          //                         "assets/payment_assets/bottles.png",
          //                       ),
          //                     ),
          //                     Text(
          //                       "عبوه330مx20 ",
          //                       style: GoogleFonts.lalezar(
          //                           fontSize: 40,
          //                           fontWeight: FontWeight.w100,
          //                           color: Colors.black),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ],
          //         )
          //       ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
