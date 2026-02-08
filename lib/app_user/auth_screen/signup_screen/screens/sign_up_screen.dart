import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_health/app_theme/app_colors.dart';
import 'package:live_health/app_user/auth_screen/signup_screen/controller/sign_up_controller.dart';
import 'package:live_health/core/custom_button.dart';
import 'package:live_health/core/custom_text_field.dart';
import 'package:live_health/routes/app_routes.dart';


class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Icon(Icons.arrow_back),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "assets/icons/mystiks.png",
                height: 100.h,
                width: 100.w,
              ),
            ),
            SizedBox(height: 8.h),
            Center(
              child: Text(
                "Start Your Journey",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Center(
              child: Text(
                "Connect with clients seeking guidance and expand your spiritual reach.",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            CustomTextField(
              titleText: "Full Name",
              textEditingController: controller.nameController,
              hintText: "Full Name",
              isDropdown: false,
            ),
            SizedBox(height: 6.h),
            CustomTextField(
              titleText: "Email Address",
              textEditingController: controller.emailController,
              hintText: "Email Address",
              isDropdown: false,
            ),
            SizedBox(height: 6.h),
            CustomTextField(
              titleText: "Password",
              textEditingController: controller.passwordController,
              hintText: "Password",
              isDropdown: false,
              isPassword: true,
            ),
            SizedBox(height: 6.h),
            CustomTextField(
              titleText: "Confirm Password",
              textEditingController: controller.confirmPasswordController,
              hintText: "Confirm Password",
              isDropdown: false,
              isPassword: true,
            ),
            SizedBox(height: 8.h),
            Obx(
              () => Row(
                children: [
                  Checkbox(
                    value: controller.isAgree.value,
                    onChanged: (_) => controller.toggleAgree(),
                    activeColor: AppColors.buttonColor,
                  ),
                  Expanded(
                    child: Text(
                      "I agree to the Terms of Service & Privacy Policy",
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            CustomButton(
              text: "Sign Up",
              onTap: () {
                Get.toNamed(
                  AppRoutes.otpScreen,
                  arguments: {"email": controller.emailController.text},
                );
              },
              backgroundColor: AppColors.buttonColor,
              borderColor: Colors.transparent,
              radius: 4.r,
              borderWidth: 1.w,
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: Divider(thickness: 1.w, color: Colors.grey),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text(
                    "or",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(thickness: 1.w, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            CustomButton(
              text: "Sign In with Google",
              onTap: () {},
              radius: 4.r,
              // prefixIcon: SvgPicture.asset("assets/icons/google.svg"),
              backgroundColor: Colors.transparent,
              borderColor: Colors.black,
              borderWidth: 1.w,
              textColor: Colors.black,
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.loginScreen);
                  },
                  child: Text(
                    "Log In",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.buttonColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
