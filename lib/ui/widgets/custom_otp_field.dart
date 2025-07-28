import 'package:finance_app/resources/app_size.dart';
import 'package:finance_app/resources/color_manager.dart';
import 'package:finance_app/resources/font_manager.dart';
import 'package:finance_app/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class CustomOtpField extends StatelessWidget {
  CustomOtpField({super.key, this.controller});
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 4,
      defaultPinTheme: defaultPinTheme,
      closeKeyboardWhenCompleted: true,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty || value.length != 4 || value.contains(' ')) {
          return 'Please enter 4 digit number';
        }
        return null;
      },
      errorPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(RaduisSize.r8),
        ),
      ),
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.secondary2Primary),
          borderRadius: BorderRadius.circular(RaduisSize.r8),
        ),
      ),
      controller: controller,
    );
  }

  final PinTheme defaultPinTheme = PinTheme(
    width: AppSize.s70.w,
    height: AppSize.s60.h,
    textStyle: StyleManager.urbanistBold.copyWith(
      fontSize: FontSize.fs22,
      color: ColorManager.primary,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xffE8ECF4)),
      borderRadius: BorderRadius.circular(RaduisSize.r8),
      color: const Color(0xffF7F8F9),
    ),
  );
}
