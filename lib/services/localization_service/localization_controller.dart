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
          "sign_in_description": "Please Sign in to access to your account",
          "phone": "Phone",
          "phone_required": "Phone number is required",
          "phone_length": "Phone number must be 11 digits",
          "forget_password": "Forget Password!",
          "login": "Login",
          "no_account": "Don't have account?",
          "sign_up": "Sign up",
          'send_again': 'Send Again',
          'Didn\'t get the code? \n You can resend it':
              'Didn\'t get the code? \n You can resend it',
          'the code must be 6 digits': 'the code must be 6 digits',
          'Please enter the code': 'Please enter the code',
          'A verification code will be sent to your phone number':
              'A verification code will be sent to your phone number',
          'Apple Pay': 'Apple Pay',
          'Bank transfer': 'Bank transfer',
          'Review your order': 'Review your order',
          'Debit cards': 'Debit cards',
          'Gift cards': 'Gift cards',
          'Choose the payment method': 'Choose the payment method',
          'All information about your computer is safe':
              'All information about your computer is safe',
          'PayPal': 'PayPal',
          'Visa/MasterCard': 'Visa/MasterCard',
          'Create a new password': 'Create a new password',
          'Your new password must be different from previous used passwords':
              'Your new password must be different from previous used passwords',
          'Password': 'Password',
          'Password is required': 'Password is required',
          'The password is weak': 'The password is weak',
          'Confirm Password': 'Confirm Password',
          'Confirm password required': 'Confirm password required',
          'Password does not match': 'Password does not match',
          'Verify': 'Verify',
          'Forgot Password': 'Forgot Password',
          'Enter the Email Address \nto reset your password':
              'Enter the Email Address \nto reset your password',
          'We will send you a code to reset \nyour password':
              'We will send you a code to reset \nyour password',
          'Phone': 'Phone',
          'Phone number required': 'Phone number required',
          'The phone number must be 11 digits':
              'The phone number must be 11 digits',
          'Send': 'Send',
          'Please Sign in to access to your account':
              'Please Sign in to access to your account',
          'Forget Password!': 'Forget Password!',
          'Login': 'Login',
          'Don\'t have account?': 'Don\'t have account?',
          'Sign up': 'Sign up',
          'Create Account': 'Create Account',
          'Please Sign up to access to your account':
              'Please Sign up to access to your account',
          'Full Name': 'Full Name',
          'Please enter your name': 'Please enter your name',
          'Please write your name in three letters':
              'Please write your name in three letters',
          'Already have account?': 'Already have account?',
          'Share the app': 'Share the app',
          'Settings': 'Settings',
          'Privacy policies': 'Privacy policies',
          'Terms and Conditions': 'Terms and Conditions',
          'Order history': 'Order history',
          'Choose the service': 'Choose the service',
          'Donate to mosques': 'Donate to mosques',
          'Donate to homes': 'Donate to homes',
          'Donate to orphanages': 'Donate to orphanages',
          'Please choose a service': 'Please choose a service',
          'Your zakat saves a life': 'Your zakat saves a life',
          'The Location is outside the permitted scope':
              'The Location is outside the permitted scope',
          'The Location has been saved successfully':
              'The Location has been saved successfully',
          'Find a home': 'Find a home',
          'Choose': 'Choose',
          'Mecca\nMosques': 'Mecca\nMosques',
          'AL Madinah\nMosques': 'AL Madinah\nMosques',
          'Jeddah\nMosques': 'Jeddah\nMosques',
          'Umrah pilgrims\nMosques': 'Umrah pilgrims\nMosques',
          'Two-year warranty': 'Two-year warranty',
          '   riyal ': '   riyal ',
          'Show': 'Show',
          'Selected mosques:': 'Selected mosques:',
          'Search for a place or mosque': 'Search for a place or mosque',
          'Selected mosques': 'Selected mosques',
          'Cancel': 'Cancel',
          'Add the mosque to the list': 'Add the mosque to the list',
          'The mosque is already on the list':
              'The mosque is already on the list',
          'Mecca\nOrphanages': 'Mecca\nOrphanages',
          'AL Madinah\nOrphanages': 'AL Madinah\nOrphanages',
          'Jeddah\nOrphanages': 'Jeddah\nOrphanages',
          'Selected orphanages': 'Selected orphanages',
          'Save Location': 'Save Location',
          'Location': 'Location',
          'Choose location': 'Choose location',
          'Add the orphanages to the list': 'Add the orphanages to the list',
          'The orphanage is already on the list':
              'The orphanage is already on the list',
          'Notifications': 'Notifications',
          'Choose Service': 'Choose Service',
          'policy': 'Privacy Policy\n'
              'Privacy policy for "Mudad" application\n'
              'Your use of the “Maddad” application and your provision of your personal information to us is considered your agreement to the terms contained in the privacy policy. “The Company” or “We” is referred to as the company responsible for the “Maddad” application registered in the Kingdom of Saudi Arabia, while “You” or “The User” represents anyone who uses the “Maddad” application. If you do not agree to these terms, you must stop using the application.\n'
              'Is your information safe?\n'
              'When you browse the application, we do not collect any personal data about you unless you decide to use and benefit from the service. When using the service, you are asked to provide some personal information such as name, email, and mobile number.\n'
              'How to process electronic payment within the application?\n'
              'We use a trusted third party to process electronic payments within the app. This third party may request your credit card information to complete the payment process.\n'
              'Do we share your personal data with other parties?\n'
              'We respect the privacy of “Mudad” application users and do not share their personal data with any third party for any purpose.\n'
              'Permissions required from the user:\n'
              'Access phone status\n'
              'Access to the camera\n'
              'Access to your site\n'
              'Internet access\n'
              'Accessing the mobile\'s external memory\n'
              'Right to modify the privacy policy:\n'
              'We reserve the right to update the Privacy Policy at any time, without prior notice. You can always check the latest updated privacy policy via the app.\n'
              'Use of cookies in the "Mudad" application\n'
              '1. Purpose of cookies:\n'
              'We use cookies to improve user experience and provide personalized services.\n'
              'Can be used to track activities and interactions within the app to analyze and improve its performance.\n'
              '2. Types of cookies we use:\n'
              'Essential Cookies: These are essential for the application to function properly and allow you to access essential services and features.\n'
              'Performance cookies: They help understand how users use the application and improve its performance.\n'
              'Targeting Cookies: These are used to provide targeted advertising that is relevant to the user\'s interests.\n'
              '3. User consent to the use of cookies:\n'
              'User consent is requested when using the application for the first time.\n'
              'The user can determine cookie settings through the application or web browser settings.\n'
              '4. Not using cookies for specific purposes:\n'
              'We do not use cookies to track users\' personal information without their consent.\n'
              '5. User rights in relation to cookies:\n'
              'The user has the right to modify or delete cookie settings through the privacy options in the application.\n'
              '6. How effective are cookies:\n'
              'Users are provided periodic notifications about the use of cookies and checked to ensure their consent.\n'
              '7. Compliance with cookie legislation:\n'
              'Maddad application is committed to complying with all legislation related to cookies in Saudi Arabia.\n'
              'Changes to the privacy policy of the "Mudad" application\n'
              'Last updated: [update date]\n'
              'We reserve the right to make changes to our Privacy Policy to reflect best security practices and meet the requirements of personal data protection legislation. Please review this policy periodically to ensure you are aware of the latest updates.\n'
              'Reasons for updating:\n'
              'Service Improvement: We may improve and expand our Services, which may require updates to our Privacy Policy to reflect these improvements.\n'
              'Compliance with legislation: Data protection legislation can change, and we are committed to complying with it, which may necessitate changes to the privacy policy.\n'
              'How to check for updates:\n'
              'You can always check the latest updated privacy policy via the \'Privacy Policy\' section in the app settings.\n'
              'We will provide in-app notification of any significant changes to our privacy policy.\n'
              'User rights:\n'
              'If you do not agree to the new changes, you are advised to stop using the application.\n'
              'You have the right to modify or delete the personal information you provide in the application.\n'
              'Contact us:\n'
              'If you have any questions or inquiries about privacy policy changes, please contact the technical support team via [support@mudadapp.com / 0567205516].',
          'terms': 'Terms and conditions for the "Mudad" application\n'
              '1. General Terms:\n'
              'Before using the "Mudad" application and registering your membership, you must read and agree to the User Agreement and the associated privacy policy. You must also read all terms and conditions related to the service through the application\'s links.\n'
              '2. Membership conditions:\n'
              'App membership is granted to individuals over the age of 15. You must provide proof of your age to activate your account. The application reserves the right to cancel any member\'s account without prior notice if he is not over 15 years of age.\n'
              '3. Collection of personal data:\n'
              'When browsing the application, no personal data is collected until the service is used. When used, personal data such as name, email, mobile number, and location are collected.\n'
              '4. Use of personal data:\n'
              'Personal data is used for purposes such as registering for the app, personalizing your experience, determining delivery time, and receiving promotional offers.\n'
              '5. Electronic payment processing:\n'
              'A trusted third party is used to process electronic payments. This third party requires credit card information to complete the payment process.\n'
              '6. Sharing personal data:\n'
              'We do not sell or share personal data with any third party for any purpose.\n'
              '7. Personal data security:\n'
              'Advanced security technologies are used to keep personal data private. However, Madad does not bear responsibility for any security violations that occur through the user\'s device.\n'
              '8. Updates and changes to the terms and conditions:\n'
              'We reserve the right to make updates to the Terms of Use and Privacy Policy without prior notice. Users are requested to review the Terms periodically for changes.\n'
              '9. Cancel account:\n'
              'Any user is prohibited from using the application without providing the required information. The application reserves the right to cancel unconfirmed or unverified accounts or accounts that have been inactive for a long time.\n'
              '10. Dealing with non-ownership accounts:\n'
              'The use of accounts that do not belong to the individual user is prohibited. If a non-owned account is discovered, the “Mudad” application has the right to cancel this account without prior notice and hold the user responsible.\n'
              '11. User compliance with notifications:\n'
              'The user must periodically update his personal information and agree to receive notifications related to the application, including promotions and updates.\n'
              '12. Compliance with local legislation and laws:\n'
              'The user is obligated to comply with all local legislation and laws related to electronic use and electronic commerce.\n'
              '13. Specific conditions for commercial establishments:\n'
              'If registering on behalf of a commercial enterprise, the user must be able to act on behalf of that enterprise and comply with the terms of the agreement.\n'
              '14. Amendments to the privacy policy:\n'
              'Maddad application reserves the right to update the privacy policy at any time without prior notice. The user should review the policy periodically to ensure understanding of the latest updates.\n'
              '15. Responsibility for personal safety:\n'
              'The user is responsible for securing his personal account and avoiding sharing login data with others. The "Maddad" application requires the user to inform them immediately upon discovering any unauthorized use of their account.\n'
              '16. Cancellation and suspension:\n'
              'Maddad application has the right to cancel or suspend any account in the event that any of the above conditions are violated or the user is involved in activities considered illegal.\n'
              'Madad seeks to provide a safe and effective experience for users. The user is required to read these terms and conditions carefully and fully understand them before using the application.\n',
        },
        'ar': {
          'Debit cards': 'بطاقات الخصم',
          'Gift cards': 'بطاقات هدايا',
          'Choose the payment method': 'إختر طريقة الدفع',
          'All information about your computer is safe':
              'جميع المعلومات الخاصة بحاسبك آمنه',
          'PayPal': 'باي بال',
          'Visa/MasterCard': 'بطاقة فيزا/ماستر كارد',
          'Create a new password': 'إنشاء كلمة مرور جديدة',
          'Your new password must be different from previous used passwords':
              'يجب أن تكون كلمة المرور الجديدة مختلفة عن كلمات المرور السابقة المستخدمة',
          'Password': 'كلمة المرور',
          'Password is required': 'كلمه المرور مطلوبه',
          'The password is weak': 'كلمه المرور ضعيفه',
          'Confirm Password': 'تأكيد كلمة المرور',
          'Confirm password required': 'تاكيد كلمه المرور مطلوبه',
          'Password does not match': 'كلمه المرور غير متطابقه',
          'Verify': 'تحقق',
          'Forgot Password': 'نسيت كلمة المرور',
          'Enter the Email Address \nto reset your password':
              'أدخل البريد الإلكتروني \n لإعادة تعيين كلمة المرور',
          'We will send you a code to reset \nyour password':
              'سنرسل لك كود لإعادة تعيين \nكلمة المرور',
          'Phone': 'الهاتف',
          'Phone number required': 'رقم الهاتف مطلوب',
          'The phone number must be 11 digits': 'يجب ان يكون رقم الهاتف 11 رقم',
          'Send': 'إرسال',
          'Please Sign in to access to your account':
              'الرجاء تسجيل الدخول للوصول إلى حسابك',
          'Forget Password!': 'نسيت كلمة المرور!',
          'Login': 'تسجيل الدخول',
          'Don\'t have account?': 'ليس لديك حساب؟',
          'Sign up': 'التسجيل',
          'Create Account': 'إنشاء حساب',
          'Please Sign up to access to your account':
              'الرجاء التسجيل للوصول إلى حسابك',
          'Full Name': 'الاسم الكامل',
          'Please enter your name': 'برجاء ادخال اسمك',
          'Please write your name in three letters': 'يرجي كتابه اسمك ثلاثي',
          'Already have account?': 'هل لديك حساب؟',
          'Share the app': 'شارك التطبيق',
          'Settings': 'الإعدادات',
          'Privacy policies': 'سياسات الخصوصية',
          'Terms and Conditions': 'الشروط والاحكام',
          'Order history': 'سجل الطلبات',
          'Choose the service': "إختيار الخدمة",
          'Donate to mosques': "التبرع للمساجد",
          'Donate to homes': "التبرع للمنازل",
          'Donate to orphanages': "التبرع لدور الأيتام",
          'Please choose a service': 'يرجي اختيار خدمه',
          'Your zakat saves a life': 'زكاتك تنقذ حياة',
          'The Location is outside the permitted scope':
              'الموقع خارج النطاق المسموح به',
          'The Location has been saved successfully': 'تم حفظ الموقع بنجاح',
          'Find a home': 'ابحث عن منزل',
          'Choose': 'اخـتـيـار',
          'Mecca\nMosques': 'مساجد\nمــكــة',
          'AL Madinah\nMosques': ' مساجد\n المدينة',
          'Jeddah\nMosques': 'مساجد\n  جــدة',
          'Umrah pilgrims\nMosques': 'مساجد\n  المعتمرين',
          'Two-year warranty': 'ضمان لمدة سنتين',
          '   riyal ': '   ريال ',
          'Show': 'عرض',
          'Selected mosques:': 'المساجد المختارة:',
          'Search for a place or mosque': 'ابحث عن مكان او مسجد',
          'Selected mosques': 'المساجد المختارة',
          'Cancel': 'إلغاء',
          'Add the mosque to the list': 'اضف المسجد الى القائمة',
          'The mosque is already on the list': 'المسجد موجود في القائمة بالفعل',
          'Mecca\nOrphanages': 'دور\nمــكــة',
          'AL Madinah\nOrphanages': ' دور\n المدينة',
          'Jeddah\nOrphanages': 'دور\n  جــدة',
          'Selected orphanages': 'دور الايتام المختارة',
          'Save Location': 'حفظ الموقع',
          'Location': 'الموقع',
          'Choose location': 'اختر الموقع',
          'Add the orphanages to the list': 'اضف الدار الى القائمة',
          'The orphanage is already on the list':
              'دار الايتام موجود في القائمة بالفعل',
          'Notifications': 'الإشعارات',
          'Choose Service': 'اختيار الخدمة',
          'policy': 'سياسة الخصوصية\n'
              'سياسة الخصوصية لتطبيق "مدد"\n'
              'استخدامك لتطبيق “مدد” وتقديمك لمعلوماتك الشخصية لنا يعتبر موافقة منك على البنود الواردة في سياسة الخصوصية. يُشار إلى “الشركة” أو “نحن” كالشركة المسؤولة عن تطبيق “مدد” المُسجلة في المملكة العربية السعودية، بينما “أنت” أو “المستخدم” يُمثل أي شخص يستخدم تطبيق “مدد”. إذا كنت غير موافق على هذه البنود، فعليك التوقف عن استخدام التطبيق.\n'
              'هل معلوماتك آمنة؟\n'
              'عندما تصفح التطبيق، لا نقوم بجمع أي بيانات شخصية عنك ما لم تقرر استخدام الخدمة والاستفادة منها. عند استخدام الخدمة، يُطلب منك تقديم بعض المعلومات الشخصية كالاسم، البريد الإلكتروني، ورقم الجوال.\n'
              'كيفية معالجة الدفع الإلكتروني داخل التطبيق؟\n'
              'نستخدم طرفًا ثالثًا موثوقًا لمعالجة عمليات الدفع الإلكتروني داخل التطبيق. يمكن لهذا الطرف الثالث طلب معلومات بطاقتك الائتمانية لإتمام عملية الدفع.\n'
              'هل نشارك بياناتك الشخصية مع أطراف أخرى؟\n'
              'نحن نحترم خصوصية مستخدمي تطبيق “مدد” ولا نشارك بياناتهم الشخصية مع أي طرف ثالث لأي غرض كان.\n'
              'الصلاحيات المطلوبة من المستخدم:\n'
              'الوصول إلى حالة الهاتف\n'
              'الوصول للكاميرا\n'
              'الوصول لموقعك\n'
              'الوصول إلى شبكة الإنترنت\n'
              'الوصول إلى الذاكرة الخارجية للجوال\n'
              'حق تعديل سياسة الخصوصية:\n'
              'نحتفظ بحق تحديث سياسة الخصوصية في أي وقت، دون إشعار مُسبق. يمكنك دائمًا التحقق من آخر تحديث لسياسة الخصوصية عبر التطبيق.\n'
              'استخدام ملفات تعريف الارتباط في تطبيق "مدد"\n'
              '1. الغرض من ملفات تعريف الارتباط:\n'
              'تستخدم ملفات تعريف الارتباط لتحسين تجربة المستخدم وتوفير خدمات مخصصة.\n'
              'يمكن استخدامها لتتبع الأنشطة والتفاعلات داخل التطبيق لتحليل أداءه وتحسينه.\n'
              '2. أنواع ملفات تعريف الارتباط التي نستخدمها:\n'
              'ملفات تعريف الارتباط الأساسية (Essential Cookies): تكون ضرورية لتشغيل التطبيق بشكل صحيح، وتتيح لك الوصول إلى الخدمات والميزات الأساسية.\n'
              'ملفات تعريف الارتباط الأدائية (Performance Cookies): تساعد في فهم كيفية استخدام المستخدمين للتطبيق وتحسين أدائه.\n'
              'ملفات تعريف الارتباط الاستهداف (Targeting Cookies): تستخدم لتوفير إعلانات مستهدفة وملائمة لاهتمامات المستخدم.\n'
              '3. موافقة المستخدم على استخدام ملفات تعريف الارتباط:\n'
              'يتم طلب موافقة المستخدم عند استخدام التطبيق لأول مرة.\n'
              'يمكن للمستخدم تحديد إعدادات ملفات تعريف الارتباط من خلال إعدادات التطبيق أو متصفح الويب.\n'
              '4. عدم استخدام ملفات تعريف الارتباط لأغراض محددة:\n'
              'لا نستخدم ملفات تعريف الارتباط لتتبع معلومات شخصية خاصة بالمستخدمين دون موافقتهم.\n'
              '5. حقوق المستخدم فيما يتعلق بملفات تعريف الارتباط:\n'
              'يحق للمستخدم تعديل إعدادات ملفات تعريف الارتباط أو حذفها من خلال خيارات الخصوصية في التطبيق.\n'
              '6. مدى فعالية ملفات تعريف الارتباط:\n'
              'يتم تقديم إشعارات دورية للمستخدمين حول استخدام ملفات تعريف الارتباط وفحصها للتأكد من موافقتهم.\n'
              '7. الامتثال للتشريعات الخاصة بملفات تعريف الارتباط:\n'
              'يلتزم تطبيق "مدد" بالامتثال لجميع التشريعات المتعلقة بملفات تعريف الارتباط في السعودية.\n'
              'تغييرات في سياسة الخصوصية لتطبيق "مدد"\n'
              'تحديث أخير: [تاريخ التحديث]\n'
              'نحتفظ بحق إجراء تغييرات في سياسة الخصوصية لدينا لتعكس أفضل ممارسات الأمان وتلبي متطلبات التشريعات الخاصة بحماية البيانات الشخصية. نرجى مراجعة هذه السياسة بشكل دوري للتأكد من أنك على دراية بأحدث التحديثات.\n'
              'أسباب التحديث:\n'
              'تحسين الخدمة: قد نقوم بتحسين وتوسيع خدماتنا، مما يستدعي تحديثات في سياسة الخصوصية لتعكس هذه التحسينات.\n'
              'الامتثال للتشريعات: يمكن أن تتغير التشريعات المتعلقة بحماية البيانات، ونلتزم بالامتثال لها، مما قد يستلزم تغييرات في سياسة الخصوصية.\n'
              'طريقة التحقق من التحديثات:\n'
              'يمكنك دائمًا التحقق من آخر تحديث لسياسة الخصوصية عبر قسم "سياسة الخصوصية" في إعدادات التطبيق.\n'
              'سنقوم بتوفير إشعار داخل التطبيق بأي تغييرات هامة في سياسة الخصوصية.\n'
              'حقوق المستخدم:\n'
              'في حال عدم موافقتك على التغييرات الجديدة، يُفضل عليك التوقف عن استخدام التطبيق.\n'
              'لديك الحق في تعديل أو حذف المعلومات الشخصية التي قدمتها في التطبيق.\n'
              'تواصل معنا:\n'
              'إذا كانت لديك أي أسئلة أو استفسارات حول تغييرات سياسة الخصوصية، يرجى التواصل مع فريق الدعم الفني عبر [support@mudadapp.com / 0567205516].',
          'terms': 'الشروط والأحكام لتطبيق "مدد"\n'
              '1. البنود العامة:\n'
              'قبل استخدام تطبيق "مدد" وتسجيل عضويتك، يتعين عليك قراءة والموافقة على اتفاقية المستخدم وسياسة الخصوصية المرتبطة به. يتعين أيضًا عليك قراءة جميع الشروط والأحكام المتعلقة بالخدمة من خلال الروابط الخاصة بالتطبيق.\n'
              '2. شروط العضوية:\n'
              'تُمنح عضوية التطبيق للأفراد الذين تجاوزوا سن الـ 15 عامًا. يتعين عليك تقديم إثبات عمرك لتفعيل حسابك. يحتفظ التطبيق بحقه في إلغاء حساب أي عضو دون سابق إنذار إذا لم يكن قد تجاوز سن الـ 15 عامًا.\n'
              '3. جمع البيانات الشخصية:\n'
              'عند تصفح التطبيق، لا يتم جمع أي بيانات شخصية حتى يتم استخدام الخدمة. عند الاستخدام، يتم جمع البيانات الشخصية مثل الاسم، البريد الإلكتروني، رقم الجوال، والموقع.\n'
              '4. استخدام البيانات الشخصية:\n'
              'يتم استخدام البيانات الشخصية لأغراض مثل التسجيل في التطبيق، تخصيص تجربتك، تحديد وقت التوصيل، وتلقي العروض الترويجية.\n'
              '5. معالجة الدفع الإلكتروني:\n'
              'يتم استخدام طرف ثالث موثوق لمعالجة عمليات الدفع الإلكتروني. يُطلب من هذا الطرف الثالث معلومات بطاقة الائتمان لإتمام عملية الدفع.\n'
              '6. مشاركة البيانات الشخصية:\n'
              'لا نبيع أو نشارك البيانات الشخصية مع أي طرف ثالث لأي غرض.\n'
              '7. أمان البيانات الشخصية:\n'
              'يتم استخدام تقنيات أمان متقدمة للحفاظ على خصوصية البيانات الشخصية. لكن "مدد" لا تتحمل مسؤولية أي انتهاكات أمنية تحدث من خلال جهاز المستخدم.\n'
              '8. تحديثات وتغييرات في الشروط والأحكام:\n'
              'نحتفظ بالحق في إجراء تحديثات على شروط الاستخدام وسياسة الخصوصية بدون إشعار مُسبق. يُطلب من المستخدمين مراجعة الشروط بشكل دوري لمتابعة التغييرات.\n'
              '9. إلغاء الحساب:\n'
              'يُحظر استخدام التطبيق لأي مستخدم دون توفره للمعلومات المطلوبة. يحتفظ التطبيق بالحق في إلغاء حسابات غير مؤكدة أو غير موثقة أو الحسابات الغير نشطة لفترة طويلة.\n'
              '10. التعامل مع الحسابات الغير ملكية:\n'
              'يُمنع استخدام حسابات لا تعود ملكيتها للفرد المستخدم. في حال اكتشاف حساب غير ملكي، يحق لتطبيق "مدد" إلغاء هذا الحساب دون إشعار مسبق وتحميل المستخدم المسؤولية.\n'
              '11. التزام المستخدم بالإشعارات:\n'
              'يجب على المستخدم تحديث معلوماته الشخصية بشكل دوري والموافقة على تلقي الإشعارات المتعلقة بالتطبيق، بما في ذلك العروض الترويجية والتحديثات.\n'
              '12. الامتثال للتشريعات المحلية والقوانين:\n'
              'يُلزم المستخدم بالامتثال لجميع التشريعات والقوانين المحلية المتعلقة بالاستخدام الإلكتروني والتجارة الإلكترونية.\n'
              '13. الشروط المحددة للمؤسسات التجارية:\n'
              'في حالة التسجيل نيابةً عن مؤسسة تجارية، يجب أن يكون المستخدم قادرًا على التصرف نيابةً عن هذه المؤسسة والامتثال لشروط الاتفاقية.\n'
              '14. التعديلات في سياسة الخصوصية:\n'
              'يحتفظ تطبيق "مدد" بحق تحديث سياسة الخصوصية في أي وقت دون إشعار مسبق. يتعين على المستخدم مراجعة السياسة بشكل دوري للتأكد من فهم أحدث التحديثات.\n'
              '15. المسؤولية عن الأمان الشخصي:\n'
              'يتحمل المستخدم مسؤولية تأمين حسابه الشخصي وتجنب مشاركة بيانات الدخول مع الآخرين. تفرض تطبيق "مدد" على المستخدم إعلامهم فور اكتشاف أي استخدام غير مصرح به لحسابهم.\n'
              '16. الإلغاء والتعليق:\n'
              'يحق لتطبيق "مدد" إلغاء أو تعليق أي حساب في حالة انتهاك أي من الشروط المذكورة أعلاه أو تورط المستخدم في أنشطة تعتبر غير قانونية.\n'
              'تسعى "مدد" إلى توفير تجربة مأمونة وفعّالة للمستخدمين. يُطلب من المستخدم قراءة هذه الشروط والأحكام بعناية وفهمها بشكل كامل قبل استخدام التطبيق.\n',
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
