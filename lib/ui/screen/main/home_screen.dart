import 'package:finance_app/data/db.dart';
import 'package:finance_app/resources/assets_manager.dart';
import 'package:finance_app/resources/color_manager.dart';
import 'package:finance_app/resources/style_manager.dart';
import 'package:finance_app/ui/widgets/custom_arrow_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _userName;
  @override
  void initState() {
    DbHelper.getUsername(_userName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  CircleAvatar(
                    radius: 48.r,
                    backgroundImage: const AssetImage(ImagesManager.profImage),
                  ),
                  SizedBox(width: 11.w),
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: 151.w,
                      height: 46,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome back',
                            style: StyleManager.interMeduim.copyWith(
                              color: ColorManager.neutral,
                              fontSize: 12.sp,
                            ),
                          ),
                          Text(
                            _userName ?? 'Guest',
                            style: StyleManager.interSemiBold.copyWith(
                              color: ColorManager.neutral2,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 34.w),
                  const CustomAppBarIconButton(
                    isInMainScreens: true,
                    assetName: IconsManager.notification,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
