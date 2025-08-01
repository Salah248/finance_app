import 'package:finance_app/resources/app_size.dart';
import 'package:finance_app/resources/assets_manager.dart';
import 'package:finance_app/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBarIconButton extends StatelessWidget {
  const CustomAppBarIconButton({
    super.key,
    this.isInMainScreens = false,
    this.assetName,
    this.onTap,
    this.iconColor = ColorManager.primary,
    this.boxColor = const Color(0xffECF1F6),
    this.bordarColor = const Color(0xffE3E9ED),
  });

  final void Function()? onTap;

  final bool? isInMainScreens;
  final String? assetName;
  final Color? iconColor;
  final Color? boxColor;
  final Color? bordarColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: isInMainScreens! ? 48.h : AppSize.s41.h,
        width: isInMainScreens! ? 48.w : AppSize.s41.w,
        decoration: BoxDecoration(
          color: isInMainScreens! ? boxColor : const Color(0xffFDFDFD),
          borderRadius: BorderRadius.circular(RaduisSize.r12),
          border: Border.all(
            color: isInMainScreens! ? bordarColor! : const Color(0xffE8ECF4),
          ),
        ),
        child: SvgPicture.asset(
          isInMainScreens! ? assetName! : IconsManager.arrowBack,
          color: isInMainScreens! ? iconColor : ColorManager.primary,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
