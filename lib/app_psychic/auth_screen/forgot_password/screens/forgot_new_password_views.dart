import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_health/app_psychic/auth_screen/forgot_password/controller/forgot_new_password_controller_views.dart';
import 'package:live_health/app_theme/app_colors.dart';
import 'package:live_health/core/custom_button.dart';
import 'package:live_health/core/custom_text_field.dart';
import 'package:live_health/routes/app_routes.dart';


class ForgotNewPasswordViews extends StatelessWidget {
  ForgotNewPasswordViews({super.key});
  final ForgotNewPasswordControllerViews controller = Get.put(
    ForgotNewPasswordControllerViews(),
  );

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
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Set New Password",
                style: GoogleFonts.inter(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Center(
              child: Text(
                "Please enter a new password for your admin account. Ensure it meets the security criteria below.",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            CustomTextField(
              titleText: "New Password",
              textEditingController: controller.passwordController,
              isDropdown: false,
              hintText: "Enter New Password",
            ),
            SizedBox(height: 12.h),
            CustomTextField(
              titleText: "Confirm Password",
              textEditingController: controller.confirmPasswordController,
              isDropdown: false,
              hintText: "Confirm Password",
            ),
            SizedBox(height: 20.h),
            Obx((){
              if(controller.isLoading.value == true){
                return Center(child: SpinKitCircle());
              }else{
                return CustomButton(
              text: "Reset Password",
              onTap: () {
                Get.toNamed(AppRoutes.loginScreenViews);
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
