// import 'dart:ui';
//
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:mudad_app/app_constants/locals.dart';
// import 'package:mudad_app/services/localization_service/language_model.dart';

// class LocalizationController extends GetxController implements GetxService {
//   LocalizationController({required this.languageStorage}){
//     // loadCurrentLanguage();
//
//   }
//
//   GetStorage languageStorage = GetStorage();
//
//   final Locale _locale = Locale(
//       AppLocals.languages[0].languageCode, AppLocals.languages[0].countryCode);
//   final int _selectedIndex = 0;
//   int get selectedIndex => _selectedIndex;
//   final List<LanguageModel> _languages = [];
//   Locale get locale => _locale;
//   List<LanguageModel> get languages => _languages;
// }

import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalizationService extends Translations {
  static final local = Locale( storage.read('language') ?? "en",
    storage.read('countryCode') ?? "US",);
  static const fallbackLocale = Locale("en", "US");
  static final languages = ["English", "العربيه"];
  static final storage = GetStorage();

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          "sign_in": "Sign In",
          "welcome_back": "Welcome Back",
          "sign_in_description": "Please Sign in to access to your account",
          "phone": "Phone",
          "phone_required": "Phone number is required",
          "phone_length": "Phone number must be 11 digits",
          "forget_password": "Forget Password!",
          "login": "Login",
          "no_account": "Don't have account?",
          "sign_up": "Sign up",
          "Notifications":"Notifications"
        },
        'ar': {
          "sign_in": "تسجيل الدخول",
          "welcome_back": "مرحبا مجددا",
          "sign_in_description": "الرجاء تسجيل الدخول للوصول إلى حسابك",
          "phone": "الهاتف",
          "phone_required": "رقم الهاتف مطلوب",
          "phone_length": "يجب أن يكون رقم الهاتف 11 رقمًا",
          "forget_password": "نسيت كلمة المرور؟",
          "login": "تسجيل الدخول",
          "no_account": "ليس لديك حساب؟",
          "sign_up": "التسجيل",
          "Notifications" : "الاشعارات"
        },
      };

  void changeLocale(String lang) {
    lang = getLanguage().toString() ;
    lang == 'en' ? 'ar' : 'en';
    if(lang == "en" ){
      lang = 'ar';
    }else {
      lang = "en";
    }
    storage.write('language', lang);
    Get.updateLocale(Locale(lang));
  }


  String getLanguage() {
    return storage.read('language') ?? 'en';
  }
}
