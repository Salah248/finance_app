import 'package:finance_app/resources/assets_manager.dart';
import 'package:finance_app/resources/color_manager.dart';
import 'package:finance_app/resources/style_manager.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCreditCard extends StatelessWidget {
  const CustomCreditCard({
    super.key,
    this.color,
    this.cardName,
    this.text,
    this.isTheSecondCard = false,
    this.text2,
    this.isTheMyCard = false,
  });

  final Color? color;
  final String? cardName;
  final String? text;
  final String? text2;
  final bool? isTheSecondCard;
  final bool? isTheMyCard;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: isTheMyCard! ? 179.h : 263.h,
          width: isTheMyCard! ? 327.w : 207.w,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        Positioned(
          bottom: 0.r,
          left: 0.r,
          child: Image.asset(
            ImagesManager.ellipse14,
            width: 199.w,
            height: 201.h,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 0.r,
          left: 0.r,
          child: Image.asset(
            ImagesManager.ellipse14,
            width: 199.w,
            height: 201.h,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 0.r,
          left: 0.r,
          child: Image.asset(
            ImagesManager.ellipse15,
            width: 133.w,
            height: 135.h,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 0.r,
          left: 0.r,
          child: Image.asset(
            ImagesManager.ellipse15,
            width: 133.w,
            height: 135.h,
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
          top: isTheMyCard! ? 62.r : 101.r,
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
          top: isTheMyCard! ? 92.r : 131.r,
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
          top: isTheMyCard! ? 138.r : 215.r,
          bottom: isTheMyCard! ? 17.r : 24.r,
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
          bottom: isTheMyCard! ? 19.r : 26.r,
          right: isTheMyCard! ? 29.r : 24.r,
          child: Text(
            '12/24',
            style: StyleManager.interMeduim.copyWith(
              color: ColorManager.neutral3,
              fontSize: 12.sp,
            ),
          ),
        ),
        isTheMyCard!
            ? Positioned(
                top: 26,
                right: 29,
                child: SvgPicture.asset(
                  IconsManager.visa,
                  width: 52.w,
                  height: 16.h,
                  color: ColorManager.neutral3,
                  fit: BoxFit.fill,
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
