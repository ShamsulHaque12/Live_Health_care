import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_health/app_theme/app_colors.dart';
import 'package:live_health/app_user/auth_screen/login_screens/controller/login_controller.dart';
import 'package:live_health/app_user/modules/navigation_bar/screens/main_bottom_bar_screen.dart';
import 'package:live_health/core/custom_button.dart';
import 'package:live_health/core/custom_text_field.dart';
import 'package:live_health/routes/app_routes.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 50.h),
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
                  "Welcome Back",
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
                  "Enter your details below to Log in",
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
                titleText: "Email Address",
                hintText: "Enter your email address",
                textEditingController: controller.emailController,
                isDropdown: false,
              ),
              SizedBox(height: 12.h),
              CustomTextField(
                titleText: "Password",
                textEditingController: controller.passwordController,
                hintText: "Enter your password",
                isDropdown: false,
                isPassword: true,
              ),
              SizedBox(height: 8.h),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.forgotGmail);
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.buttonColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: SpinKitDoubleBounce());
                } else {
                  return CustomButton(
                    text: "Sign In",
                    onTap: () {
                      Get.offAll(() => MainBottomBarScreen());
                    },
                    backgroundColor: AppColors.buttonColor,
                    borderColor: Colors.transparent,
                    radius: 4.r,
                    borderWidth: 1.w,
                  );
                }
              }),
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
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.signUpScreen);
                    },
                    child: Text(
                      " Sign Up",
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.buttonColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Center(
                child: Text(
                  "Terms of Service and Privacy Policy.",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
