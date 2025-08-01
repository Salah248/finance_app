import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:finance_app/resources/assets_manager.dart';
import 'package:finance_app/resources/color_manager.dart';
import 'package:finance_app/resources/style_manager.dart';
import 'package:finance_app/ui/widgets/custom_app_barr_icon_button.dart';
import 'package:finance_app/ui/widgets/custom_credit_card.dart';
import 'package:finance_app/ui/widgets/custom_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.username});
  final String? username;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _userName;
  var _currentIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  void initState() {
    super.initState();
    _userName = widget.username;
  }

  final List<CustomCreditCard> _items = [
    const CustomCreditCard(
      cardName: 'X-Card',
      color: ColorManager.primary,
      isTheSecondCard: false,
      text: '23400',
      text2: '3434',
    ),
    const CustomCreditCard(
      cardName: 'M-Card',
      color: ColorManager.secondary2Primary,
      isTheSecondCard: true,
      text: '3209',
      text2: '4545',
    ),
    const CustomCreditCard(
      cardName: 'Z-Card',
      color: ColorManager.neutral2,
      isTheSecondCard: false,
      text: '23400',
      text2: '3434',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _appBar(),
              SizedBox(height: 24.h),
              _carouselSlider(),
              SizedBox(height: 16.h),
              Center(child: _dotsIndicator()),
              SizedBox(height: 24.h),
              _section(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar() {
    return Row(
      children: [
        SizedBox(
          height: 48.h,
          width: 48.w,
          child: ClipOval(
            child: Image.asset(ImagesManager.profImage, fit: BoxFit.cover),
          ),
        ),
        SizedBox(width: 11.w),
        Column(
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
        const Spacer(),
        IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(
            fixedSize: Size(48.w, 48.h),
            backgroundColor: Colors.white,
            shape: const CircleBorder(),
            side: BorderSide(color: const Color(0xffE3E9ED), width: 1.w),
          ),
          icon: SvgPicture.asset(
            IconsManager.notification,
            fit: BoxFit.scaleDown,
            color: ColorManager.primary,
          ),
        ),
      ],
    );
  }

  Widget _carouselSlider() {
    return CarouselSlider(
      carouselController: _carouselController,
      options: CarouselOptions(
        height: 263.h,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        initialPage: _currentIndex,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
        padEnds: false,
        viewportFraction: .68,
        reverse: false,
        clipBehavior: Clip.none,
        disableCenter: true,
      ),
      items: _items,
    );
  }

  Widget _dotsIndicator() {
    return DotsIndicator(
      dotsCount: _items.length,
      position: _currentIndex.toDouble(),
      decorator: DotsDecorator(
        activeColor: ColorManager.primary,
        color: ColorManager.neutral,
        size: Size.square(8.0.r),
        activeSize: Size(16.0.w, 8.0.h),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      mainAxisAlignment: MainAxisAlignment.center,
      onTap: (position) {
        _carouselController.animateToPage(position);
        setState(() {
          _currentIndex = position;
        });
      },
    );
  }

  Widget _section() {
    return SizedBox(
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16.r,
        mainAxisSpacing: 16.r,
        childAspectRatio: 1,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          CustomSection(
            assetName: IconsManager.send,
            text: 'Send money',
            text2: 'Send money send money',
          ),
          CustomSection(
            assetName: IconsManager.pay,
            text: 'Pay the bill',
            text2: 'Pay the bill',
          ),
          CustomSection(
            assetName: IconsManager.send,
            text: 'Request',
            text2: 'Request requestrequest',
          ),
          CustomSection(
            assetName: IconsManager.user,
            text: 'Contact',
            text2: 'Contact with group',
          ),
        ],
      ),
    );
  }
}
