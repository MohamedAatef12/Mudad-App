import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalizationService extends Translations {
  static final local = Locale(
    storage.read('language') ?? "ar",
    storage.read('countryCode') ?? "US",
  );
  static const fallbackLocale = Locale("en", "US");
  static final languages = ["English", "العربيه"];
  static final storage = GetStorage();

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          //splash
          "splash_txt": "your charity saves lives",
          //auth
          "sign_in": "Sign In",
          "welcome_back": "Welcome Back",
          "sign_in_description": "Please Sign in to access to your account",
          "name" :"Name",
          "email": "Email",
          "phone": "Phone Number",
          "password": "Password",
          "password_confirmation": "Confirm password",
          "no_account": "Don't have account?",
          "login": "Login",
          "sign_up": "Sign up",
          "create_account" : "Create Account",
          "signUp_description" : "Please Sign up to access to your account",
          "already_have_account" : "Already have account?",
          //validations
          "empty_email_val":"Please enter your email address.",
          "wrong_email_val":"Please enter a valid email address.",
          "empty_password_val":"Password is required",
          "weak_password_val":"Weak password",
          "auth_failed":"Please enter a valid account data",
          "empty_name_val":"Please enter your name",
          "empty_phone_val":"Please enter your phone number",
          "empty_password_confirmation_val":"Password confirmation is required",
          "password_didnt_match_val":"password didn't match",


          "Notifications": "Notifications"
        },
        'ar': {
          //splash
          "splash_txt": "زكاتك تنقذ حياه",
          //auth
          "sign_in": "تسجيل الدخول",
          "welcome_back": "مرحبا مجددا",
          "sign_in_description": "الرجاء تسجيل الدخول للوصول إلى حسابك",
          "name" : "الاسم",
          "email": "البريد الالكتؤوني",
          "password": "كلمه المرور",
          "password_confirmation": "تاكيد كلمه المرور",
          "phone": "الهاتف",
          "no_account": "ليس لديك حساب؟",
          "login": "تسجيل الدخول",
          "sign_up": "التسجيل",
          "create_account" : "انشاء حساب",
          "signUp_description" : "قم بالتسجيل لتستطيع الوصول الى حسابك",
          "already_have_account" : "لديك بالفعل حساب؟",

          //validations
          "empty_email_val":"برجاء ادخال عنوان بريدك الالكتروني.",
          "wrong_email_val":"برجاء ادخال بريد الكتروني صحيح.",
          "empty_password_val":"كلمه السر مطلوبه.",
          "weak_password_val":"كلمه السر ضعيفه.",
          "auth_failed":"من فضلك ادخل البيانات بشكل صحيح.",
          "empty_name_val":"برجاء ادخال الاسم.",
          "empty_phone_val":"برجاء ادخال رقم الهاتف.",
          "empty_password_confirmation_val":"تاكيد كلمه السر مطلوب.",
          "password_didnt_match_val":"كلمه السر غير مطابقه.",




          "phone_required": "رقم الهاتف مطلوب",
          "phone_length": "يجب أن يكون رقم الهاتف 11 رقمًا",


          "Notifications": "الاشعارات"
        },
      };

  void changeLocale(String lang) {
    lang = getLanguage().toString();
    lang == 'en' ? 'ar' : 'en';
    if (lang == "en") {
      lang = 'ar';
    } else {
      lang = "en";
    }
    storage.write('language', lang);
    Get.updateLocale(Locale(lang));
  }

  String getLanguage() {
    return storage.read('language') ?? 'en';
  }
}
