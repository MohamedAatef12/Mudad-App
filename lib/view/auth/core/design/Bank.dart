import 'package:flutter/material.dart';

class CustomContainerBank extends StatelessWidget {
  const CustomContainerBank({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          padding: const EdgeInsets.only(right: 22,left: 22,top: 5),
          height: 180,
          width: 300,
          decoration: BoxDecoration(
            color: const Color(0xffB1B1B1).withOpacity(.2),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Image.asset(
                "assets/images/SNB.png",
                height: 40,
                width: 110,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          "assets/images/suadia_bank.png",
                          height: 50,
                          width: 100,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          "assets/images/riyad_bank.png",
                          height: 26,
                          width: 86,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    "assets/images/Line 1.png",
                    height: 110,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          "assets/images/ahli_bank.png",
                          height: 40,
                          width: 75,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          "assets/images/International Bank Account Number 1.png",
                          height: 65,
                          width: 80,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "تحويل بنكي",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
