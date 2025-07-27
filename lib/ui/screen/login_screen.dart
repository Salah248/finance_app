import 'package:finance_app/resources/app_size.dart';
import 'package:finance_app/resources/assets_manager.dart';
import 'package:finance_app/resources/color_manager.dart';
import 'package:finance_app/resources/font_manager.dart';
import 'package:finance_app/resources/route_manager.dart';
import 'package:finance_app/resources/style_manager.dart';
import 'package:finance_app/ui/widgets/build_custom_elevated_button.dart';
import 'package:finance_app/ui/widgets/custom_app_bar.dart';
import 'package:finance_app/ui/widgets/custom_arrow_back_button.dart';
import 'package:finance_app/ui/widgets/custom_container.dart';
import 'package:finance_app/ui/widgets/custom_text_form_field.dart';
import 'package:finance_app/ui/widgets/custom_text_rich.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(22.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSize.s15.r),
              const CustomArrowBackButton(),
              SizedBox(height: AppSize.s20.h),
              const CustomAppBar(
                title: 'Welcome back!\nAgain!',
                isSupTitle: false,
              ),
              SizedBox(height: AppSize.s20.h),
              const CustomTextFormField(label: 'Enter your email'),
              SizedBox(height: AppSize.s15.h),
              CustomTextFormField(
                label: 'Enter your password',
                suffixIcon: GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    fit: BoxFit.scaleDown,
                    IconsManager.group,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => context.push(Routes.forgotPasswordRoute),
                  child: Text(
                    'Forget password?',
                    style: StyleManager.urbanistSemiBold.copyWith(
                      color: ColorManager.darkGray,
                      fontSize: FontSize.fs15.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppSize.s15.h),
              CustomElevatedButton(title: 'Login', onPressed: () {}),
              SizedBox(height: AppSize.s26.h),
              const CustomContainer(data: 'Or Login with'),
              SizedBox(height: AppSize.s41.h),
              CustomTextRow(
                data: 'Don’t have an account?',
                text: 'Register Now',
                onPressed: () => context.push(Routes.registerRoute),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
