import 'package:flutter/material.dart';
import 'package:mudad_app/app_constants/app_assets.dart';
import 'package:mudad_app/app_constants/app_text_styles.dart';

class VisionPage extends StatelessWidget {
  const VisionPage({Key? key}) : super(key: key);

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
                        "{وَجَعَلْنَا مِنَ الْمَاءِ كُلَّ شَيْءٍ حَيٍّ أَفَلَا يُؤْمِنُونَ}",
                        style: AppTextStyle.quranFont,
                      )),
                ],
              ),
              const Text(
                textDirection: TextDirection.rtl,

                "مدد هو تطبيق يهدف إلى تسهيل التبرع بالماء للمساجد والمنازل. من خلال بضع نقرات فقط، يمكن للمستخدمين المساهمة في توفير الماء النظيف للوضوء والاستخدام اليومي في المساجد والمنازل. يسهل هذا المنصة الابتكارية عملية التبرع، مما يضمن توزيعًا فعّالًا ووصولًا عادلًا لهذا المورد الحيوي. واجهة مدد"
                    " سهلة الاستخدام تجعل من السهل على "
                    "الأفراد دعم مجتمعاتهم من خلال التبرع بالماء، معززةً بذلك ثقافة السخاء والتضامن."
                    " انضم إلى مدد اليوم وقدم فرصة حقيقية لضمان الوصول إلى المياه النظيفة للجميع. ",
                style: TextStyle(
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
