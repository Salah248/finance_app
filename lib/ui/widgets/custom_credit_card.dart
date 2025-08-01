import 'package:finance_app/resources/assets_manager.dart';
import 'package:finance_app/resources/color_manager.dart';
import 'package:finance_app/resources/style_manager.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCreditCard extends StatelessWidget {
  const CustomCreditCard({
    super.key,
    this.color,
    this.cardName,
    this.text,
    this.isTheSecondCard = false,
    this.text2,
  });

  final Color? color;
  final String? cardName;
  final String? text;
  final String? text2;
  final bool? isTheSecondCard;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 263.h,
          width: 207.w,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          width: 199.w,
          height: 201.h,
          child: Image.asset(
            ImagesManager.ellipse14,
            // width: 199.w,
            // height: 201.h,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          width: 199.w,
          height: 201.h,
          child: Image.asset(
            ImagesManager.ellipse14,
            // width: 199.w,
            // height: 201.h,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          width: 136.w,
          height: 139.h,
          child: Image.asset(
            ImagesManager.ellipse15,
            // width: 133.w,
            // height: 135.h,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          width: 136.w,
          height: 139.h,
          child: Image.asset(
            ImagesManager.ellipse15,
            // width: 133.w,
            // height: 135.h,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 24.r,
          left: 24.r,
          child: Text(
            cardName ?? 'Card Name',
            style: StyleManager.interBold.copyWith(
              color: ColorManager.neutral3,
              fontSize: 12.sp,
            ),
          ),
        ),
        Positioned(
          top: 101.r,
          left: 24.r,
          child: Text(
            'Balance',
            style: StyleManager.interMeduim.copyWith(
              color: isTheSecondCard!
                  ? ColorManager.neutral3
                  : ColorManager.white.withAlpha((255 * .5).round()),
              fontSize: 14.sp,
            ),
          ),
        ),
        Positioned(
          top: 131.r,
          left: 24.r,
          child: Text(
            '$text EG',
            style: StyleManager.interSemiBold.copyWith(
              color: ColorManager.white,
              fontSize: 24.sp,
            ),
          ),
        ),
        Positioned(
          top: 215.r,
          bottom: 24.r,
          left: 24.r,
          child: Text(
            '**** $text2',
            style: StyleManager.interMeduim.copyWith(
              color: isTheSecondCard!
                  ? ColorManager.neutral3
                  : ColorManager.white.withAlpha((255 * .5).round()),
              fontSize: 16.sp,
            ),
          ),
        ),
        Positioned(
          top: 217.r,
          bottom: 26.r,
          right: 24.r,
          child: Text(
            '12/24',
            style: StyleManager.interMeduim.copyWith(
              color: ColorManager.neutral3,
              fontSize: 12.sp,
            ),
          ),
        ),
      ],
    );
  }
}
