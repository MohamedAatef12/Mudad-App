import 'package:flutter/material.dart';

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
            const Text(
              textAlign: TextAlign.center,
              "Create a new password",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            const Text(
              textAlign: TextAlign.center,
              "Your new password must be different from previous used passwords",
              style: TextStyle(
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
                  const Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  AppInputPassword(
                    labelText: "Password",
                    isPassword: true,
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "كلمه المرور مطلوبه";
                      } else if (value.length < 8) {
                        return "كلمه المرور ضعيفه";
                      }
                      return null;
                    },
                    paddingBottom: 30,
                  ),
                  const Text(
                    "Confirm Password",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  AppInputPassword(
                    labelText: "Confirm Password",
                    isPassword: true,
                    controller: confirmPasswordController,
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "تاكيد كلمه المرور مطلوبه";
                      } else if (value != passwordController.text) {
                        return "كلمه المرور غير متطابقه";
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
              text: "Verify",
              onPress: () {
                if (formKey.currentState!.validate()) {}
              },
            ),
          ],
        ),
      ),
    );
  }
}
