import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/global_widgets/custom_button_review.dart';
import '../../../../app_theme/app_colors.dart';


void showBlockSheet({
  required bool isBlocked,
  required VoidCallback onConfirm,
  required BuildContext context,
}) {
  // final double h = MediaQuery.of(context).size.height;
  // final double w = MediaQuery.of(context).size.width;
  Get.bottomSheet(
    Stack(
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 0),
            child: Container(
              // color: Colors.black.withAlpha((2.56 * 10).toInt()),
              color: Colors.transparent,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 2.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                    color: Colors.grey.withAlpha(90),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  isBlocked ? "Unblock User?" : "Block User?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Are you sure you want to ${isBlocked ? 'unblock' : 'block'} this user for chat?",
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      // child: OutlinedButton(
                      //   onPressed: Get.back,
                      //   child: const Text("Cancel"),
                      // ),
                      child: CustomButtonReview(
                        text: 'Cancel',
                        onPressed: Get.back,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        borderRadius: 4.r,
                        height: 40.h,
                        width: 40.w,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CustomButtonReview(
                        text: isBlocked ? "Yes, Unblock" : "Yes, Block",
                        onPressed: () {
                          onConfirm();
                          Get.back();
                        },
                        backgroundColor: AppColors.redColor,
                        textColor: Colors.white,
                        borderRadius: 4.r,
                        height: 40.h,
                        width: 40.w,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
