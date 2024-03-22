import 'package:flutter/material.dart';

class AppButton2 extends StatelessWidget {
  const AppButton2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 100),
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: const Color(0xff77BEFF),
          fixedSize: const Size(200,70),

          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14)
          ),
        ),
        onPressed: (){},
        child: const Text(
          "إختيار",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
