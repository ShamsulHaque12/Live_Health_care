import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_health/app_theme/app_colors.dart';
import 'package:live_health/core/custom_button.dart';
import 'package:live_health/core/custom_text_field.dart';
import 'package:live_health/core/global_widgets/custom_app_bar.dart';
import '../controller/my_profile_controller.dart';

class MyProfileView extends StatelessWidget {
  MyProfileView({super.key});
  final MyProfileController controller = Get.put(MyProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(title: "My Profile"),
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
      //     "My Profile",
      //     style: TextStyle(color: AppColors.primaryColor),
      //   ),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Obx(
                () => Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 120.w,
                      height: 120.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade200,
                        border: Border.all(color: Colors.grey, width: 2.w),
                        image: DecorationImage(
                          image: FileImage(
                            File(controller.profilePhotoPath.value),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: null,
                    ),
                    // Camera Icon
                    Positioned(
                      bottom: 5.h,
                      right: 5.w,
                      child: GestureDetector(
                        onTap: controller.pickPhoto,
                        child: Container(
                          width: 35.w,
                          height: 35.w,
                          decoration: BoxDecoration(
                            color: AppColors.buttonColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(color: Colors.black26, blurRadius: 6),
                            ],
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            size: 18.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Center(
              child: Text(
                "Profile Photo",
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            SizedBox(height: 14.h),
            CustomTextField(
              titleText: "Full Name",
              textEditingController: controller.nameController,
              hintText: "Enter your full name",
              isDropdown: false,
            ),
            SizedBox(height: 8.h),
            CustomTextField(
              titleText: "Date of Birth",
              textEditingController: controller.dateController,
              readOnly: true,
              hintText: "Select your date of birth",
              suffixIcon: Icon(
                Icons.calendar_month,
                color: AppColors.primaryColor,
              ),
              onSuffixTap: () {
                controller.pickDate(context);
              },
            ),

            SizedBox(height: 8.h),
            CustomTextField(
              titleText: "Country",
              textEditingController: controller.countryController,
              readOnly: true,
              hintText: "Select your country",
              suffixIcon: Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.primaryColor,
              ),
              onSuffixTap: () {
                controller.pickCountry(context);
              },
            ),

            SizedBox(height: 8.h),
            CustomTextField(
              titleText: "Language",
              textEditingController: controller.languageController,
              isDropdown: true,
              hintText: "Select your language",
              dropdownItems: controller.languages,
            ),

            SizedBox(height: 8.h),
            CustomTextField(
              titleText: "Hobby",
              textEditingController: controller.hobbyController,
              isDropdown: false,
              hintText: "hobby",
            ),
            SizedBox(height: 12.h),
            CustomButton(
              text: "Save",
              onTap: () {},
              backgroundColor: AppColors.buttonColor,
              radius: 4.r,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
