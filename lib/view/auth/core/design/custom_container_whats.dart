import 'package:flutter/material.dart';
import 'custom_image.dart';

class CustomContainerWhatsApp extends StatelessWidget {
  const CustomContainerWhatsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFE7EEF8),
              blurRadius: 4.0,
              offset: Offset(0.6, 0.6),
            ),
          ],
        ),
        child: const AppImage2(
          "https://th.bing.com/th/id/R.681f197a9d546a38e28bd5a721b270ed?rik=ddYabL6TEFPK1w&pid=ImgRaw&r=0",
        ),
      ),
    );
  }
}
