import 'package:mudad_app/view/drawer/drawer_pages/settings_page.dart';
import 'package:twilio_phone_verify/twilio_phone_verify.dart';

class TwilioVerification {
  static final instance = TwilioVerification();
  static String? twilioId = storage.read("userPhoneNumber");

  final TwilioPhoneVerify _twilioPhoneVerify = TwilioPhoneVerify(
      accountSid:
          'AC04c5e76f16532ee1d5701ae0313ae0f0', // replace with Account SID
      authToken: '60ab8513ee9c5f17fd753565d27a3300', // replace with Auth Token
      serviceSid:
          'VA1853a89766173e96625c6fe8a8fbb9a0' // replace with Service SID
      );

  Future<String> sendCode(phoneNumberController) async {
    TwilioResponse twilioResponse =
        await _twilioPhoneVerify.sendSmsCode(phoneNumberController);

    if (twilioResponse.successful!) {
      return 'Successful';
    } else {
      print(twilioResponse.errorMessage.toString());
      return twilioResponse.errorMessage.toString();
    }
  }

  Future<String> verifyCode(phoneNumber, otp) async {
    TwilioResponse twilioResponse =
        await _twilioPhoneVerify.verifySmsCode(phone: phoneNumber, code: otp);
    if (twilioResponse.successful!) {
      if (twilioResponse.verification!.status == VerificationStatus.approved) {
        return "Successful";
      } else {
        return 'Invalid code';
      }
    } else {
      return twilioResponse.errorMessage.toString();
    }
  }
}
