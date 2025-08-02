import 'package:finance_app/resources/assets_manager.dart';
import 'package:finance_app/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBarMain extends StatelessWidget {
  const CustomAppBarMain({
    super.key,
    required this.text,
    this.isInMyProfilePage = false,
  });

  final String text;
  final bool? isInMyProfilePage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(
            fixedSize: Size(48.w, 48.h),
            backgroundColor: Colors.white,
            shape: const CircleBorder(),
            side: BorderSide(color: const Color(0xffE3E9ED), width: 1.w),
          ),
          icon: SvgPicture.asset(
            IconsManager.arrowBack,
            fit: BoxFit.scaleDown,
            color: Colors.black,
          ),
        ),
        Text(
          text,
          style: StyleManager.interSemiBold.copyWith(
            fontSize: 18.sp,
            color: Colors.black,
          ),
        ),
        IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(
            fixedSize: Size(48.w, 48.h),
            backgroundColor: Colors.white,
            shape: const CircleBorder(),
            side: BorderSide(color: const Color(0xffE3E9ED), width: 1.w),
          ),
          icon: SvgPicture.asset(
            isInMyProfilePage! ? IconsManager.editSquare : IconsManager.more,
            fit: BoxFit.scaleDown,
            color: isInMyProfilePage! ? const Color(0xff4F3D56) : Colors.black,
          ),
        ),
      ],
    );
  }
}
