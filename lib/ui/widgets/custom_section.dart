import 'package:finance_app/resources/color_manager.dart';
import 'package:finance_app/resources/style_manager.dart';
import 'package:finance_app/ui/widgets/custom_icon_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSection extends StatelessWidget {
  const CustomSection({
    super.key,
    required this.assetName,
    required this.text,
    required this.text2,
    this.isInStatisticScreen = false,
  });
  final String assetName;
  final String text;
  final String text2;
  final bool? isInStatisticScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156.w,
      height: 140.h,
      padding: isInStatisticScreen!
          ? EdgeInsets.only(left: 16.r)
          : EdgeInsets.zero,
      decoration: BoxDecoration(
        color: ColorManager.neutral3,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xffE3E9ED), width: 1.w),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: isInStatisticScreen!
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          CustomIconContainer(
            assetName: assetName,
            isInMainScreens: true,
            onTap: () {},
          ),
          Text(
            text,
            style: StyleManager.interSemiBold.copyWith(
              color: ColorManager.neutral2,
              fontSize: 16.sp,
            ),
          ),
          Text(
            text2,
            style: StyleManager.interMeduim.copyWith(
              color: ColorManager.neutral,
              fontSize: 12.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
