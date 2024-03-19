import 'package:flutter/material.dart';
import 'package:mudad_app/app_constants/app_colors.dart';

class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final String? labelText;
  final TextInputType keyboardType;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  final bool obSecured;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? initialValue;
  final String? hintText;
  final String? suffixText;
  final TextStyle? suffixTextStyle;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? cursorColor;
  final double radius;
  final double? height;
  final double horizontalPadding;
  final InputBorder? inputBorder;
  final InputBorder? inputEnabledBorder;
  final InputBorder? inputFocusedBorder;
  final InputBorder? inputDisabledBorder;
  final EdgeInsetsGeometry? contentPadding;
  final AlignmentGeometry? containerAlignment;
  final BoxConstraints? suffixIconConstraints;
  final bool readOnly;
  final int? maxLength;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextInputAction textInputAction;
  final String obscuringChar;

  const DefaultFormField({
    Key? key,
    required this.controller,
    this.validator,
    this.onTap,
    this.labelText,
    required this.keyboardType,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onChanged,
    required this.obSecured,
    this.prefixIcon,
    this.suffixIcon,
    this.initialValue,
    this.hintText,
    this.backgroundColor,
    this.height,
    this.radius = 20,
    this.enabled = true,
    this.inputBorder = const OutlineInputBorder(borderSide: BorderSide.none),
    this.inputEnabledBorder,
    this.inputFocusedBorder,
    this.inputDisabledBorder,
    this.horizontalPadding = 0,
    this.textColor,
    this.contentPadding,
    this.containerAlignment,
    this.suffixText,
    this.suffixTextStyle,
    this.suffixIconConstraints,
    this.readOnly = false,
    this.cursorColor,
    this.maxLength,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.textInputAction = TextInputAction.next,
    this.obscuringChar = "*",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      readOnly: readOnly,
      cursorColor: cursorColor,
      enabled: enabled,
      textAlignVertical: TextAlignVertical.center,
      textAlign: textAlign,
      textDirection: textDirection,
      initialValue: initialValue,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      onTap: onTap,
      obscureText: obSecured,
      style: TextStyle(
        color: textColor,
      ),
      decoration: InputDecoration(
        helperStyle: const TextStyle(backgroundColor: Colors.transparent),
        filled: true,
        fillColor: Colors.white,
        suffixStyle: suffixTextStyle,
        suffixText: suffixText,
        contentPadding: contentPadding,
        isDense: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        suffixIconConstraints: suffixIconConstraints,
        labelText: labelText,
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.red),
          borderRadius: BorderRadius.circular(8.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.red),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: AppColors.buttonColor),
          borderRadius: BorderRadius.circular(8.0),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
