import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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

class PaymentPage extends StatefulWidget {
  final bool isMap;

  const PaymentPage({Key? key, required this.isMap}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

final box = GetStorage();
bool _showWidget = false;

class _PaymentPageState extends State<PaymentPage> {
  final box = GetStorage();
  bool _hasShownSnackBar = false;

  @override
  void initState() {
    super.initState();
    box.remove('alreadyVisited');
    _showSnackBar();
  }

  Future<void> _showSnackBar() async {
    await box.initStorage;
    bool alreadyVisited = box.read('alreadyVisited') ?? false;

    if (!alreadyVisited && !_hasShownSnackBar) {
      Get.snackbar(
        'Dear customer'.tr,
        'info'.tr,
        margin: const EdgeInsets.all(20),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white,
        colorText: Colors.black,
        duration: const Duration(seconds: 5),
        isDismissible: true,
        icon: const Icon(Icons.info, color: Colors.yellow, size: 30),
      );

      setState(() {
        _hasShownSnackBar = true;
      });

      // Set the flag to true to indicate the snackbar has been shown
      box.write('alreadyVisited', true);
    }
  }

  @override
  Widget build(BuildContext context) {
    paymentMap = widget.isMap;
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
            height: MediaQuery.of(context).size.height * .8,
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
                  child: widget.isMap == true
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
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                child: productPrice[index] ==
                                                        productPrice[0]
                                                    ? Text(
                                                        "${productPrice[index]}*${orderCounter[index]}"
                                                        "=${productPrice[index] * orderCounter[index] ~/ 10}",
                                                        style:
                                                            GoogleFonts.lalezar(
                                                                fontSize: 20),
                                                      )
                                                    : Text(
                                                        "${productPrice[index]}*${orderCounter[index]}"
                                                        "=${productPrice[index] * orderCounter[index]}",
                                                        style:
                                                            GoogleFonts.lalezar(
                                                                fontSize: 20),
                                                      ),
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
                                          const Text(
                                              "No taxes or delivery fees!!")
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
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                child: verticalProductPrice[
                                                            index] ==
                                                        verticalProductPrice[0]
                                                    ? Text(
                                                        "${verticalProductPrice[index]}*${verticalOrderCounter[index]}"
                                                        "=${verticalProductPrice[index] * verticalOrderCounter[index] ~/ 10}",
                                                        style:
                                                            GoogleFonts.lalezar(
                                                                fontSize: 20))
                                                    : Text(
                                                        "${verticalProductPrice[index]}*${verticalOrderCounter[index]}"
                                                        "=${verticalProductPrice[index] * verticalOrderCounter[index]}",
                                                        style:
                                                            GoogleFonts.lalezar(
                                                                fontSize: 20),
                                                      ),
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
                                          Text("No taxes or delivery fees!!".tr)
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
