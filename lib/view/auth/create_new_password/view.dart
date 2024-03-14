import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../reusable_widgets/password_textField.dart';
import '../core/design/app_button.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 50,
          ),
          children: [
            Text(
              textAlign: TextAlign.center,
              "new_password".tr,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 7,
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
              height: 26,
            ),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "password".tr,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  AppInputPassword(
                    labelText: "password".tr,
                    isPassword: true,
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "password_required".tr;
                      } else if (value.length < 8) {
                        return "password_weak".tr;
                      }
                      return null;
                    },
                    paddingBottom: 30,
                  ),
                  Text(
                    "confirm_password".tr,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  AppInputPassword(
                    labelText: "confirm_password".tr,
                    isPassword: true,
                    controller: confirmPasswordController,
                    validator: (value) {
                      if(value.toString().isEmpty)
                      {
                        return "confirm_password_is_required".tr;
                      } else if (value !=passwordController.text)
                      {
                        return "password_does_not_match".tr;
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 44,
            ),
            ElevateButton(
              text: "verify".tr,
              onPress: () {
                if(formKey.currentState!.validate()){

                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
