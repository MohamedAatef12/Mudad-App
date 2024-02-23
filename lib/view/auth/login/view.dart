import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app_constants/app_colors.dart';
import '../../../app_constants/app_text_styles.dart';
import '../../../reusable_widgets/password_textField.dart';
import '../../../reusable_widgets/phone_textField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
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
            const Text(
              textAlign: TextAlign.center,
              "Sign In",
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
              "Welcome Back",
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
              "Please Sign in to access to your account",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
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
                    controller: emailController,
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
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            // TextButton(
            //   onPressed: () {},
            //   child: const Align(
            //     alignment: Alignment.topRight,
            //     child: Text(
            //       "Forget Password!",
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {if(formKey.currentState!.validate()){

              }},
              borderRadius: BorderRadius.circular(10),
              child: Container(
                  height: MediaQuery.of(context).size.height * .07,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: AppColors.buttonColor,
                  ),
                  child: Center(
                    child: Text("تسجيل الدخول",
                        style: AppTextStyle.mainFont,
                        textAlign: TextAlign.center),
                  )),
            ),
            // ElevateButton(
            //   text: "Login",
            //   onPress: () {
            //
            //   },
            // ),
            const SizedBox(
              height: 40,
            ),
            // const AppImage2(
            //   "assets/images/fingerprint.png",
            //   height: 41,
            //   width: 37,
            // ),
            const SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have account?",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed("/signUp");
                  },
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
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
