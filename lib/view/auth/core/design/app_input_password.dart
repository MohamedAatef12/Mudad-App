import 'package:flutter/material.dart';

class AppInputPassword extends StatefulWidget {
  final TextEditingController? controller;
  final String labelText;
  final double paddingBottom, paddingTop;
  final bool isPassword;
  final FormFieldValidator<String?>? validator;

  const AppInputPassword(
      {super.key,
        this.validator,
        this.controller,
        required this.labelText,
        this.paddingBottom = 16,
        this.paddingTop = 0,
        this.isPassword = false,
        });

  @override
  State<AppInputPassword> createState() => _AppInputState();
}

class _AppInputState extends State<AppInputPassword> {
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.only
        (bottom: widget.paddingBottom,
        top: widget.paddingTop,
      ),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        controller: widget.controller,
        validator: widget.validator,
        obscureText: isPasswordHidden && widget.isPassword,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffF3F3F3),
            ),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffF3F3F3),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffF3F3F3),
            ),
          ),
          hintText: widget.labelText,
          suffixIcon: widget.isPassword
              ? IconButton(
            icon: Icon(isPasswordHidden
                ? Icons.visibility_off
                : Icons.visibility,color: const Color(0xffCCCCCC),
              ),
            onPressed: () {
              isPasswordHidden = !isPasswordHidden;
              setState(() {});
            },
          )
              : null,
        ),
      ),
    );
  }
}