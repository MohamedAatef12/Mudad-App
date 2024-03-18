import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.offNamed("/login"),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Color.fromARGB(172, 138, 213, 248),
          image: DecorationImage(
              image: AssetImage("assets/background.png"), fit: BoxFit.fill),
        ),
        child: Align(
          alignment: const Alignment(0, -0.1),
          child: SizedBox(
            height: 300,
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.contain,
                    height: MediaQuery.of(context).size.height / 4,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Your zakat saves a life".tr,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                          color: Colors.black38,
                          offset: Offset(0, 6),
                          blurRadius: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
