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
  static final local = Locale(
    storage.read('language') ?? "en",
    storage.read('countryCode') ?? "US",
  );
  static const fallbackLocale = Locale("en", "US");
  static final languages = ["English", "العربيه"];
  static final storage = GetStorage();

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          "sign_in": "Sign In",
          "welcome_back": "Welcome Back",
          "new_password": "Create a new password",
          "lorem_ipsum":"Lorem ipsum dolor sit amet, consetetur \n sadipscing elitr, sed diam nonumy eirmod \ntempor invidunt ut.",
          "sign_in_description": "Please Sign in to access to your account",
          "phone": "Phone",
          "send": "Send",
          "full_name": "Full Name",
          "phone_required": "Phone number is required",
          "phone_length": "Phone number must be 11 digits",
          "code_length": "Code number must be 5 digits",
          "forget_password": "Forget Password!",
          "forgot_password": "Forgot Password",
          "login": "Login",
          "Login": "/login",
          "password": "Password",
          "verify": "Verify",
          "resend_code": "Resend code",
          "verification_code": "Verification Code",
          "email_address_reset_password":"Enter the Email Address \nto reset your password",
          "send_code_reset_password":"We will send you a code to reset \nyour password",
          "confirm_password": "Confirm Password",
          "no_account": "Don't have account?",
          "already_have_account": "Already have account?",
          "create_account": "Create Account",
          "enter_your_name": "Please enter your name",
          "password_required": "Password is required",
          "code_required": "Code is required",
          "confirm_password_is_required": "Confirm password is required",
          "password_does_not_match":"Password does not match",
          "password_weak": "Password is weak",
          "write_your_full_name": "Please write your full name",
          "sign_up": "Sign Up",
          "Sign_up": "Sign up",
          "Notifications": "Notifications",
          "notification": "notification",
          "name": "Name",
          "text": "ten cartons",
          "text1": "Your Zakat Saves a Life",
          "text2": "Choose your payment method",
          "text3": "All information about your computer is safe",
          "text4": "330 m x 20package",
          "text5": "Service Selection",
          "text6": "Please choose a service",
          "text7": "You haven't received the code, you can resend the code yet.",
          "number":"number",
          "paypal": "PayPal",
          "apple_pay": "Apple Pay",
          "Bank_Transfer": "Bank Transfer",
          "gift_cards": "Gift Cards",
          "debit_cards": "Debit Cards",
          "ten_cartons":"10 cartons",
          "Review_your_request": "Review your request",
          "address_price": "Omar Ibn Al-Khattab 🕌 Mosque"
              " Holy Mecca"
              "Cost: 200 Saudi riyals",
          "version": "V 3.17.11",
          "order_history": "order history",
          "orders": "/orders",
          "our_vision": "vision",
          "vision": "/vision",
          "privacy_policy": "privacy policy",
          "policy": "/policy",
          "settings": "settings",
          "setting": "/settings",
          "shared_project": "shared project",
          "Check out app": "Check out this awesome app",
          "Check app": "Check out this app!",
          "Description":
              "Madad is an application that aims to facilitate the donation of water to mosques and homes. With just a few clicks, users can contribute to the provision of clean water for ablution and daily use in mosques and homes. This innovative platform facilitates the donation process, ensuring efficient distribution and equitable access to this vital resource. Madad interface"
                  "Easy to use makes it easy to"
                  "Individuals support their communities by donating water, fostering a culture of generosity and solidarity."
                  " Join Madad today and give a real opportunity to ensure",
          "Policy":"We are in the application of the nomads of a great importance for the privacy of our users."
              'We are committed to protecting your personal data'
              "We are working hard to ensure the secret and safety of the information it provides to us."
              '\ n'
              '\ n data collection: We only collect the necessary contact information, such as name and address.'
              'Email, to facilitate the process of donating water.'
              '\ n'
              '\ n data use: We use the data we collect only for specific purposes such as processing'
              'Donations and communicate with users about future charitable campaigns.'
              '\ n'
              '\ n Data Share: We do not do'
              "By sharing user information with any external party without their explicit consent."
              '\ n'
              '\ n Data Security: We are taking the necessary security measures to protect data'
          'Users of unauthorized access or unlawful use.'
              '\ n'
              '\ n access and correction rights: We allow users'
              'Access to their personal data, update or delete them as needed.',
        },
        'ar': {
          "sign_in": "تسجيل الدخول",
          "welcome_back": "مرحبا مجددا",
          "new_password": "إنشاء كلمة مرور جديدة",
          "lorem_ipsum":"الألم نفسه مهم جدًا، سيتم إنشاء elitr Sadipscing، لكن Diam Nonumy Eirmod Eirmod يجب أن يحسد عليه.",
          "resend_code":"إعادة الإرسال",
          "verification_code":"تاكيد الكود",
          "sign_in_description": "الرجاء تسجيل الدخول للوصول إلى حسابك",
          "phone": "الهاتف",
          "send": "ارسال",
          "password": "الباسورد",
          "email_address_reset_password":"أدخل عنوان البريد الإلكتروني لإعادة تعيين كلمة المرور الخاصة بك",
          "send_code_reset_password":"سنرسل لك رمزا لإعادة تعيين كلمة المرور الخاصة بك",
          "confirm_password": "تاكيد الباسورد",
          "full_name": "اسم المستخدم",
          "verify": "تاكيد",
          "phone_required": "رقم الهاتف مطلوب",
          "phone_length": "يجب أن يكون رقم الهاتف 11 رقمًا",
          "forget_password": "نسيت كلمة المرور؟",
          "forgot_password": "نسيت كلمة المرور؟",
          "password_required": "كلمه المرور مطلوبه",
          "code_required": "يرجي ادخال الكود",
          "code_length": "يجب ان يكون الكود 5 ارقم",
          "confirm_password_is_required": "تاكيد كلمه المرور مطلوبه",
          "password_does_not_match": "كلمه المرور غير متطابقه",
          "password_weak": "كلمه المرور ضعيفه",
          "enter_your_name": "برجاء ادخال اسمك",
          "write_your_full_name": "يرجي كتابه اسمك ثلاثي",
          "login": "تسجيل الدخول",
          "Login": "تسجيل الدخول",
          "no_account": "ليس لديك حساب؟",
          "already_have_account": "هل لديك حساب بالفعل؟",
          "create_account": "انشاء حساب",
          "sign_up": "التسجيل",
          "Notifications": "الاشعارات",
          "notification": "اشعار",
          "name": "الاسم",
          "text": "عشره كراتين",
          "text1": "زكاتك تنقذ حياة",
          "text2": "اختر طريقه الدفع",
          "text3": "جميع المعلومات الخاصة بحاسبك آمنه",
          "text4": "عبوه330مx20 ",
          "text5": "اختيار الخدمه",
          "text6": "يرجي اختيار خدمه",
          "text7": "لم تستلم الكود ؟\nيمكنك إعادة إرسال الكود بعد",
          "number": "عدد",
          "paypal": "باي بال",
          "apple_pay": "أبل باي",
          "Bank_Transfer": "تحويل بنكي",
          "gift_cards": "بطاقات هدايا",
          "debit_cards": "بطاقات الخصم",
          "ten_cartons": "10 كرتونه ",
          "Review_your_request": "مراجعه طلبك",
          "address_price": "مسجد عمر بن الخطاب             🕌"
              " \n مكه المكرمه"
              "\n التكلفه : 200 ريال سعودي",
          "version": "الاصدار",
          "order history": "سجل الطلبات",
          "orders": "الطلبات",
          "our_vision": "رؤيتنا",
          "vision": "رؤيه",
          "privacy_policy": "سياسات الخصوصية",
          "policy": "الخصوصية",
          "settings": "الإعدادات",
          "setting": "الإعدادات",
          "shared_project": "شارك التطبيق",
          "Check out app": "تحقق من التطبيق",
          "Check app": "تحقق من التطبيق",
          "Description":
              "مدد هو تطبيق يهدف إلى تسهيل التبرع بالماء للمساجد والمنازل. من خلال بضع نقرات فقط، يمكن للمستخدمين المساهمة في توفير الماء النظيف للوضوء والاستخدام اليومي في المساجد والمنازل. يسهل هذا المنصة الابتكارية عملية التبرع، مما يضمن توزيعًا فعّالًا ووصولًا عادلًا لهذا المورد الحيوي. واجهة مدد"
                  " سهلة الاستخدام تجعل من السهل على "
                  "الأفراد دعم مجتمعاتهم من خلال التبرع بالماء، معززةً بذلك ثقافة السخاء والتضامن."
                  " انضم إلى مدد اليوم وقدم فرصة حقيقية لضمان الوصول إلى المياه النظيفة للجميع. ",
          "Policy":"نحن في تطبيق مدد نولي أهمية كبيرة لخصوصية مستخدمينا."
              " نحن ملتزمون بحماية بياناتك الشخصية"
              " ونعمل جاهدين على ضمان سرية وأمان المعلومات التي تقدمها لنا."
              "\n"
              "\nجمع البيانات: نقوم بجمع بيانات الاتصال الضرورية فقط، مثل الاسم وعنوان"
              " البريد الإلكتروني، لتسهيل عملية التبرع بالماء."
              "\n"
              "\nاستخدام البيانات: نحن نستخدم البيانات التي نجمعها فقط لأغراض محددة مثل معالجة"
              " التبرعات والتواصل مع المستخدمين بشأن الحملات الخيرية المستقبلية."
              "\n"
              "\nمشاركة البيانات: لا نقوم"
              " بمشاركة معلومات المستخدمين مع أي جهة خارجية دون موافقتهم الصريحة."
              "\n"
              "\nأمان البيانات: نحن نتخذ التدابير الأمنية اللازمة لحماية بيانات "
              "المستخدمين من الوصول غير المصرح به أو الاستخدام غير المسموح به."
              "\n"
              "\nحقوق الوصول والتصحيح: نحن نتيح للمستخدمين "
              "الوصول إلى بياناتهم الشخصية وتحديثها أو حذفها حسب الحاجة.",
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
