import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_health/app_theme/app_colors.dart';
import 'package:live_health/core/custom_row_tile.dart';
import 'package:live_health/core/stat_card.dart';
import 'package:live_health/routes/app_routes.dart';


class AccountViews extends StatelessWidget {
  const AccountViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          "My Profile",
          style: TextStyle(color: AppColors.primaryColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25.r,
                  backgroundColor: AppColors.primaryColor,
                  child: const Icon(Icons.person, color: Colors.white),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Elena Star",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Member since 2021",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 14.h),
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.buttonColor.withAlpha(60),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Available Balance",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "\$120.000",
                        style: TextStyle(
                          color: AppColors.buttonColor,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.buttonColor,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      "View Details",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 14.h),
            Row(
              children: [
                Expanded(
                  child: StatCard(
                    amount: "\$102",
                    title: "Sessions",
                    textColor: AppColors.primaryColor,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: StatCard(
                    amount: "\$58",
                    title: "Live",
                    textColor: AppColors.primaryColor,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: StatCard(
                    amount: "\$4.5",
                    title: "Ratings",
                    textColor: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 14.h),
            Text(
              "My Activity",
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRowTile(
                    title: "My Session",
                    iconPath: "assets/icons/mans.svg",
                    onTap: () {
                      Get.toNamed(AppRoutes.sessionHistory);
                    },
                  ),
                  SizedBox(height: 8.h),
                  CustomRowTile(
                    title: "Reviews & Ratings",
                    iconPath: "assets/icons/review.svg",
                    onTap: () {
                      Get.toNamed(AppRoutes.reviewRattingView);
                    },
                  ),
                  SizedBox(height: 8.h),
                  CustomRowTile(
                    title: "Pay-out History",
                    iconPath: "assets/icons/wallet.svg",
                    onTap: () {
                      Get.toNamed(AppRoutes.payOutHistoryViews);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 14.h),
            Text(
              "General",
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRowTile(
                    title: "Edit Profile",
                    iconPath: "assets/icons/settings.svg",
                    onTap: () {
                      Get.toNamed(AppRoutes.myProfileView);
                    },
                  ),
                  SizedBox(height: 8.h),
                  CustomRowTile(
                    title: "Help & Support",
                    iconPath: "assets/icons/help.svg",
                    onTap: () {
                      Get.toNamed(AppRoutes.helpSupportView);
                    },
                  ),
                  SizedBox(height: 8.h),
                  CustomRowTile(
                    title: "Log Out",
                    iconPath: "assets/icons/logout.svg",
                    onTap: () {
                      _showLogoutPopup();
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  void _showLogoutPopup() {
    Get.defaultDialog(
      title: "Confirm Logout",
      middleText: "Are you sure you want to log out?",
      titleStyle: GoogleFonts.inter(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryColor,
      ),
      middleTextStyle: GoogleFonts.inter(
        fontSize: 14.sp,
        color: Colors.grey.shade700,
      ),
      backgroundColor: Colors.white,
      radius: 12.r,
      textCancel: "No",
      textConfirm: "Yes",
      cancelTextColor: Colors.grey.shade700,
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.back(); // Close the dialog
      },
      onCancel: () {
        Get.back(); // Just close dialog
      },
      buttonColor: AppColors.primaryColor,
    );
  }
}
