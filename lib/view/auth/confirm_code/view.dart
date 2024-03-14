import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../core/design/app_button.dart';
import '../core/logic/helper_methods.dart';
import '../create_new_password/view.dart';

class ConfirmCodeView extends StatefulWidget {
  const ConfirmCodeView({super.key});

  @override
  State<ConfirmCodeView> createState() => _ConfirmCodeViewState();
}

class _ConfirmCodeViewState extends State<ConfirmCodeView> {
  final formKey = GlobalKey<FormState>();
  final codeController = TextEditingController();
  bool isTimerFinished = false;

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
              "verification_code".tr,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              textAlign: TextAlign.center,
              "lorem_ipsum".tr,
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
                length: 5,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "code_required".tr;
                  } else if (value.length < 5) {
                    return "code_length".tr;
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
              text: "verify".tr,
              onPress: () {
                if (formKey.currentState!.validate()){
                  toGetNavigate(const CreateNewPassword(),);
                }
              },
            ),
            const SizedBox(
              height: 57,
            ),
            Text(
              "text7".tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
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
              duration: 10,
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
                onPressed: () async {
                  isTimerFinished = false;
                  setState(() {});
                },
                child: Text(
                  "resend_code".tr,
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
