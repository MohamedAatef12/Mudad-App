import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mudad_app/app_constants/app_colors.dart';
import 'package:mudad_app/reusable_widgets/text_field.dart';
import 'package:mudad_app/view_model/auth_cubit/auth_cubit.dart';

import '../../../reusable_widgets/phone_textField.dart';
import '../confirm_code/view.dart';
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
  final emailController = TextEditingController(text: "eea@gmail.com");
  final passwordController = TextEditingController(text: "abc-1234");
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20,
            ),
            child: Column(
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
                const SizedBox(
                  height: 13,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      DefaultFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email address.';
                            }
                            // Regular expression to check if the email format is valid
                            final RegExp emailRegex =
                                RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                            if (!emailRegex.hasMatch(value)) {
                              return 'Please enter a valid email address.';
                            }
                            return null; // Return null if the email is valid
                          },
                          hintText: "Email",
                          textInputAction: TextInputAction.next,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          obSecured: false),
                      const SizedBox(
                        height: 16,
                      ),
                      DefaultFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "كلمه المرور مطلوبه";
                          } else if (value.length < 8) {
                            return "كلمه المرور ضعيفه";
                          }
                          return null;
                        },
                        hintText: "Password",
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        obSecured: isHidden,
                        suffixIcon: IconButton(
                          icon: isHidden == true
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                          onPressed: () {
                            if (isHidden == true) {
                              isHidden = false;
                            } else {
                              isHidden = true;
                            }
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is LoginErrorState) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                        content: Text(
                          "برجاء ادخال الحساب ورقم المرور بشكل صحيح",
                          textDirection: TextDirection.rtl,
                        ),
                      ));
                    }
                  },
                  builder: (context, state) {
                    if (state is LoginLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else {

                      return ElevateButton(
                        text: "Login",
                        onPress: () {
                          if (formKey.currentState!.validate()) {
                          authCubit.login(emailController.text,
                                passwordController.text).then((value) => Get.offNamed("home"));
                          }
                        },
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 75,
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
                        Get.off(const SignUpScreen());
                      },
                      child: const Text(
                        "Sign up",
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
      ),
    );
  }
}
