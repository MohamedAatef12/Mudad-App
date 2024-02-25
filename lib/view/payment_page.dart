import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mudad_app/reusable_widgets/custom_paymment_card.dart';
import '../app_constants/app_colors.dart';
import '../app_constants/app_text_styles.dart';

class PaymentPage extends StatelessWidget {
  final String selectedImage;
  const PaymentPage({required this.selectedImage ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        Image.asset(
          "assets/payment_assets/upper side.png",
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
          child: InkWell(
            onTap: () {
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
                  child: Text("اختر طريقه الدفع",
                      style: AppTextStyle.mainFont,
                      textAlign: TextAlign.center),
                )),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/payment_assets/lock-svgrepo-com 1.png",
              height: 15,
              width: 15,
            ),
            const SizedBox(
              width: 2,
            ),
            const Text(
              "جميع المعلومات الخاصة بحاسبك آمنه",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        PaymentCard(
          width: 150,
          height: 180,
          onTap: () {},
          child: Image.asset(
            "assets/payment_assets/paypal-svgrepo-com 1.png",
            height: 110,
            width: 110,
          ),
        ),
        const Center(
          child: Text(
            "باي بال",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        PaymentCard(
          width: 150,
          height: 180,
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                "assets/payment_assets/SNB.png",
                height: 50,
                width: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "assets/payment_assets/suadia_bank.png",
                        height: 50,
                        width: 100,
                      ),
                      Image.asset(
                        "assets/payment_assets/riyad_bank.png",
                        height: 50,
                        width: 80,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 90,
                    child: VerticalDivider(
                      color: Colors.black,
                      thickness: .6,
                      width: 0,
                    ),
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/payment_assets/ahli_bank.png",
                        height: 50,
                        width: 80,
                      ),
                      Image.asset(
                        "assets/payment_assets/International Bank Account Number 1.png",
                        height: 65,
                        width: 80,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const Center(
          child: Text(
            "تحويل بنكي",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        PaymentCard(
          width: 150,
          height: 180,
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Image.asset(
              "assets/payment_assets/apple_pay.png",
            ),
          ),
        ),
        const Center(
          child: Text(
            "أبل باي",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        PaymentCard(
          width: 150,
          height: 80,
          onTap: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/payment_assets/gift-svgrepo-com 1.png",
                fit: BoxFit.fitHeight,
              ),
              const Text(
                "بطاقات هدايا",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
        PaymentCard(
          width: 150,
          height: 80,
          onTap: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/payment_assets/voucher-coupon-svgrepo-com 1.png",
                fit: BoxFit.fitHeight,
              ),
              const Text(
                "بطاقات الخصم",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * .3,
          color: AppColors.buttonColor,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 40,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Text(
                    "مراجعه طلبك",
                    style:GoogleFonts.lalezar(
                        fontSize: 20,
                        fontWeight: FontWeight.w100,
                        color: Colors.grey)
                  )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("عدد",
                              style: GoogleFonts.lalezar(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w100,
                                  color: Colors.grey)),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("10 كرتونه ",
                              style: GoogleFonts.lalezar(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w100,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .15,
                      child: const VerticalDivider(
                        color: Colors.white,
                        thickness: .6,
                        width: 0,
                      ),
                    ),
                    Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: FittedBox(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Image.asset(
                                "assets/payment_assets/bottles.png",
                              ),
                            ),
                            Text(
                              "عبوه330مx20 ",
                              style: GoogleFonts.lalezar(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w100,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ]),
        )
      ]),
    );
  }
}
