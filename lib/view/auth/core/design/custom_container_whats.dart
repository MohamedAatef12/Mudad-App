import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'custom_image.dart';

class CustomContainerWhatsApp extends StatefulWidget {
  const CustomContainerWhatsApp({super.key});

  @override
  State<CustomContainerWhatsApp> createState() => _CustomContainerWhatsAppState();
}

class _CustomContainerWhatsAppState extends State<CustomContainerWhatsApp> {
  final Uri smsLaunchUri = Uri(
    scheme: "sms",
    path: "+966567205516",
    queryParameters: <String, String>{
      "body": Uri.encodeComponent("السلام عليكم"),
    },
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrl(smsLaunchUri);
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
