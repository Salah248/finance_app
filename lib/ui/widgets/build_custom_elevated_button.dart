import 'package:finance_app/resources/app_size.dart';
import 'package:finance_app/resources/color_manager.dart';
import 'package:finance_app/resources/font_manager.dart';
import 'package:finance_app/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isInLoginBtn = true,
  });

  final String title;
  final VoidCallback onPressed;
  final bool? isInLoginBtn;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isInLoginBtn!
            ? ColorManager.primary
            : ColorManager.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RaduisSize.r8.r),
        ),
        fixedSize: Size(AppSize.s331.w, AppSize.s56.h),
        side: const BorderSide(
          color: ColorManager.primary,
          width: 1.0,
          style: BorderStyle.solid,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: StyleManager.urbanistSemiBold.copyWith(
          fontSize: FontSize.fs15.sp,
          color: isInLoginBtn! ? ColorManager.white : ColorManager.primary,
        ),
      ),
    );
  }
}
