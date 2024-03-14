import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../reusable_widgets/phone_textField.dart';
import '../confirm_code/view.dart';
import '../core/design/app_button.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          children: [
            Text(
              textAlign: TextAlign.center,
              "forgot_password".tr,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              "assets/lock.png",
              height: 132,
              width: 132,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              textAlign: TextAlign.center,
              "email_address_reset_password".tr,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              textAlign: TextAlign.center,
              "send_code_reset_password".tr,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Color(0xff58595B),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "phone".tr,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  AppInputPhone(
                    labelText: "phone".tr,
                    isPhone: true,
                    controller: phoneController,
                    paddingBottom: 30,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "phone_required".tr;
                      } else if (value.length < 11) {
                        return "phone_length".tr;
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            ElevateButton(
              text: "send".tr,
              onPress: () {
                if(formKey.currentState!.validate()){
                  Get.to(const ConfirmCodeView());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
