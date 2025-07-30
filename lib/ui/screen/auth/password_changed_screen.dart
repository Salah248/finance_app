import 'package:finance_app/resources/app_size.dart';
import 'package:finance_app/resources/assets_manager.dart';
import 'package:finance_app/resources/route_manager.dart';
import 'package:finance_app/ui/widgets/build_custom_elevated_button.dart';
import 'package:finance_app/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PasswordChangedScreen extends StatefulWidget {
  const PasswordChangedScreen({super.key});

  @override
  State<PasswordChangedScreen> createState() => _PasswordChangedScreenState();
}

class _PasswordChangedScreenState extends State<PasswordChangedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(AppSize.s22.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              ImagesManager.stickerImage,
              width: AppSize.s100.w,
              height: AppSize.s100.h,
            ),
            const SizedBox(height: AppSize.s26),
            const CustomAppBar(
              title: 'Password Changed!',
              isSupTitle: true,
              supTitle: 'Your password has been changed successfully.',
              isInPassChanged: true,
            ),
            const SizedBox(height: AppSize.s26),
            CustomElevatedButton(
              title: 'Back to Login',
              onPressed: () => context.pushReplacement(Routes.loginRoute),
            ),
          ],
        ),
      ),
    );
  }
}
