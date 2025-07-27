import 'package:finance_app/resources/app_size.dart';
import 'package:finance_app/resources/route_manager.dart';
import 'package:finance_app/ui/widgets/build_custom_elevated_button.dart';
import 'package:finance_app/ui/widgets/custom_app_bar.dart';
import 'package:finance_app/ui/widgets/custom_container.dart';
import 'package:finance_app/ui/widgets/custom_text_form_field.dart';
import 'package:finance_app/ui/widgets/custom_text_rich.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(22.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(
                title: 'Hello! Register to get\nstarted',
                isSupTitle: false,
              ),
              SizedBox(height: AppSize.s20.h),
              const CustomTextFormField(label: 'Username'),
              SizedBox(height: AppSize.s15.h),
              const CustomTextFormField(label: 'Email'),
              SizedBox(height: AppSize.s15.h),
              const CustomTextFormField(label: 'password'),
              SizedBox(height: AppSize.s15.h),
              const CustomTextFormField(label: 'Confirm password'),
              SizedBox(height: AppSize.s15.h),
              CustomElevatedButton(title: 'Register', onPressed: () {}),
              SizedBox(height: AppSize.s26.h),
              const CustomContainer(data: 'Or Register with'),
              SizedBox(height: AppSize.s41.h),
              CustomTextRow(
                data: 'Already have an account?',
                text: 'Login Now',
                onPressed: () => context.push(Routes.loginRoute),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
