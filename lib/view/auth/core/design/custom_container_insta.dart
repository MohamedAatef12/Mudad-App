import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'custom_image.dart';

class CustomContainerInstagram extends StatefulWidget {
  const CustomContainerInstagram({super.key});

  @override
  State<CustomContainerInstagram> createState() => _CustomContainerInstagramState();
}

class _CustomContainerInstagramState extends State<CustomContainerInstagram> {

  final Uri _url = Uri.parse("https://www.instagram.com/mudadapp?igsh=NDNlZm81MGRqajl0");

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrl(_url);
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
          "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Instagram_logo_2016.svg/1200px-Instagram_logo_2016.svg.png",
        ),
      ),
    );
  }
}
