import 'package:finance_app/resources/color_manager.dart';
import 'package:finance_app/ui/widgets/custom_app_bar_main.dart';
import 'package:finance_app/ui/widgets/custom_credit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCardScreen extends StatefulWidget {
  const MyCardScreen({super.key});

  @override
  State<MyCardScreen> createState() => _MyCardScreenState();
}

class _MyCardScreenState extends State<MyCardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          children: [
            const CustomAppBarMain(text: 'All Cards'),
            SizedBox(height: 24.h),
            const CustomCreditCard(
              cardName: 'X-Card',
              color: ColorManager.primary,
              isTheSecondCard: false,
              text: '23400',
              text2: '3434',
              isTheMyCard: true,
            ),
            SizedBox(height: 24.h),
            const CustomCreditCard(
              cardName: 'M-Card',
              color: ColorManager.secondary2Primary,
              isTheSecondCard: true,
              text: '3209',
              text2: '4545',
              isTheMyCard: true,
            ),
          ],
        ),
      ),
    );
  }
}
