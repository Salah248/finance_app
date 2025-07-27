import 'package:finance_app/resources/app_size.dart';
import 'package:finance_app/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomArrowBackButton extends StatelessWidget {
  const CustomArrowBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      onPressed: () => context.pop(),
      icon: Icon(
        Icons.arrow_back_ios_new,
        size: AppSize.s19.w,
        color: ColorManager.primary,
      ),
      alignment: Alignment.center,
      style: IconButton.styleFrom(
        side: const BorderSide(color: Color(0xffE8ECF4)),
        fixedSize: Size(AppSize.s41.w, AppSize.s41.h),
        padding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(RaduisSize.r12.r),
        ),
      ),
    );
  }
}
