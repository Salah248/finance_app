import 'package:finance_app/resources/app_size.dart';
import 'package:finance_app/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CustomAppBarIconButton extends StatelessWidget {
  const CustomAppBarIconButton({
    super.key,
    this.isInMainScreens = false,
    this.assetName,
  });

  final bool? isInMainScreens;
  final String? assetName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => isInMainScreens!
          ? print('Notifaction is in main screens')
          : context.pop(),
      child: Container(
        height: isInMainScreens! ? 48.h : AppSize.s41.h,
        width: isInMainScreens! ? 48.w : AppSize.s41.w,
        decoration: BoxDecoration(
          color: isInMainScreens!
              ? const Color(0xffECF1F6)
              : const Color(0xffFDFDFD),
          borderRadius: BorderRadius.circular(RaduisSize.r12),
          border: Border.all(
            color: isInMainScreens!
                ? const Color(0xffE3E9ED)
                : const Color(0xffE8ECF4),
          ),
        ),
        child: SvgPicture.asset(
          isInMainScreens! ? assetName! : IconsManager.arrowBack,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
