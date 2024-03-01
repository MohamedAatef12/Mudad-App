import 'package:flutter/material.dart';

class CustomContainerCoupon extends StatelessWidget {
  const CustomContainerCoupon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 300,
      padding: const EdgeInsets.only(right: 60),
      margin: const EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        color: const Color(0xffB1B1B1).withOpacity(.2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            "assets/images/voucher-coupon-svgrepo-com 1.png",
            height: 60,
            width: 100,
          ),
          const Text(
            "بطاقات الخصم",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
