import 'package:finance_app/resources/app_size.dart';
import 'package:finance_app/resources/route_manager.dart';
import 'package:finance_app/ui/widgets/build_custom_elevated_button.dart';
import 'package:finance_app/ui/widgets/custom_app_bar.dart';
import 'package:finance_app/ui/widgets/custom_arrow_back_button.dart';
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
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(22.r),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppSize.s15.r),
                const CustomArrowBackButton(),
                SizedBox(height: AppSize.s20.h),
                const CustomAppBar(
                  title: 'Hello! Register to get\nstarted',
                  isSupTitle: false,
                ),
                SizedBox(height: AppSize.s20.h),
                CustomTextFormField(
                  label: 'Username',
                  controller: _usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppSize.s15.h),
                CustomTextFormField(
                  label: 'Email',
                  controller: _emailController,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains('@')) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppSize.s15.h),
                CustomTextFormField(
                  label: 'password',
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppSize.s15.h),
                CustomTextFormField(
                  label: 'Confirm password',
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
                SizedBox(height: AppSize.s15.h),
                CustomElevatedButton(
                  title: 'Register',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle form submission
                    } else {
                      // Form validation failed
                    }
                  },
                ),
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
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
