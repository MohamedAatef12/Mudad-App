import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mudad_app/reusable_widgets/text_field.dart';
import 'package:mudad_app/view_model/auth_cubit/auth_cubit.dart';

import '../core/design/app_button.dart';
import '../sign_up/view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
                              return 'empty_email_val'.tr;
                            }
                            // Regular expression to check if the email format is valid
                            final RegExp emailRegex =
                                RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                            if (!emailRegex.hasMatch(value)) {
                              return 'wrong_email_val'.tr;
                            }
                            return null; // Return null if the email is valid
                          },
                          hintText: "email".tr,
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
                            return "empty_password_val".tr;
                          } else if (value.length < 8) {
                            return "weak_password_val".tr;
                          }
                          return null;
                        },
                        hintText: "password".tr,
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
                      ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                        content: Text(
                          "auth_failed".tr,

                        ),
                      ));
                    }
                    if (state is LoginSuccessState){
                      Get.offNamed("home");
                    }
                  },
                  builder: (context, state) {
                    if (state is LoginLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return ElevateButton(
                        text: "login".tr,
                        onPress: () {
                          if (formKey.currentState!.validate()) {
                            authCubit
                                .login(emailController.text,
                                    passwordController.text);

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
                      child:  Text(
                        "sign_up".tr,
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
      ),
    );
  }
}
