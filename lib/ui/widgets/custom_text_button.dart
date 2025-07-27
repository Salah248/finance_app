import 'package:finance_app/resources/color_manager.dart';
import 'package:finance_app/resources/font_manager.dart';
import 'package:finance_app/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, this.onPressed, required this.text});
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
      onPressed: onPressed,
      child: Text(
        text,
        style: StyleManager.urbanistBold.copyWith(
          fontSize: FontSize.fs15.sp,
          color: ColorManager.secondary2,
        ),
      ),
    );
  }
}
