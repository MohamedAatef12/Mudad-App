import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudad_app/view/home_screen/HomeScreen.dart';

import '../../confirm_code/view.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void toGetNavigate(Widget page) {
  Navigator.push(
    navigatorKey.currentContext!,
    MaterialPageRoute(
      builder: (context) => page,
    ),
  );
}

MaterialColor getMaterialColor() {
  Color color = const Color(0xff4C8613);
  return MaterialColor(color.value, {
    50: color.withOpacity(.1),
    100: color.withOpacity(.2),
    200: color.withOpacity(.3),
    300: color.withOpacity(.4),
    400: color.withOpacity(.5),
    500: color.withOpacity(.6),
    600: color.withOpacity(.7),
    700: color.withOpacity(.8),
    800: color.withOpacity(.9),
    900: color,
  });
}

enum MessageType { success, fail, warning }

void showMessage(String message, {MessageType type = MessageType.fail}) {
  if (message.isNotEmpty) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
        backgroundColor: type == MessageType.fail
            ? Colors.red
            : type == MessageType.warning
                ? Colors.yellow
                : Colors.green,
      ),
    );
    debugPrint(message);
  }
}

FirebaseAuth auth = FirebaseAuth.instance;
String? verifyId;
void otpAuth({required String phone, duration}) async {
  log(phone);
  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: phone,
    timeout: duration,
    verificationCompleted: (PhoneAuthCredential credential) {
      auth.signInWithCredential(credential).then((value) {
        if (value.user != null) {
          Get.to(() => const HomePage());
        }
      });
    },
    verificationFailed: (FirebaseAuthException e) {
      if (e.code == 'invalid-phone-number') {
        log('The provided phone number is not valid.');
        Get.showSnackbar(
          const GetSnackBar(
            message: 'The provided phone number is not valid.',
            duration: Duration(seconds: 3),
          ),
        );
      }
    },
    codeSent: (String verificationId, int? resendToken) async {
      verifyId = verificationId;
    },
    codeAutoRetrievalTimeout: (String verificationId) {
      verifyId = verificationId;
    },
  );
}

sentCode() async {
  log(codeController.text);
  try {
    String smsCode = codeController.text;
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verifyId!, smsCode: smsCode);
    await auth.signInWithCredential(credential).then((value) {
      if (value.user != null) {
        Get.to(() => const HomePage());
      }
    });
  } catch (e) {
    log(e.toString());
    Get.showSnackbar(
      GetSnackBar(
        message: e.toString(),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
