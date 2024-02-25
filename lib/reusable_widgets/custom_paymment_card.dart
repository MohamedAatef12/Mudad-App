import 'package:flutter/cupertino.dart';

class PaymentCard extends StatelessWidget {
  PaymentCard({required this.width,required this.onTap,required this.height,required this.child,Key? key}) : super(key: key);
double height,width;
Widget child;
void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 50),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: const Color(0xffB1B1B1).withOpacity(.2),
          borderRadius: BorderRadius.circular(25),
        ),
        child: child,

      ),
    );
  }
}
