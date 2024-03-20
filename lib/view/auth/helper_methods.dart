import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudad_app/view/auth/login/view.dart';
import 'package:mudad_app/view/auth/sign_up/view.dart';

import 'confirm_code/view.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void toGetNavigate(Widget page) {
  Navigator.push(
    navigatorKey.currentContext!,
    MaterialPageRoute(
      builder: (context) => page,
    ),
  );
}

FirebaseAuth auth = FirebaseAuth.instance;
String? verifyId;
bool isCodeTrue = false;
void otpAuth({required String phone, duration}) async {
  log(phone);
  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: phone,
    timeout: const Duration(seconds: 60),
    verificationCompleted: (PhoneAuthCredential credential) {
      auth.signInWithCredential(credential).then((value) {
        if (value.user != null) {
          Get.to(() => const SignUpScreen());
        }
      });
    },
    verificationFailed: (FirebaseAuthException e) {
      if (e.code == 'invalid-phone-number') {
        Get.showSnackbar(
          GetSnackBar(
            message: 'The provided phone number is not valid'.tr,
            duration: const Duration(seconds: 3),
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
    await auth
        .signInWithCredential(credential)
        .then((value) => Get.to(() => const LoginScreen()));
    isCodeTrue = true;
    log('isCodeTrue: $isCodeTrue');
  } catch (e) {
    log(e.toString());
    Get.showSnackbar(
      GetSnackBar(
        message: 'The code is not correct'.tr,
        duration: const Duration(seconds: 3),
      ),
    );
    isCodeTrue = false;
  }
}
