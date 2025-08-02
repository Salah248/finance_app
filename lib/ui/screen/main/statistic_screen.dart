import 'package:finance_app/resources/assets_manager.dart';
import 'package:finance_app/resources/color_manager.dart';
import 'package:finance_app/resources/style_manager.dart';
import 'package:finance_app/ui/widgets/custom_app_bar_main.dart';
import 'package:finance_app/ui/widgets/custom_section.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatisticScreen extends StatefulWidget {
  const StatisticScreen({super.key});

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  var _initialSelection = 'Monthly';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            spacing: 24.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBarMain(text: 'Reload'),
              _chartSection(),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 1.2,
                crossAxisSpacing: 15.w,
                mainAxisSpacing: 15.h,
                children: const [
                  CustomSection(
                    assetName: IconsManager.download,
                    text: '15000 EG',
                    text2: 'Income',
                    isInStatisticScreen: true,
                  ),
                  CustomSection(
                    assetName: IconsManager.upload,
                    text: '35000 EG',
                    text2: 'Outcome',
                    isInStatisticScreen: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _chartSection() {
    return SizedBox(
      height: 236.h,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Jan 28 - May 28, 2025', // أو استخدم التاريخ الديناميكي
                style: StyleManager.interMeduim.copyWith(
                  fontSize: 14.sp,
                  color: ColorManager.neutral,
                ),
              ),
              Container(
                height: 38.h,
                width: 101.w,
                decoration: BoxDecoration(
                  color: const Color(0xffB9C4FF), // لون الخلفية الأزرق الفاتح
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _initialSelection,
                    isExpanded: true,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: ColorManager.neutral2,
                      size: 20.sp,
                    ),
                    dropdownColor: const Color(
                      0xffB9C4FF,
                    ), // لون الخلفية للقائمة
                    borderRadius: BorderRadius.circular(8.r),
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    style: StyleManager.interMeduim.copyWith(
                      fontSize: 14.sp,
                      color: ColorManager.neutral2,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _initialSelection = value ?? _initialSelection;
                      });
                    },
                    items: const [
                      DropdownMenuItem(value: 'Daily', child: Text('Daily')),
                      DropdownMenuItem(value: 'Weekly', child: Text('Weekly')),
                      DropdownMenuItem(
                        value: 'Monthly',
                        child: Text('Monthly'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: BarChart(
              BarChartData(
                maxY: 8000,
                minY: 0,
                backgroundColor: Colors.transparent,
                barTouchData: const BarTouchData(enabled: false),
                gridData: FlGridData(
                  drawHorizontalLine: true,
                  drawVerticalLine: false,
                  horizontalInterval: 2000,
                  getDrawingHorizontalLine: (value) {
                    return const FlLine(
                      color: Color(0xffE3E9ED), // لون الخطوط
                      strokeWidth: 1,
                      dashArray: null, // خط متقطع (اختياري)
                    );
                  },
                  checkToShowHorizontalLine: (value) {
                    // إظهار خطوط لكل القيم من 0 إلى 8000 بفاصل 2000
                    return value % 2000 == 0 && value >= 0 && value <= 8000;
                  },
                ),
                titlesData: FlTitlesData(
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 2000,
                      reservedSize: 40.w,
                      getTitlesWidget: (value, meta) {
                        // تحويل الأرقام لـ k format (مثل 2k, 4k, 6k, 8k)
                        if (value == 0) {
                          return Text(
                            '0',
                            style: StyleManager.interMeduim.copyWith(
                              color: ColorManager.neutral,
                              fontSize: 12.sp,
                            ),
                          );
                        }
                        return Padding(
                          padding: EdgeInsets.only(right: 8.r),
                          child: Text(
                            '${(value / 1000).toInt()}k',
                            style: StyleManager.interMeduim.copyWith(
                              color: ColorManager.neutral,
                              fontSize: 12.sp,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May'];
                        if (value.toInt() >= 0 &&
                            value.toInt() < months.length) {
                          return Text(
                            months[value.toInt()],
                            style: StyleManager.interMeduim.copyWith(
                              color: ColorManager.neutral,
                              fontSize: 12.sp,
                            ),
                          );
                        }
                        return const Text('');
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: const Border(
                    top: BorderSide(
                      color: Color(0xffE3E9ED),
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignInside,
                    ), // خط عند 8k
                    bottom: BorderSide(
                      color: Color(0xffE3E9ED),
                      width: 1,
                    ), // خط عند 0
                    left: BorderSide.none,
                    right: BorderSide.none,
                  ),
                ),
                barGroups: [
                  // January
                  BarChartGroupData(
                    x: 0,
                    barRods: [
                      BarChartRodData(
                        toY: 7500,
                        color: ColorManager.primary, // اللون الأزرق الفاتح
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          topRight: Radius.circular(8.r),
                        ),
                        width: 12.w,
                      ),
                      BarChartRodData(
                        toY: 4500,
                        color: ColorManager.secondary, // اللون الأزرق الغامق
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          topRight: Radius.circular(8.r),
                        ),
                        width: 12.w,
                      ),
                    ],
                  ),
                  // February
                  BarChartGroupData(
                    x: 1,
                    barRods: [
                      BarChartRodData(
                        toY: 7500,
                        color: ColorManager.primary, // اللون الأزرق الفاتح
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          topRight: Radius.circular(8.r),
                        ),
                        width: 12.w,
                      ),
                      BarChartRodData(
                        toY: 4500,
                        color: ColorManager.secondary, // اللون الأزرق الغامق
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          topRight: Radius.circular(8.r),
                        ),
                        width: 12.w,
                      ),
                    ],
                  ),
                  // March
                  BarChartGroupData(
                    x: 2,
                    barRods: [
                      BarChartRodData(
                        toY: 7500,
                        color: ColorManager.primary, // اللون الأزرق الفاتح
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          topRight: Radius.circular(8.r),
                        ),
                        width: 12.w,
                      ),
                      BarChartRodData(
                        toY: 4500,
                        color: ColorManager.secondary, // اللون الأزرق الغامق
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          topRight: Radius.circular(8.r),
                        ),
                        width: 12.w,
                      ),
                    ],
                  ),
                  // April
                  BarChartGroupData(
                    x: 3,
                    barRods: [
                      BarChartRodData(
                        toY: 7500,
                        color: ColorManager.primary, // اللون الأزرق الفاتح
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          topRight: Radius.circular(8.r),
                        ),
                        width: 12.w,
                      ),
                      BarChartRodData(
                        toY: 4500,
                        color: ColorManager.secondary, // اللون الأزرق الغامق
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          topRight: Radius.circular(8.r),
                        ),
                        width: 12.w,
                      ),
                    ],
                  ),
                  // May
                  BarChartGroupData(
                    x: 4,
                    barRods: [
                      BarChartRodData(
                        toY: 7500,
                        color: ColorManager.primary, // اللون الأزرق الفاتح
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          topRight: Radius.circular(8.r),
                        ),
                        width: 12.w,
                      ),
                      BarChartRodData(
                        toY: 4500,
                        color: ColorManager.secondary, // اللون الأزرق الغامق
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          topRight: Radius.circular(8.r),
                        ),
                        width: 12.w,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
