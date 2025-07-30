// ignore_for_file: deprecated_member_use

import 'package:finance_app/resources/assets_manager.dart';
import 'package:finance_app/resources/color_manager.dart';
import 'package:finance_app/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key, required this.currentIndex, this.onTap});
  final int currentIndex;
  final void Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 88.h,
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: const Color(0xFFFDFDFD),
        landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
        onTap: onTap,
        fixedColor: ColorManager.neutral2,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: StyleManager.interMeduim.copyWith(
          fontSize: 14.sp,
          color: ColorManager.neutral2,
        ),
        unselectedLabelStyle: StyleManager.interMeduim.copyWith(
          color: ColorManager.neutral,
          fontSize: 12.sp,
        ),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              IconsManager.home,
              fit: BoxFit.scaleDown,
              color: currentIndex == 0
                  ? ColorManager.primary
                  : ColorManager.neutral,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              IconsManager.chart,
              fit: BoxFit.scaleDown,
              color: currentIndex == 1
                  ? ColorManager.primary
                  : ColorManager.neutral,
            ),
            label: 'Statistic',
          ),
          const BottomNavigationBarItem(
            icon: SizedBox.shrink(), // مكان فارغ للزر الوسط
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              IconsManager.wallet,
              fit: BoxFit.scaleDown,
              color: currentIndex == 3
                  ? ColorManager.primary
                  : ColorManager.neutral,
            ),
            label: 'My card',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              IconsManager.profile,
              fit: BoxFit.scaleDown,
              color: currentIndex == 4
                  ? ColorManager.primary
                  : ColorManager.neutral,
            ),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
