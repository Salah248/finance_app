import 'package:finance_app/resources/app_size.dart';
import 'package:finance_app/resources/assets_manager.dart';
import 'package:finance_app/resources/route_manager.dart';
import 'package:finance_app/ui/widgets/build_custom_elevated_button.dart';
import 'package:finance_app/ui/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              ImagesManager.welcomePageImage,
              width: double.infinity,
              height: AppSize.s570.h,
              fit: BoxFit.cover,
            ),
            SizedBox(height: AppSize.s15.h),
            CustomElevatedButton(
              isInLoginBtn: true,
              title: 'Login',
              onPressed: () => context.push(Routes.loginRoute),
            ),
            SizedBox(height: AppSize.s15.h),
            CustomElevatedButton(
              isInLoginBtn: false,
              title: 'Register',
              onPressed: () => context.push(Routes.registerRoute),
            ),
            SizedBox(height: AppSize.s15.h),
            CustomTextButton(
              text: 'Continue as a guest',
              onPressed: () => context.pushReplacement(Routes.mainRoute),
            ),
          ],
        ),
      ),
    );
  }
}
