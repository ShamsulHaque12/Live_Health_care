import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_health/app_theme/app_colors.dart';
import 'package:live_health/core/global_widgets/custom_app_bar.dart';


class StoryDayViews extends StatelessWidget {
  const StoryDayViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(title: "Add to story"),
      // appBar: AppBar(
      //   elevation: 0,
      //   scrolledUnderElevation: 0,
      //   backgroundColor: AppColors.backgroundColor,
      //   leading: Padding(
      //     padding: EdgeInsets.only(left: 15.w),
      //     child: GestureDetector(
      //       onTap: () => Get.back(),
      //       child: Container(
      //         decoration: const BoxDecoration(
      //           shape: BoxShape.circle,
      //           color: Colors.white,
      //         ),
      //         child: const Icon(Icons.arrow_back),
      //       ),
      //     ),
      //   ),
      //   title: Text(
      //     "Add to story",
      //     style: GoogleFonts.inter(color: AppColors.primaryColor),
      //   ),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColors.buttonColor, width: 1.w),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.camera_alt_outlined,
                    size: 30.sp,
                    color: AppColors.primaryColor,
                  ),
                  Text(
                    "Camera",
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            Text(
              "All Add to Story",
              style: GoogleFonts.inter(
                fontSize: 20.sp,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8.h,),
          ],
        ),
      ),
    );
  }
}
