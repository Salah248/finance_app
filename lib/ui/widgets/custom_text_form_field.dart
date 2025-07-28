import 'package:finance_app/resources/app_size.dart';
import 'package:finance_app/resources/color_manager.dart';
import 'package:finance_app/resources/font_manager.dart';
import 'package:finance_app/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    required this.label,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
    this.inputFormatters,
  });
  final TextEditingController? controller;
  final String label;
  final Widget? suffixIcon;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText!,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        fillColor: const Color(0xffF7F8F9),
        filled: true,
        suffixIcon: suffixIcon,
        labelText: label,
        labelStyle: StyleManager.urbanistMeduim.copyWith(
          color: ColorManager.gray,
          fontSize: FontSize.fs15.sp,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RaduisSize.r8.r),
          borderSide: const BorderSide(color: Color(0xffE8ECF4)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RaduisSize.r8.r),
          borderSide: const BorderSide(color: Color(0xffE8ECF4)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RaduisSize.r8.r),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
