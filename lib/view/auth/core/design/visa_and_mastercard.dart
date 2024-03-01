import 'package:flutter/material.dart';

class VisaAndMasterCard extends StatelessWidget {
  const VisaAndMasterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          padding: const EdgeInsets.symmetric(horizontal: 22),
          height: 180,
          width: 300,
          decoration: BoxDecoration(
            color: const Color(0xffB1B1B1).withOpacity(.2),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/images/visa-svgrepo-com 1.png",
                    height: 110,
                    width: 110,
                  ),
              ),
              Image.asset(
                "assets/images/Line 1.png",
                height: 110,
              ),
              GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/images/mastercard-svgrepo-com (1) 1.png",
                    height: 110,
                    width: 110,
                  ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "بطاقة فيزا/ماستر كارد",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
