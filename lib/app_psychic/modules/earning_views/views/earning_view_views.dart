import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_health/app_psychic/modules/earning_views/controller/earning_view_controller_views.dart';
import 'package:live_health/app_theme/app_colors.dart';
import 'package:live_health/core/custom_tab_screen.dart';
import 'package:live_health/core/info_card.dart';
import 'package:live_health/routes/app_routes.dart';


class EarningViewViews extends StatelessWidget {
  EarningViewViews({super.key});
  final EarningViewControllerViews controller = Get.put(EarningViewControllerViews());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        title: Text(
          "Earning Overview",
          style: GoogleFonts.inter(color: AppColors.primaryColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Balance Card
            _buildBalanceCard(),

            SizedBox(height: 12.h),

            // 🔹 Next Payout Card
            _buildNextPayoutCard(),

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
                    Get.toNamed(AppRoutes.recentHistoryAllViewViews);
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

            // 🔹 Tabs with fixed height to avoid overflow
            SizedBox(
              height: 400.h, // adjust height as needed
              child: CustomTabScreen(
                selectedIndex: controller.selectedIndex,
                tabTitles: controller.tabTitles,
                screens: controller.screens,
                activeColor: Colors.white,
                inactiveColor: Colors.grey.shade200,
              ),
            ),

            SizedBox(height: 16.h), // bottom spacing
          ],
        ),
      ),
    );
  }

  // 🔹 Balance Card Widget
  Widget _buildBalanceCard() {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Available Balance",
                    style: GoogleFonts.inter(
                      color: AppColors.primaryColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "\$75.50",
                    style: GoogleFonts.inter(
                      color: AppColors.primaryColor,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: AppColors.buttonColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: [
                    Text(
                      "Method",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 16.sp,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),

          // Payout threshold
          Row(
            children: [
              Text(
                "Pay-out threshold",
                style: GoogleFonts.inter(
                  color: AppColors.primaryColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Text(
                "\$75.50 / \$100.00",
                style: GoogleFonts.inter(
                  color: AppColors.primaryColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),

          // Linear Progress (Reactive)
          Obx(
            () => Container(
              height: 12.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: LinearProgressIndicator(
                  value: controller.progress.value,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Colors.green),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          ),
          SizedBox(height: 8.h),

          // Remaining amount
          Text(
            "\$24.50 more to reach your next automatic payout.",
            style: GoogleFonts.inter(
              color: AppColors.primaryColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Next Payout Card Widget
  Widget _buildNextPayoutCard() {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              "assets/icons/calendar.svg",
              width: 24.w,
              height: 24.w,
            ),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "NEXT PAYOUT",
                style: GoogleFonts.inter(
                  color: AppColors.primaryColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "October 15th",
                style: GoogleFonts.inter(
                  color: AppColors.primaryColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: AppColors.buttonColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              children: [
                Text(
                  "History",
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 16.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
