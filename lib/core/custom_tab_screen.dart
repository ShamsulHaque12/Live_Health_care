import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomTabScreen extends StatelessWidget {
  final RxInt selectedIndex;
  final List<String> tabTitles;
  final List<Widget> screens;
  final Color activeColor;
  final Color inactiveColor;

   const CustomTabScreen({
    super.key,
    required this.selectedIndex,
    required this.tabTitles,
    required this.screens,
    this.activeColor = Colors.orange,
    this.inactiveColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tab bar
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Colors.black),
            ),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  tabTitles.length,
                  (index) => buildTab(tabTitles[index], index),
                ),
              ),
            ),
          ),
          // Tab body
          Expanded(
            child: Obx(() => screens[selectedIndex.value]),
          ),
        ],
      ),
    );
  }

  // Single tab button
  Widget buildTab(String title, int index) {
    bool isActive = selectedIndex.value == index;

    return GestureDetector(
      onTap: () => selectedIndex.value = index,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: isActive ? activeColor : inactiveColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.black : Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
