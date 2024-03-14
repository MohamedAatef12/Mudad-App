import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudad_app/app_constants/app_colors.dart';
import '../../../reusable_widgets/phone_textField.dart';
import '../core/design/app_button.dart';
import '../forget_password/view.dart';
import '../sign_up/view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

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
              'sign_in'.tr,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              textAlign: TextAlign.center,
              "welcome_back".tr,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 9,
            ),
            Text(
              textAlign: TextAlign.center,
              "sign_in_description".tr,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
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
            Form(
              key: formKey,
              child: AppInputPhone(
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
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                Get.to(const ForgetPassword());
              },
              child: Text(
                textAlign: TextAlign.end,
                "forget_password".tr,
                style: const TextStyle(
                  color: AppColors.buttonColor
                  ,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevateButton(
              text: "login".tr,
              onPress: () {
                if(formKey.currentState!.validate()){
                }
              },
            ),
            const SizedBox(
              height: 40,
            ),

            const SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "no_account".tr,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.off(const SignUpScreen());
                  },
                  child: Text(
                    "Sign_up".tr,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
