import 'package:finance_app/resources/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconContainer extends StatelessWidget {
  const CustomIconContainer({super.key, required this.assetName, this.onTap});
  final String assetName;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppSize.s105.w,
        height: AppSize.s56.h,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffE8ECF4), width: 1.w),
          borderRadius: BorderRadius.circular(RaduisSize.r8.r),
        ),
        child: SvgPicture.asset(assetName, fit: BoxFit.scaleDown),
      ),
    );
  }
}
