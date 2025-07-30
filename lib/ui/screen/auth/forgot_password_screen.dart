import 'package:finance_app/resources/app_size.dart';
import 'package:finance_app/resources/route_manager.dart';
import 'package:finance_app/ui/widgets/build_custom_elevated_button.dart';
import 'package:finance_app/ui/widgets/custom_app_bar.dart';
import 'package:finance_app/ui/widgets/custom_arrow_back_button.dart';
import 'package:finance_app/ui/widgets/custom_text_form_field.dart';
import 'package:finance_app/ui/widgets/custom_text_rich.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
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
                title: 'Forgot Password?',
                isSupTitle: true,
                supTitle:
                    'Don\'t worry! It occurs. Please enter the email address linked with your account.',
              ),
              SizedBox(height: AppSize.s26.r),
              CustomTextFormField(
                label: 'Enter your email',
                controller: _emailController,
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: AppSize.s26.r),
              CustomElevatedButton(
                title: 'Send Code',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.push(Routes.otpVerifcationRoute);
                  }
                  return;
                },
              ),
              SizedBox(height: AppSize.s56.r),
              CustomTextRow(
                data: 'Remember Password?',
                text: 'Login',
                onPressed: () => context.pushReplacement(Routes.loginRoute),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
