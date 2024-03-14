import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../reusable_widgets/password_textField.dart';
import '../../../reusable_widgets/phone_textField.dart';
import '../core/design/app_button.dart';
import '../login/view.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final fullNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20,
            ),
            children: [
              Text(
                textAlign: TextAlign.center,
                "sign_up".tr,
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
                "create_account".tr,
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
                "full_name".tr,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              AppInputPhone(
                labelText: "full_name".tr,
                paddingBottom: 30,
                isPhone: false,
                controller: fullNameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "enter_your_name".tr;
                  } else if (value.length > 30) {
                    return "write_your_full_name".tr;
                  }
                  return null;
                },
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
              const SizedBox(
                height: 25,
              ),
              ElevateButton(
                text: "sign_up".tr,
                onPress: () {
                  if(formKey.currentState!.validate()){

                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "already_have_account".tr,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.off(const LoginScreen());
                    },
                    child: Text(
                      "sign_in".tr,
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
      ),
    );
  }
}
