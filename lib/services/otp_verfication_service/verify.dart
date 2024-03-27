
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudad_app/services/otp_verfication_service/register.dart';
import 'package:mudad_app/services/otp_verfication_service/twilio_controller.dart';
import 'package:mudad_app/view/drawer/drawer_pages/settings_page.dart';
import 'package:mudad_app/view/home_screen/HomeScreen.dart';

import 'package:pin_code_fields/pin_code_fields.dart';


class VerifyPage extends StatefulWidget {
  const VerifyPage({ Key? key, required this.phoneNumber }) : super(key: key);

  final String phoneNumber;

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}
final codeController = TextEditingController();

class _VerifyPageState extends State<VerifyPage> {
  // TextEditingController controller = TextEditingController();



  bool isLoading = false;

  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        children: [

          const SizedBox(height: 40,),


          const SizedBox(height: 50,),

          const Center(
            child: Text(
              'OTP VERIFICATION',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.black
              ),
            ),
          ),

          const SizedBox(height: 20,),

          Center(
              child: Text.rich(
                  TextSpan(
                      text: "Enter the OTP sent to ",
                      children: [
                        TextSpan(
                          text: widget.phoneNumber,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                        )
                      ]
                  )
              )
          ),

          const SizedBox(height: 30,),

          Form(
            child: PinCodeTextField(
              appContext: context,
              length: 6,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter the code".tr;
                } else if (value.length < 6) {
                  return "the code must be 6 digits".tr;
                }
                return null;
              },
              controller: codeController,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: 66,
                fieldWidth: 52,
                inactiveColor: const Color(0xffF3F3F3),
                //selectedColor: Colors.blue,
                activeColor: Colors.blue,
              ),
              keyboardType: TextInputType.number,
            ),
          ),

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

          // const Center(
          //     child: Text.rich(
          //         TextSpan(
          //             text: "Didn't receive the code? ",
          //             children: [
          //               TextSpan(
          //                 text: 'Re-send',
          //                 style: TextStyle(
          //                     fontWeight: FontWeight.bold,
          //                     color: Colors.black
          //                 ),
          //               )
          //             ]
          //         )
          //     )
          // ),

          const SizedBox(height: 40,),

          InkWell(
              onTap: () async{
                setState(() {
                  isLoading = true;
                });
                String result = await TwilioVerification.instance.verifyCode(widget.phoneNumber, codeController.text);
                setState(() {
                  isLoading = false;
                });
                if (result == 'Successful'){
                  storage.write("userPhoneNumber", widget.phoneNumber);
                  TwilioVerification.twilioId = storage.read("userPhoneNumber");

                  // storage.write("userOtp", codeController.text);
                  
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                    return const HomePage();
                  },), (route) => false);
                 print("epiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
                }
                else{
                  setState(() {print(codeController.text);
                    errorMessage = result;
                  });
                }
              },
              child: appButton(isLoading? 'Verifying...' : 'Submit')
          )

        ],
      ),
    );
  }
}