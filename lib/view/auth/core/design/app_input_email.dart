import 'package:flutter/material.dart';

class AppInputPhone extends StatefulWidget {
  final TextEditingController? controller;
  final String labelText;
  final double paddingBottom, paddingTop;
  final bool isPhone;
  final FormFieldValidator<String?>? validator;

  const AppInputPhone({
    super.key,
    this.validator,
    this.controller,
    required this.labelText,
    this.paddingBottom = 16,
    this.paddingTop = 0,
    required this.isPhone,
  });

  @override
  State<AppInputPhone> createState() => _AppInputState();
}

class _AppInputState extends State<AppInputPhone> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: widget.paddingBottom,
        top: widget.paddingTop,
      ),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        controller: widget.controller,
        validator: widget.validator,
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
          suffixIcon: widget.isPhone
              ? const Icon(
                  Icons.phone,
                  color: Color(0xffCCCCCC),
                )
              : const Icon(
                  Icons.person,
                  color: Color(0xffCCCCCC),
                ),
        ),
      ),
    );
  }
}
