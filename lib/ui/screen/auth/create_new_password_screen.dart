import 'package:finance_app/resources/app_size.dart';
import 'package:finance_app/resources/route_manager.dart';
import 'package:finance_app/ui/widgets/build_custom_elevated_button.dart';
import 'package:finance_app/ui/widgets/custom_app_bar.dart';
import 'package:finance_app/ui/widgets/custom_app_barr_icon_button.dart';
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
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                title: 'Create new password',
                isSupTitle: true,
                supTitle:
                    'Your new password must be unique from those previously used.',
              ),
              SizedBox(height: AppSize.s26.r),
              CustomTextFormField(
                label: 'New Password',
                controller: _passwordController,
                validator: (value) {
                  if (value!.isEmpty || value.length < 6) {
                    return 'Please enter a valid password';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: AppSize.s15.r),
              CustomTextFormField(
                label: 'Confirm Password',
                controller: _confirmPasswordController,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              SizedBox(height: AppSize.s26.r),
              CustomElevatedButton(
                title: 'Reset Password',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.pushReplacement(Routes.passwordChangedRoute);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
