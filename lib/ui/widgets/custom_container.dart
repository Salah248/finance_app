import 'package:finance_app/resources/app_size.dart';
import 'package:finance_app/resources/assets_manager.dart';
import 'package:finance_app/resources/color_manager.dart';
import 'package:finance_app/resources/font_manager.dart';
import 'package:finance_app/resources/style_manager.dart';
import 'package:finance_app/ui/widgets/custom_icon_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.data});
  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              child: Divider(color: Color(0xffE8ECF4), thickness: 1),
            ),
            SizedBox(width: AppSize.s10.w),
            Text(
              data,
              style: StyleManager.urbanistSemiBold.copyWith(
                color: ColorManager.darkGray,
                fontSize: FontSize.fs14,
              ),
            ),
            SizedBox(width: AppSize.s10.w),
            const Expanded(
              child: Divider(color: Color(0xffE8ECF4), thickness: 1),
            ),
          ],
        ),
        SizedBox(height: AppSize.s38.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIconContainer(assetName: IconsManager.facebook, onTap: () {}),
            CustomIconContainer(assetName: IconsManager.google, onTap: () {}),
            CustomIconContainer(assetName: IconsManager.apple, onTap: () {}),
          ],
        ),
      ],
    );
  }
}
