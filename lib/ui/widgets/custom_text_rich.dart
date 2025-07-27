import 'package:finance_app/resources/color_manager.dart';
import 'package:finance_app/resources/font_manager.dart';
import 'package:finance_app/resources/style_manager.dart';
import 'package:finance_app/ui/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextRow extends StatelessWidget {
  const CustomTextRow({
    super.key,
    required this.data,
    required this.text,
    this.onPressed,
  });
  final String data;
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          data,
          style: StyleManager.urbanistMeduim.copyWith(
            color: ColorManager.primary,
            fontSize: FontSize.fs15,
          ),
        ),
        SizedBox(width: 4.w),
        CustomTextButton(text: text, onPressed: onPressed),
      ],
    );
  }
}
