// ignore_for_file: use_build_context_synchronously

import 'package:finance_app/data/db.dart';
import 'package:finance_app/resources/app_size.dart';
import 'package:finance_app/resources/assets_manager.dart';
import 'package:finance_app/resources/color_manager.dart';
import 'package:finance_app/resources/font_manager.dart';
import 'package:finance_app/resources/route_manager.dart';
import 'package:finance_app/resources/style_manager.dart';
import 'package:finance_app/ui/widgets/build_custom_elevated_button.dart';
import 'package:finance_app/ui/widgets/custom_app_bar.dart';
import 'package:finance_app/ui/widgets/custom_app_barr_icon_button.dart';
import 'package:finance_app/ui/widgets/custom_container.dart';
import 'package:finance_app/ui/widgets/custom_snack_bar.dart';
import 'package:finance_app/ui/widgets/custom_text_form_field.dart';
import 'package:finance_app/ui/widgets/custom_text_rich.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isObscure = true;

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
                const CustomAppBarIconButton(),
                SizedBox(height: AppSize.s20.h),
                const CustomAppBar(
                  title: 'Welcome back!\nAgain!',
                  isSupTitle: false,
                ),
                SizedBox(height: AppSize.s20.h),
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
                SizedBox(height: AppSize.s15.h),
                CustomTextFormField(
                  label: 'Enter your password',
                  controller: _passwordController,
                  obscureText: _isObscure,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value!.isEmpty || value.length < 6) {
                      return 'Please enter a valid password';
                    } else {
                      return null;
                    }
                  },
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    child: SvgPicture.asset(
                      width: AppSize.s17.w,
                      height: AppSize.s11.h,
                      // ignore: deprecated_member_use
                      color: _isObscure
                          ? ColorManager.darkGray
                          : ColorManager.primary,

                      fit: BoxFit.none,
                      IconsManager.halfEye,
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
                CustomElevatedButton(
                  title: 'Login',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // هنا الفرق! بنبعت بس email و password
                      final user = await DbHelper.getUserByEmailAndPassword(
                        _emailController.text,
                        _passwordController.text,
                      );

                      if (user != null) {
                        showSnackBar(context, 'Login successful!');
                        // بنبعت الـ username من الـ user اللي جه من الـ database
                        context.pushReplacement(
                          Routes.mainRoute,
                          extra:
                              user.userName, // هنا الـ username من الـ database
                        );
                      } else {
                        showSnackBar(context, 'Invalid email or password');
                      }
                    }
                  },
                ),
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
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
