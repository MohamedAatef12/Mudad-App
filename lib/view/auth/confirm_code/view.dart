import 'dart:developer';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mudad_app/view/auth/helper_methods.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ConfirmCodeView extends StatefulWidget {
  const ConfirmCodeView({
    super.key,
    this.phone,
  });
  final String? phone;

  @override
  State<ConfirmCodeView> createState() => _ConfirmCodeViewState();
}

final codeController = TextEditingController();

class _ConfirmCodeViewState extends State<ConfirmCodeView> {
  final formKey = GlobalKey<FormState>();
  bool isTimerFinished = false;
  Duration duration = const Duration(seconds: 60);

  @override
  void initState() {
    otpAuth(
      phone: widget.phone!,
      duration: duration,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 70,
          ),
          children: [
            Text(
              textAlign: TextAlign.center,
              "Verification Code".tr,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              textAlign: TextAlign.center,
              'Verification Description'.tr,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            Form(
              key: formKey,
              child: PinCodeTextField(
                appContext: context,
                length: 6,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter the code".tr;
                  } else if (value.length < 6) {
                    return "the code must be 6 digits".tr;
                  }
                  return null;
                },
                controller: codeController,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 66,
                  fieldWidth: 52,
                  inactiveColor: const Color(0xffF3F3F3),
                  //selectedColor: Colors.blue,
                  activeColor: Colors.blue,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.07,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ModalProgressHUD(
                    inAsyncCall: false,
                    color: Colors.black,
                    opacity: 0.6,
                    progressIndicator:
                        const SpinKitFadingCircle(color: Colors.blue),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: const Color(0xff609FD8),
                          splashFactory: NoSplash.splashFactory,
                          fixedSize: Size(
                            MediaQuery.of(context).size.width * 0.7,
                            MediaQuery.of(context).size.height * 0.07,
                          ),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            sentCode();
                            Get.back();
                          }
                        },
                        child: Text("Verify".tr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 57,
            ),
            Text(
              "did not receive the code".tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            isTimerFinished
                ? const SizedBox.shrink()
                : CircularCountDownTimer(
                    duration: duration.inSeconds,
                    initialDuration: 0,
                    width: 66,
                    height: 70,
                    ringColor: Colors.blue,
                    fillColor: const Color(0xffD8D8D8),
                    strokeWidth: 3,
                    onComplete: () {
                      isTimerFinished = true;
                      setState(() {});
                    },
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textFormat: CountdownTextFormat.MM_SS,
                    isReverseAnimation: true,
                  ),
            const SizedBox(
              height: 19,
            ),
            isTimerFinished
                ? Center(
                    child: OutlinedButton(
                      onPressed: () {
                        isTimerFinished = false;
                        otpAuth(
                          phone: widget.phone!,
                        );
                        log('resend code');
                        setState(() {});
                      },
                      child: Text(
                        "send again".tr,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
