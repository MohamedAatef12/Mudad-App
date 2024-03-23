import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomContainerFaceBook extends StatefulWidget {
  const CustomContainerFaceBook({super.key});

  @override
  State<CustomContainerFaceBook> createState() => _CustomContainerFaceBookState();
}

class _CustomContainerFaceBookState extends State<CustomContainerFaceBook> {

  final Uri _url = Uri.parse("https://www.facebook.com/profile.php?id=61557390906975&mibextid=ZbWKwL");

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrl(_url);
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
