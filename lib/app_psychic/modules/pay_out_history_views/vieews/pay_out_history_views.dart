import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_health/app_theme/app_colors.dart';
import '../../../../core/global_widgets/custom_app_bar.dart';
import '../controller/pay_out_controller_views.dart';

class PayOutHistoryViews extends StatelessWidget {
  PayOutHistoryViews({super.key});
  final PayOutControllerViews controller = Get.put(PayOutControllerViews());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(title: "Pay Out History"),
      // appBar: AppBar(
      //   scrolledUnderElevation: 0,
      //   leading: Padding(
      //     padding: EdgeInsets.only(left: 15.w),
      //     child: GestureDetector(
      //       onTap: () => Get.back(),
      //       child: Icon(Icons.arrow_back_ios, color: AppColors.primaryColor),
      //     ),
      //   ),
      //   backgroundColor: AppColors.backgroundColor,
      //   elevation: 0,
      //   title: Text(
      //     "Pay Out History",
      //     style: GoogleFonts.inter(color: AppColors.primaryColor),
      //   ),
      //   centerTitle: true,
      // ),
      body: Obx(() {
        if (controller.payoutHistory.isEmpty) {
          return Center(
            child: Text(
              "No payout history found",
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                color: Colors.grey.shade600,
              ),
            ),
          );
        }

        return ListView.separated(
          padding: EdgeInsets.all(16.w),
          itemCount: controller.payoutHistory.length,
          separatorBuilder: (_, __) => SizedBox(height: 12.h),
          itemBuilder: (_, index) {
            final payout = controller.payoutHistory[index];
            return _buildPayoutCard(payout);
          },
        );
      }),
    );
  }

  Widget _buildPayoutCard(payout) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(5.w),
            decoration: BoxDecoration(
              color: AppColors.buttonColor.withAlpha(60),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(payout.image, width: 30.w, height: 30.w)),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  payout.title,
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  payout.subtitle,
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.all(5.w),
            decoration: BoxDecoration(
              color: AppColors.buttonColor.withAlpha(60),
              borderRadius: BorderRadius.circular(4.r),            ),
              child: Row(
                children: [
                  Icon(Icons.dangerous, color: Colors.red),
                  Text(
                    "PDF",
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
          ),
          
        ],
      ),
    );
  }
}
