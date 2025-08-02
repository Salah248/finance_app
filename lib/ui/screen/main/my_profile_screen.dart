import 'package:finance_app/resources/assets_manager.dart';
import 'package:finance_app/resources/color_manager.dart';
import 'package:finance_app/resources/style_manager.dart';
import 'package:finance_app/ui/widgets/custom_app_bar_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.r, vertical: 16.r),
              child: const CustomAppBarMain(
                text: 'My Profile',
                isInMyProfilePage: true,
              ),
            ),
            SizedBox(height: 23.h),
            ClipOval(
              child: Image.asset(
                ImagesManager.profImage,
                fit: BoxFit.cover,
                width: 100.w,
                height: 100.h,
              ),
            ),
            SizedBox(height: 9.h),
            _myProfileSection(
              'Full Name',
              'salah sadoon',
              left: 14.r,
              right: 24.r,
            ),
            SizedBox(height: 16.h),
            _myProfileSection('Email', 'salah.sadoon@example.com'),
            SizedBox(height: 16.h),
            _myProfileSection('Phone Number', '+964 750 123 4567'),
            SizedBox(height: 16.h),
            _myProfileSection('Address', '123 Main Street, City, Country'),
          ],
        ),
      ),
    );
  }

  Widget _myProfileSection(
    String title,
    String value, {
    double? left,
    double? right,
  }) {
    return Container(
      alignment: Alignment.topLeft,
      height: 100.h,
      margin: EdgeInsets.only(left: left ?? 24.r, right: right ?? 24.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 16.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: StyleManager.interMeduim.copyWith(
              color: ColorManager.neutral,
              fontSize: 14.sp,
            ),
          ),
          Text(
            value,
            style: StyleManager.interMeduim.copyWith(
              color: ColorManager.neutral2,
              fontSize: 16.sp,
            ),
          ),
          const Expanded(child: Divider(color: Color(0xffF2F2F5), height: 0)),
        ],
      ),
    );
  }
}
