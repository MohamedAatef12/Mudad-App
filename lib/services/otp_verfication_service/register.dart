import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mudad_app/services/otp_verfication_service/twilio_controller.dart';
import 'package:mudad_app/services/otp_verfication_service/verify.dart';

import '../../app_constants/app_colors.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({ Key? key }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController controller = TextEditingController();

  String _phoneNumber = '';
  final phoneController = TextEditingController();

  String errorMessage = '';

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        children: [


          const Text(
            'Register',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.black
            ),
          ),

          const SizedBox(height: 20,),

          const Text(
            'Welcome to our amazing reading community. Please enter your phone number, We will send an OTP for verification.',
            style: TextStyle(
                fontSize: 16,
                color: Colors.black
            ),
          ),

          const SizedBox(height: 30,),

          Container(
            height: 50.0,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(style: BorderStyle.solid, color: Colors.grey, width: 0.5),
                boxShadow:const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.12),
                    blurRadius: 1,
                    offset: Offset(2, 2,),
                  )
                ]
            ),

            child: InternationalPhoneNumberInput(
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
          ),

          const SizedBox(height: 5,),

          Center(
              child: Text(
                  errorMessage,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red
                  )
              )
          ),


          const SizedBox(height: 30,),

          InkWell(
              onTap: () async{

                setState(() {
                  isLoading = true;
                });

                String result = await TwilioVerification.instance.sendCode(_phoneNumber);

                setState(() {
                  isLoading = true;
                });

                if (result == 'Successful'){
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => VerifyPage(phoneNumber: _phoneNumber,))
                  );
                }
                else{
                  setState(() {
                    errorMessage = result;
                    print(result.toString());
                  });
                }
              },
              child: appButton(isLoading ? 'Sending code ...' :'Register')
          ),
        ],
      ),
    );
  }
}




Widget appButton(text){
  return Container(
    height: 50.0,
    width: double.infinity,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: const Color(0xFF6C63FF),
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(style: BorderStyle.solid, color: Colors.grey, width: 0.5),

    ),

    child: Text(
      text,
      style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.white
      ),
    ),
  );
}