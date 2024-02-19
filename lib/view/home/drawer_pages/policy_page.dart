import 'package:flutter/cupertino.dart';
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
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: const [
                    Text(
                      textDirection: TextDirection.rtl,
                      "نحن في تطبيق مدد نولي أهمية كبيرة لخصوصية مستخدمينا."
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
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}