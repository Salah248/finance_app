import 'package:finance_app/resources/app_size.dart';
import 'package:finance_app/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CustomArrowBackButton extends StatelessWidget {
  const CustomArrowBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pop(),
      child: Container(
        height: AppSize.s41.h,
        width: AppSize.s41.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RaduisSize.r12),
          border: Border.all(color: const Color(0xffE8ECF4)),
        ),
        child: SvgPicture.asset(IconsManager.vector, fit: BoxFit.scaleDown),
      ),
    );
  }
}
