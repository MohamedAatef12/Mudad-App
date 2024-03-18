import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../app_constants/app_colors.dart';
import '../../../reusable_widgets/text_field.dart';
import '../../../view_model/auth_cubit/auth_cubit.dart';

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
                    "signUp_description".tr,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  DefaultFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "empty_name_val".tr;
                        }
                        return null;
                      },
                      hintText: "name".tr,
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
                    height: 13,
                  ),
                  InternationalPhoneNumberInput(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "empty_phone_val".tr;
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
                        print(number.phoneNumber);
                        _phoneNumber = number.phoneNumber!;
                        print(_phoneNumber);
                      },
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.DIALOG,
                      ),
                      initialValue: PhoneNumber(isoCode: 'SA'),
                      textFieldController: phoneController),
                  const SizedBox(
                    height: 13,
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
                    obSecured: passwordHidden,
                    suffixIcon: IconButton(
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
                        return "empty_password_confirmation_val".tr;
                      } else if (value != passwordController.text) {
                        return "password_didnt_match_val".tr;
                      }
                      return null;
                    },
                    hintText: "password_confirmation".tr,
                    controller: confirmPasswordController,
                    keyboardType: TextInputType.text,
                    obSecured: confirmationHidden,
                    suffixIcon: IconButton(
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
                            "auth_failed".tr,
                            textDirection: TextDirection.rtl,
                          ),
                        ));
                      }
                      if (state is RegisterSuccessState) {
                        Get.offNamed("home");
                      }
                    },
                    builder: (context, state) {
                      if (state is RegisterLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              backgroundColor: const Color(0xff609FD8),
                              fixedSize: const Size.fromHeight(60),
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                authCubit.register(
                                    fullNameController.text,
                                    emailController.text,
                                    _phoneNumber.toString(),
                                    passwordController.text);
                              }
                            },
                            child: Text(
                              "sign_up".tr,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ));
        

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
        ),
      ),
    );
  }
}
