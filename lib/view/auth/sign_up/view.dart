import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../reusable_widgets/password_textField.dart';
import '../../../reusable_widgets/phone_textField.dart';
import '../core/design/app_button.dart';
import '../core/logic/helper_methods.dart';
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
              const Text(
                textAlign: TextAlign.center,
                "Sign Up",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                textAlign: TextAlign.center,
                "Create Account",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              const Text(
                textAlign: TextAlign.center,
                "Please Sign up to access to your account",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Full Name",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              AppInputPhone(
                labelText: "Full Name",
                paddingBottom: 30,
                isPhone: false,
                controller: fullNameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "برجاء ادخال اسمك";
                  } else if (value.length > 30) {
                    return "يرجي كتابه اسمك ثلاثي";
                  }
                  return null;
                },
              ),
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
                  if(value.toString().isEmpty)
                  {
                    return "تاكيد كلمه المرور مطلوبه";
                  } else if (value !=passwordController.text)
                  {
                    return "كلمه المرور غير متطابقه";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 25,
              ),
              ElevateButton(
                text: "Sign Up",
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
                  const Text(
                    "Already have account?",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.off(const LoginScreen());
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
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
