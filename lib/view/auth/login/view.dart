import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mudad_app/reusable_widgets/text_field.dart';
import 'package:mudad_app/view_model/auth_cubit/auth_cubit.dart';

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
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20,
            ),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    'sign in'.tr,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "welcome back".tr,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "sign in description".tr,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 43,
                  ),
                  DefaultFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'email required'.tr;
                        }
                        // Regular expression to check if the email format is valid
                        final RegExp emailRegex =
                            RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                        if (!emailRegex.hasMatch(value)) {
                          return 'email invalid'.tr;
                        }
                        return null; // Return null if the email is valid
                      },
                      hintText: "email".tr,
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        size: 26,
                        color: Colors.grey.shade600,
                      ),
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
                        return "password required".tr;
                      } else if (value.length < 8) {
                        return "password weak".tr;
                      }
                      return null;
                    },
                    hintText: "password".tr,
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      size: 26,
                      color: Colors.grey.shade600,
                    ),
                    obSecured: isHidden,
                    suffixIcon: IconButton(
                      highlightColor: Colors.transparent,
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
                  const SizedBox(
                    height: 30,
                  ),
                  BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                    if (state is LoginErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Authentication failed".tr,
                          ),
                        ),
                      );
                    }
                    if (state is LoginSuccessState) {
                      Get.offNamed("home");
                    }
                  }, builder: (context, state) {
                    return Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: ModalProgressHUD(
                            inAsyncCall: state is LoginLoadingState,
                            color: Colors.black,
                            opacity: 0.6,
                            progressIndicator:
                                const SpinKitFadingCircle(color: Colors.blue),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  splashFactory: NoSplash.splashFactory,
                                  backgroundColor: const Color(0xff609FD8),
                                  fixedSize: Size(
                                    MediaQuery.of(context).size.width * 0.7,
                                    MediaQuery.of(context).size.height * 0.07,
                                  ),
                                ),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    authCubit.login(emailController.text,
                                        passwordController.text);
                                  }
                                },
                                child: Text(
                                  "login".tr,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 75,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "no account".tr,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.off(const SignUpScreen());
                        },
                        child: Text(
                          "sign up".tr,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
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
      ),
    );
  }
}
