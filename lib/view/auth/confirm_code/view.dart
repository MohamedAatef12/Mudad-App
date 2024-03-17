import 'dart:developer';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../core/design/app_button.dart';
import '../core/logic/helper_methods.dart';

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
  Duration duration = const Duration(seconds: 30);

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
            const Text(
              textAlign: TextAlign.center,
              "Verification Code",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              'سيتم ارسال كود التحقق الي رقم الهاتف ${widget.phone}',
              style: const TextStyle(
                fontSize: 14,
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
                    return "يرجي ادخال الكود";
                  } else if (value.length < 5) {
                    return "يجب ان يكون الكود 6 ارقم";
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
            ElevateButton(
              text: "Verify",
              onPress: () {
                if (formKey.currentState!.validate()) {
                  sentCode();
                }
              },
            ),
            const SizedBox(
              height: 57,
            ),
            const Text(
              "لم تستلم الكود ؟\nيمكنك إعادة إرسال الكود بعد",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
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
                          duration: duration,
                        );
                        log('resend code');
                        setState(() {});
                      },
                      child: const Text(
                        "إعادة الإرسال",
                        style: TextStyle(
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
