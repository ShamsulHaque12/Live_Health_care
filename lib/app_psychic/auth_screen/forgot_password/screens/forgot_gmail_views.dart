import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_health/app_psychic/auth_screen/forgot_password/controller/forgot_gmail_controller_views.dart';
import 'package:live_health/app_theme/app_colors.dart';
import 'package:live_health/core/custom_button.dart';
import 'package:live_health/core/custom_text_field.dart';
import 'package:live_health/routes/app_routes.dart';


class ForgotGmailViews extends StatelessWidget {
  ForgotGmailViews({super.key});
  final ForgotGmailControllerViews controller = Get.put(ForgotGmailControllerViews());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Icon(Icons.arrow_back),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Forgot Password",
                style: GoogleFonts.inter(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Center(
              child: Text(
                "Enter your registered email address. We’ll send a 6-digit verification code to reset your password.",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              titleText: "Email Address",
              textEditingController: controller.emailController,
              hintText: "Enter your email address",
              isDropdown: false,
            ),
            SizedBox(height: 16.h),
            Obx(() {
              if (controller.isLoading.value) {
                return Center(child: SpinKitCircle());
              } else {
                return CustomButton(
                  text: "Send Verification Code",
                  onTap: () {
                    Get.toNamed(AppRoutes.forgotGmailViews);
                  },
                  backgroundColor: AppColors.buttonColor,
                  radius: 4.r,
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
