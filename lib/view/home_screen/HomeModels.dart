
import 'package:flutter/material.dart';

class HomeModel {
  imageBar({required BuildContext context, required String image}) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height / 3,
        width: double.infinity,
        child: Image.asset(
          image,
          fit: BoxFit.fill,
        ));
  }

  mainButton(
      {Function()? onTap,
        required BuildContext context,
        TextStyle? style,
        String? title,
        Color? color}) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 2, top: 10, right: 8, left: 8),
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(title!, textAlign: TextAlign.center, style: style),
      ),
    );
  }

  imageButton(String selectedButton,
      {String? image,
        Function()? onTap,
        required String title,
        TextStyle? style}) {
    return Container(
      height: 10,
      decoration: BoxDecoration(
          color: selectedButton == title
              ? const Color.fromARGB(84, 152, 166, 180)
              : null,
          borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Column(children: [
          Image.asset(
            image!,
            height: 130,
          ),
          Text(title, textAlign: TextAlign.center, style: style),
        ]),
      ),
    );
  }

  floatingButton({void Function()? onPressed, Widget? child}) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      shape: const CircleBorder(eccentricity: 1.0),
      child: child,
    );
  }

  homeBotton(BuildContext,
      {required String title,
        String? image,
        Color? backgroundColor,
        Function()? onTap,
        Color? circleColor,
        TextStyle? style}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            padding: const EdgeInsets.all(15),
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              title,
              style: style,
            ),
          ),
        ),
        Align(
          alignment: const Alignment(-0.95, 0.0),
          child: Stack(alignment: Alignment.center, children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: circleColor,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            Image.asset(
              image!,
              fit: BoxFit.contain,
            ),
          ]),
        ),
      ],
    );
  }
}