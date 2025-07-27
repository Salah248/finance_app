import 'package:finance_app/resources/app_size.dart';
import 'package:finance_app/resources/route_manager.dart';
import 'package:finance_app/ui/widgets/build_custom_elevated_button.dart';
import 'package:finance_app/ui/widgets/custom_app_bar.dart';
import 'package:finance_app/ui/widgets/custom_arrow_back_button.dart';
import 'package:finance_app/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(AppSize.s22.r),
        child: Column(
          children: [
            SizedBox(height: AppSize.s15.r),
            const CustomAppBar(
              title: 'Forgot Password?',
              isSupTitle: true,
              supTitle:
                  'Don\'t worry! It occurs. Please enter the email address linked with your account.',
            ),
            SizedBox(height: AppSize.s26.r),
            const CustomTextFormField(label: 'Enter your email'),
            SizedBox(height: AppSize.s26.r),
            CustomElevatedButton(
              title: 'Send Code',
              onPressed: () => context.push(Routes.otpVerifcationRoute),
            ),
          ],
        ),
      ),
    );
  }
}
