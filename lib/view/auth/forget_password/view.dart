import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../reusable_widgets/phone_textField.dart';
import '../confirm_code/view.dart';
import '../core/design/app_button.dart';
import '../core/logic/helper_methods.dart';

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
            const Text(
              textAlign: TextAlign.center,
              "Forgot Password",
              style: TextStyle(
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
            const Text(
              textAlign: TextAlign.center,
              "Enter the Email Address \nto reset your password",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              textAlign: TextAlign.center,
              "We will send you a code to reset \nyour password",
              style: TextStyle(
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
                  const Text(
                    "Phone",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  AppInputPhone(
                    labelText: "Phone",
                    isPhone: true,
                    controller: phoneController,
                    paddingBottom: 30,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "رقم الهاتف مطلوب";
                      } else if (value.length < 11) {
                        return "يجب ان يكون رقم الهاتف 11 رقم";
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
              text: "Send",
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
