import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mudad_app/app_constants/app_colors.dart';
import 'package:mudad_app/app_constants/app_text_styles.dart';
import 'package:mudad_app/google_maps/build_product.dart';
import 'package:mudad_app/reusable_widgets/custom_paymment_card.dart';
import 'package:mudad_app/reusable_widgets/text_field.dart';
import 'package:mudad_app/services/payment_service/payment_controller.dart';
import 'package:mudad_app/view/vertical_broducts.dart';
bool? paymentMap;
TextEditingController mudadCodeController = TextEditingController();

class PaymentPage extends StatelessWidget {
  bool isMap;

  PaymentPage({Key? key, required this.isMap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    paymentMap = isMap;
    return Scaffold(
      body: ListView(
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
                print(paymentMap);
                print(verticalTotalOrder);
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
          PaymentCard(
            width: 150,
            height: 80,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Enter_Mudad_code".tr),
                    content: DefaultFormField(
                        controller: mudadCodeController,
                        keyboardType: TextInputType.text,
                        obSecured: false),
                  );
                },
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/payment_assets/voucher-coupon-svgrepo-com 1.png",
                  fit: BoxFit.fitHeight,
                ),
                Text(
                  "vouchers".tr,
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .7,
            color: AppColors.buttonColor,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 40,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: FittedBox(
                        child: Text(
                          "Review your order".tr,
                          style: GoogleFonts.lalezar(
                              fontSize: 20,
                              fontWeight: FontWeight.w100,
                              color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: isMap == true
                      ? ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: productImages.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Row(

                                      children: [
                                        Container(
                                          height: 125,
                                          width: 125,
                                          decoration: BoxDecoration(
                                            color: AppColors.buttonColor,
                                            borderRadius:
                                            BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.all(8.0),
                                            child: Image.network(
                                              productImages[index],
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20),
                                          child: Text(
                                            "${productPrice[index]}*${orderCounter[index]}"
                                                "=${productPrice[index] * orderCounter[index]}",style: GoogleFonts.lalezar(
                                              fontSize: 20
                                          ),),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      products[index],
                                      style: GoogleFonts.lalezar(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w100,
                                          color: Colors.black),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text("No taxes or delivery fees!!")
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                      : ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: productImages.length,
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(

                                            children: [
                                              Container(
                                                height: 125,
                                                width: 125,
                                                decoration: BoxDecoration(
                                                  color: AppColors.buttonColor,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Image.network(
                                                    productImages[index],
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Spacer(),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                                child: Text(
                                                    "${verticalProductPrice[index]}*${verticalOrderCounter[index]}"
                                                        "=${verticalProductPrice[index] * verticalOrderCounter[index]}",style: GoogleFonts.lalezar(
                                                  fontSize: 20
                                                ),),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            products[index],
                                            style: GoogleFonts.lalezar(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w100,
                                                color: Colors.black),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Text("No taxes or delivery fees!!")
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
