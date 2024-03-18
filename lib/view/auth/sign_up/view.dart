import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../app_constants/app_colors.dart';
import '../../../reusable_widgets/text_field.dart';
import '../../../view_model/auth_cubit/auth_cubit.dart';
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
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 20,
              ),
              child: Column(
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
                  DefaultFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "برجاء ادخال اسمك";
                        } else if (value.length > 30) {
                          return "يرجي كتابه اسمك ثلاثي";
                        }
                        return null;
                      },
                      hintText: "Name",
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
                    height: 13,
                  ),
                  InternationalPhoneNumberInput(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "برجاء ادخال رقم الهاتف";
                      }
                      return null;
                    },
                      inputDecoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1, color: AppColors.buttonColor),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        hintText: "Phone Number",
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
                        return "كلمه المرور مطلوبه";
                      } else if (value.length < 8) {
                        return "كلمه المرور ضعيفه";
                      }
                      return null;
                    },
                    hintText: "Password",
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
                        return "تاكيد كلمه المرور مطلوبه";
                      } else if (value != passwordController.text) {
                        return "كلمه المرور غير متطابقه";
                      }
                      return null;
                    },
                    hintText: "Confirm password",
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
                      if (state is RegisterLoadingState) {
                        print("loadinggggggggggggggggggg");
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return ElevateButton(
                          text: "Sign up",
                          onPress: () {
                            if (formKey.currentState!.validate()) {
                            authCubit.register(
                                fullNameController.text,
                                emailController.text,
                                _phoneNumber.toString(),
                                passwordController.text).then((value) => Get.offNamed("home"));
                            }
                          },
                        );
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
        ),
      ),
    );
  }
}
