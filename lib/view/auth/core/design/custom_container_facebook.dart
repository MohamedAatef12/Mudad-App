import 'package:flutter/material.dart';

class CustomContainerFaceBook extends StatelessWidget {
  const CustomContainerFaceBook({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        height: 60,
        width: 60,
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
        child: const Icon(Icons.facebook,size: 62,color: Colors.blue,),
      ),
    );
  }
}
