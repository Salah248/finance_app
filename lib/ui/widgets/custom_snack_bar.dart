import 'package:finance_app/resources/font_manager.dart';
import 'package:finance_app/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: StyleManager.urbanistBold.copyWith(
          fontSize: FontSize.fs16.sp,
          color: Colors.red,
        ),
      ),
      backgroundColor: Colors.grey,
    ),
  );
}
