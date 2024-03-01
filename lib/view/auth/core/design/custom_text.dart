import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/lock-svgrepo-com 1.png",
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
    );
  }
}
