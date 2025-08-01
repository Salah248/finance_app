import 'package:finance_app/resources/app_size.dart';
import 'package:finance_app/resources/route_manager.dart';
import 'package:finance_app/ui/widgets/build_custom_elevated_button.dart';
import 'package:finance_app/ui/widgets/custom_app_bar.dart';
import 'package:finance_app/ui/widgets/custom_app_barr_icon_button.dart';
import 'package:finance_app/ui/widgets/custom_otp_field.dart';
import 'package:finance_app/ui/widgets/custom_text_rich.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OtpVerifcationScreen extends StatefulWidget {
  const OtpVerifcationScreen({super.key});

  @override
  State<OtpVerifcationScreen> createState() => _OtpVerifcationScreenState();
}

class _OtpVerifcationScreenState extends State<OtpVerifcationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(AppSize.s22.r),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSize.s15.r),
              const CustomAppBarIconButton(),
              SizedBox(height: AppSize.s20.h),
              const CustomAppBar(
                title: 'OTP Verification',
                isSupTitle: true,
                supTitle:
                    'Enter the verification code we just sent on your email address.',
              ),
              SizedBox(height: AppSize.s26.r),
              CustomOtpField(controller: _otpController),
              SizedBox(height: AppSize.s26.r),
              CustomElevatedButton(
                title: 'Verify',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.push(Routes.createNewPasswordRoute);
                  }
                },
              ),
              SizedBox(height: AppSize.s56.r),
              CustomTextRow(
                data: 'Didn’t received code?',
                text: 'Resend',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }
}
