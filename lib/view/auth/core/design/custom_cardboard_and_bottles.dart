import 'package:flutter/material.dart';

class CustomCardBoardAndBottles extends StatelessWidget {
  const CustomCardBoardAndBottles({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          width: 430,
          color: const Color(0xff609FD8),
          child: Column(
            children: [
              Container(
                height: 35,
                width: 140,
                margin: const EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Text(
                  textAlign: TextAlign.center,
                  "مراجعة طلبك",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff737373),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 30,bottom: 30),
                    height: 125,
                    width: 125,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "عدد",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff737373),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                           "كرتونه 10",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/images/Line 1.png",
                    height: 110,
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 30),
                        height: 125,
                        width: 125,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                            "assets/images/bottles.png",
                          height: 104,
                          width: 109,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "330مx20عبوه",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
