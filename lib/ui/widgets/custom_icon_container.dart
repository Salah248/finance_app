import 'package:finance_app/resources/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconContainer extends StatelessWidget {
  const CustomIconContainer({
    super.key,
    required this.assetName,
    this.onTap,
    this.isInMainScreens = false,
  });
  final String assetName;
  final void Function()? onTap;
  final bool? isInMainScreens;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: isInMainScreens! ? 48.w : AppSize.s105.w,
        height: isInMainScreens! ? 48.h : AppSize.s56.h,
        decoration: BoxDecoration(
          color: isInMainScreens! ? const Color(0xffECF1F6) : Colors.white,
          border: Border.all(
            color: isInMainScreens! ? Colors.white : const Color(0xffE8ECF4),
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(
            isInMainScreens! ? 12.r : RaduisSize.r8.r,
          ),
        ),
        child: SvgPicture.asset(assetName, fit: BoxFit.scaleDown),
      ),
    );
  }
}
