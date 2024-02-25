import 'package:flutter/material.dart';

import '../app_constants/app_colors.dart';
import '../app_constants/app_text_styles.dart';

class CustomButton extends StatelessWidget {

  CustomButton(this.text, this.onPressed,this.image ,{super.key});
  String text;
  String image;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 15),
      child: InkWell(onTap: onPressed,
        borderRadius: BorderRadius.circular(10), child: Container(
          height: MediaQuery.of(context).size.height*.07,
        width: double.infinity,
          decoration: BoxDecoration( borderRadius: BorderRadius.circular(10),
            color: AppColors.buttonColor,

      ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(image),
              ),
              Expanded(child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(text,style: AppTextStyle.mainFont,textAlign: TextAlign.center),
                  ))),
            ],
          )),
      ),
    );
  }
}
