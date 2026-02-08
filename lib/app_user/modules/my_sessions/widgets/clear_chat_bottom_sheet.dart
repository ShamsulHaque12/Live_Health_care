
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/global_widgets/custom_button_review.dart';
import '../../../../app_theme/app_colors.dart';


void showClearSheet({
  required BuildContext context,
  required VoidCallback onConfirm,
}) {
  Get.bottomSheet(
    Stack(
      children: [
        // Blur background + tap to dismiss
        GestureDetector(
          onTap: () => Get.back(),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 0),
            child: Container(
              // color: Colors.black.withOpacity(0.35),
              color: Colors.transparent,
            ),
          ),
        ),

        // Bottom sheet content
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 16,
                  offset: Offset(0, -4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Drag handle
                Container(
                  width: 48.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                SizedBox(height: 20.h),

                // Icon + Title
                Icon(
                  Icons.delete_sweep_rounded,
                  size: 48.r,
                  color: Colors.red.shade400,
                ),
                SizedBox(height: 12.h),

                Text(
                  "Clear this chat?",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8.h),

                Text(
                  "This will permanently remove all messages\nin this conversation for you.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey.shade700,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 28.h),

                // Buttons
                Row(
                  children: [
                    Expanded(
                      child: CustomButtonReview(
                        text: 'Cancel',
                        onPressed: () => Get.back(),
                        backgroundColor: Colors.grey.shade200,
                        textColor: Colors.grey.shade800,
                        borderRadius: 4.r,
                        height: 48.h,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: CustomButtonReview(
                        text: "Clear Chat",
                        onPressed: () {
                          onConfirm();
                          Get.back();
                          // Optional: success toast can be shown
                          Get.snackbar(
                            "Chat Cleared",
                            "All messages have been removed",
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: Colors.black87,
                            colorText: Colors.white,
                            duration: Duration(seconds: 2),
                          );
                        },
                        backgroundColor: AppColors.containerColor,
                        textColor: Colors.white,
                        borderRadius: 4.r,
                        height: 40.h,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
              ],
            ),
          ),
        ),
      ],
    ),
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    // elevation: 0,
  );
}
