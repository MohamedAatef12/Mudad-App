import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../app_constants/app_colors.dart';
import '../../../reusable_widgets/text_field.dart';
import '../../../view_model/auth_cubit/auth_cubit.dart';
import '../confirm_code/view.dart';
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
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  String _phoneNumber = '';
  bool passwordHidden = true;
  bool confirmationHidden = true;

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 20,
              ),
              child: ListView(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    "sign up".tr,
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
                    "Create Account".tr,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Sign up description".tr,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  DefaultFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "name required".tr;
                        }
                        return null;
                      },
                      hintText: "name".tr,
                      prefixIcon: Icon(
                        Icons.person_outline,
                        size: 26,
                        color: Colors.grey.shade600,
                      ),
                      textInputAction: TextInputAction.next,
                      controller: fullNameController,
                      keyboardType: TextInputType.text,
                      obSecured: false),
                  const SizedBox(
                    height: 13,
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
                    height: 13,
                  ),
                  InternationalPhoneNumberInput(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "phone required".tr;
                        }
                        return null;
                      },
                      inputDecoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1, color: AppColors.buttonColor),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        hintText: "phone".tr,
                        prefixIcon: Icon(
                          Icons.phone_outlined,
                          size: 26,
                          color: Colors.grey.shade600,
                        ),
                        focusColor: AppColors.buttonColor,
                        fillColor: AppColors.buttonColor,
                        hoverColor: AppColors.buttonColor,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1, color: AppColors.buttonColor),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onInputChanged: (PhoneNumber number) {
                        log(number.phoneNumber.toString());
                        _phoneNumber = number.phoneNumber!;
                        log(_phoneNumber);
                      },
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.DIALOG,
                      ),
                      textFieldController: phoneController),
                  const SizedBox(
                    height: 13,
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
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      size: 26,
                      color: Colors.grey.shade600,
                    ),
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    obSecured: passwordHidden,
                    suffixIcon: IconButton(
                      highlightColor: Colors.transparent,
                      icon: passwordHidden == true
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      onPressed: () {
                        if (passwordHidden == true) {
                          passwordHidden = false;
                        } else {
                          passwordHidden = true;
                        }
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  DefaultFormField(
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "Confirm password required".tr;
                      } else if (value != passwordController.text) {
                        return "Password does not match".tr;
                      }
                      return null;
                    },
                    hintText: "Confirm Password".tr,
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      size: 26,
                      color: Colors.grey.shade600,
                    ),
                    controller: confirmPasswordController,
                    keyboardType: TextInputType.text,
                    obSecured: confirmationHidden,
                    suffixIcon: IconButton(
                      highlightColor: Colors.transparent,
                      icon: confirmationHidden == true
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      onPressed: () {
                        if (confirmationHidden == true) {
                          confirmationHidden = false;
                        } else {
                          confirmationHidden = true;
                        }
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is RegisterErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            "sign up failed".tr,
                            textDirection: TextDirection.rtl,
                          ),
                        ));
                      }
                      // if (state is RegisterSuccessState) {
                      //   Get.offNamed("login");
                      // }
                    },
                    builder: (context, state) {
                      return Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: ModalProgressHUD(
                              inAsyncCall: state is RegisterLoadingState,
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
                                      // if (isCodeTrue == true) {
                                      authCubit
                                          .register(
                                              fullNameController.text,
                                              emailController.text,
                                              _phoneNumber.toString(),
                                              passwordController.text)
                                          .then((value) {
                                        Get.off(
                                          () => ConfirmCodeView(
                                            phone: _phoneNumber.toString(),
                                          ),
                                        );
                                      });
                                    }
                                  },

                                  // },
                                  child: Text(
                                    "sign up".tr,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "already have account".tr,
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
                          "sign in".tr,
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
      ),
    );
  }
}
