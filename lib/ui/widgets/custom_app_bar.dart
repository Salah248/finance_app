import 'package:finance_app/resources/app_size.dart';
import 'package:finance_app/resources/color_manager.dart';
import 'package:finance_app/resources/font_manager.dart';
import 'package:finance_app/resources/style_manager.dart';
import 'package:finance_app/ui/widgets/custom_arrow_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.supTitle = '',
    this.isSupTitle = true,
  });
  final String title;
  final String? supTitle;
  final bool? isSupTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomArrowBackButton(),
        SizedBox(height: AppSize.s20.h),
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
              )
            : const SizedBox(),
      ],
    );
  }
}
