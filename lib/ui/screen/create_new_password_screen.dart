import 'package:finance_app/resources/app_size.dart';
import 'package:finance_app/resources/route_manager.dart';
import 'package:finance_app/ui/widgets/build_custom_elevated_button.dart';
import 'package:finance_app/ui/widgets/custom_app_bar.dart';
import 'package:finance_app/ui/widgets/custom_arrow_back_button.dart';
import 'package:finance_app/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(AppSize.s22.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSize.s15.r),
            const CustomArrowBackButton(),
            SizedBox(height: AppSize.s20.h),
            const CustomAppBar(
              title: 'Create new password',
              isSupTitle: true,
              supTitle:
                  'Your new password must be unique from those previously used.',
            ),
            SizedBox(height: AppSize.s26.r),
            const CustomTextFormField(label: 'New Password'),
            SizedBox(height: AppSize.s15.r),
            const CustomTextFormField(label: 'Confirm Password'),
            SizedBox(height: AppSize.s26.r),
            CustomElevatedButton(
              title: 'Reset Password',
              onPressed: () => context.push(Routes.passwordChangedRoute),
            ),
          ],
        ),
      ),
    );
  }
}
