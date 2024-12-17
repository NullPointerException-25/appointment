import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/fonts.dart';
import 'package:flutter/material.dart';

class TextFormFieldCore extends StatelessWidget {
  const TextFormFieldCore(
      {super.key,
      this.controller,
      this.hintText,
      this.labelText,
      this.obscureText,
      this.keyboardType,
      this.textInputAction,
      this.focusNode,
      this.onChanged,
      this.onFieldSubmitted,
      this.validator,
      this.enabled = true,
      this.autofocus,
      this.readOnly=false,
      this.suffixIcon,
      this.prefixIcon,
      this.maxLines,
      this.minLines,
      this.expands,
      this.autofillHints,
      this.contentPadding});

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final bool enabled;
  final bool? autofocus;
  final bool? readOnly;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLines;
  final int? minLines;
  final bool? expands;
  final EdgeInsetsGeometry? contentPadding;
  final String? autofillHints;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      style: TextStyle(
        fontFamily: FontFamily.montserrat,
        color: Theme.of(context).brightness == Brightness.dark
            ? ThemeColors.white
            : ThemeColors.dark,
      ),
      maxLines: maxLines,
      minLines: minLines,
      expands: expands ?? false,
      controller: controller,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      autofocus: autofocus ?? false,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: FontFamily.montserrat,
          fontWeight: FontWeight.w300,
          color: Theme.of(context).brightness == Brightness.dark
              ? ThemeColors.white.withOpacity(0.5)
              : ThemeColors.dark.withOpacity(0.5),
        ),
        labelStyle: TextStyle(
          fontFamily: FontFamily.montserrat,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).brightness == Brightness.dark
              ? ThemeColors.white.withOpacity(0.9)
              : ThemeColors.dark.withOpacity(0.5),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        contentPadding: contentPadding,
        enabled: enabled,
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).brightness == Brightness.dark
                ? ThemeColors.white
                : ThemeColors.dark,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).brightness == Brightness.dark
                ? ThemeColors.lighterBlue
                : ThemeColors.dark,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).brightness == Brightness.dark
                ? ThemeColors.white
                : ThemeColors.dark,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).brightness == Brightness.dark
                ? ThemeColors.white.withOpacity(0.5)
                : ThemeColors.dark.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
