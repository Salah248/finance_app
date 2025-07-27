import 'package:finance_app/resources/app_size.dart';
import 'package:finance_app/resources/color_manager.dart';
import 'package:finance_app/resources/font_manager.dart';
import 'package:finance_app/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.supTitle = '',
    this.isSupTitle = true,
    this.isInPassChanged = false,
  });
  final String title;
  final String? supTitle;
  final bool? isSupTitle;
  final bool? isInPassChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isInPassChanged!
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: StyleManager.urbanistBold.copyWith(
            color: ColorManager.primary,
            fontSize: FontSize.fs30.sp,
          ),
        ),
        SizedBox(height: AppSize.s20.h),
        isSupTitle!
            ? Text(
                supTitle!,
                style: StyleManager.urbanistMeduim.copyWith(
                  color: ColorManager.gray,
                  fontSize: FontSize.fs16.sp,
                ),
                textAlign: isInPassChanged!
                    ? TextAlign.center
                    : TextAlign.start,
              )
            : const SizedBox(),
      ],
    );
  }
}
