import 'package:flutter/material.dart';
import 'package:mudad_app/app_constants/app_assets.dart';
import 'package:mudad_app/app_constants/app_text_styles.dart';

class PolicyPage extends StatelessWidget {
  const PolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppAssets.backGround), fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  Image.asset(AppAssets.appLogo,height: 100,),

                  FittedBox(
                      child: Text(
                        "{وَأَن تَصَدَّقُوا خَيْرٌ لَّكُمْ إِن كُنتُمْ تَعْلَمُونَ}",
                        style: AppTextStyle.quranFont,
                      )),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: const [
                    Text(
                      'سياسة الخصوصية\n'
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
                      textAlign: TextAlign.start,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600),
                    ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}