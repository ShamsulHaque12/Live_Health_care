import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_health/app_theme/app_colors.dart';
import 'package:live_health/app_user/auth_screen/forgot_password/controller/forgot_gmail_controller.dart';
import 'package:live_health/core/custom_button.dart';
import 'package:live_health/routes/app_routes.dart';
import 'package:pinput/pinput.dart';

class ForgotOtpGmail extends StatelessWidget {
 ForgotOtpGmail({super.key});
 final ForgotGmailController controller = Get.put(ForgotGmailController());

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 45.w,
      height: 50.h,
      textStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColor,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.buttonColor),
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
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
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),

            Center(
              child: Image.asset(
                "assets/icons/gmail.png",
                height: 50.h,
                width: 70.w,
              ),
            ),

            SizedBox(height: 8.h),

            Center(
              child: Text(
                "Verify your email",
                style: GoogleFonts.inter(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                ),
              ),
            ),

            SizedBox(height: 6.h),

            Center(
              child: Text(
                "We've sent a mystical code to ${controller.emailController.text} Enter it below to unlock your inner eye.",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  color: AppColors.primaryColor,
                ),
              ),
            ),

            SizedBox(height: 20.h),

            /// 🔐 OTP PIN INPUT
            Center(
              child: Pinput(
                length: 6,
                controller: controller.pinController,
                keyboardType: TextInputType.number,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(color: AppColors.buttonColor, width: 2),
                  ),
                ),
                onCompleted: (pin) {
                  debugPrint("OTP Completed: $pin");
                },
              ),
            ),

            SizedBox(height: 16.h),

            /// 🔁 Resend
            Center(
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't receive the email? ",
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: controller.canResend.value
                          ? controller.resendCode
                          : null,
                      child: Text(
                        controller.canResend.value
                            ? "Resend code"
                            : "Resend code 00:${controller.seconds.value.toString().padLeft(2, '0')}",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          color: AppColors.buttonColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20.h),

            CustomButton(
              text: "Verify & Continue",
              radius: 4.r,
              backgroundColor: AppColors.buttonColor,
              onTap: () {
                Get.toNamed(AppRoutes.forgotNewPassword);
              },
            ),
          ],
        ),
      ),
    );
  }
}