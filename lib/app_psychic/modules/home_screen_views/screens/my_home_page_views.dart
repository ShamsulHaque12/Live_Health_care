import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_health/app_psychic/modules/home_screen_views/controller/my_home_page_controller_views.dart';
import 'package:live_health/app_theme/app_colors.dart';
import 'package:live_health/core/custom_tab_screen.dart';
import 'package:live_health/core/info_card.dart';


class MyHomePageViews extends StatelessWidget {
  MyHomePageViews({super.key});

  final MyHomePageControllerViews controller = Get.put(MyHomePageControllerViews());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeColor,
      appBar: AppBar(
        backgroundColor: AppColors.homeColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundColor: AppColors.primaryColor,
              child: const Icon(Icons.person, color: Colors.white),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$0.00",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  "Balance",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // Get.toNamed(AppRoutes.storyDayView);
            },
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Icon(Icons.add),
            ),
          ),
          SizedBox(width: 10.w),
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: SvgPicture.asset("assets/icons/notification.svg"),
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Start Live Now
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: AppColors.containerColor.withAlpha(50),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Start Live Now",
                        style: GoogleFonts.inter(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "Notify 1.2k followers instantly",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withAlpha(70),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.buttonColor,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/live.svg"),
                        SizedBox(width: 6.w),
                        Text(
                          "Go",
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            // 🔹 Performance Title
            Text(
              "Performance",
              style: GoogleFonts.inter(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 12.h),

            // 🔹 Performance Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InfoCard(
                  title: "Sessions",
                  value: "0",
                  iconPath: "assets/icons/mans.svg",
                ),
                InfoCard(
                  title: "Live",
                  value: "120",
                  iconPath: "assets/icons/live.svg",
                ),
                InfoCard(
                  title: "Affiliate",
                  value: "120",
                  iconPath: "assets/icons/bock.svg",
                ),
              ],
            ),
            SizedBox(height: 16.h),

            // 🔹 Invite Card
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/icons/coins.png",
                    width: 45.w,
                    height: 32.h,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Invite a Fellow Psychic",
                          style: GoogleFonts.inter(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Refer & Earn USD",
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withAlpha(70),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16.sp),
                ],
              ),
            ),
            SizedBox(height: 12.h),

            // 🔹 Recent History
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent History",
                  style: GoogleFonts.inter(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Get.toNamed(AppRoutes.recentHistoryAllViews);
                  },
                  child: Text(
                    "View",
                    style: TextStyle(
                      color: AppColors.buttonColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),

            // 🔹 Tabs
            SizedBox(
              height:
                  MediaQuery.of(context).size.height * 0.5, // dynamic height
              child: CustomTabScreen(
                selectedIndex: controller.selectedIndex,
                tabTitles: controller.tabTitles,
                screens: controller.screens,
                activeColor: Colors.white,
                inactiveColor: Colors.grey.shade200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
