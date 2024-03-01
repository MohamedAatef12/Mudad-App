import 'package:flutter/material.dart';

class ApplePal extends StatelessWidget {
  const ApplePal({super.key});

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
          child: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Image.asset(
                "assets/images/apple_pay.png",
                height: 70,
                width: 160,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "أبل باي",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
