import 'package:finance_app/resources/assets_manager.dart';
import 'package:finance_app/resources/color_manager.dart';
import 'package:finance_app/ui/screen/main/add_screen.dart';
import 'package:finance_app/ui/screen/main/home_screen.dart';
import 'package:finance_app/ui/screen/main/my_card_screen.dart';
import 'package:finance_app/ui/screen/main/my_profile_screen.dart';
import 'package:finance_app/ui/screen/main/statistic_screen.dart';
import 'package:finance_app/ui/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const StatisticScreen(),
    const AddScreen(),
    const MyCardScreen(),
    const MyProfileScreen(),
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: 16.r),
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                _currentIndex = 2;
              });
            },
            shape: const CircleBorder(),
            backgroundColor: ColorManager.primary,
            child: SvgPicture.asset(IconsManager.plus, fit: BoxFit.scaleDown),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
      body: _screens[_currentIndex],
    );
  }
}
