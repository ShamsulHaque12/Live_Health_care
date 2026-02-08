
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_health/app_psychic/modules/profile_setup_screen_views/controller/profile_setup_controller_views.dart';
import 'package:live_health/app_theme/app_colors.dart';
import 'package:live_health/core/custom_button.dart';
import 'package:live_health/core/custom_text_field.dart';


class ProfileSetupScreenViews extends StatelessWidget {
  ProfileSetupScreenViews({super.key});

  final ProfileSetupControllerViews controller = Get.put(ProfileSetupControllerViews());

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
            onTap: () => controller.previousStep(),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Icon(Icons.arrow_back),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Set Up Profile",
          style: GoogleFonts.inter(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: Column(
        children: [
          // Progress bar
          Obx(
            () => Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
              child: Row(
                children: List.generate(3, (index) {
                  return Expanded(
                    child: Container(
                      height: 4.h,
                      margin: EdgeInsets.only(right: index < 2 ? 8.w : 0),
                      decoration: BoxDecoration(
                        color: index <= controller.currentStep.value
                            ? AppColors.buttonColor
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),

          // Content
          Expanded(
            child: Obx(() {
              if (controller.currentStep.value == 0) {
                return _buildStep1();
              } else if (controller.currentStep.value == 1) {
                return _buildStep2();
              } else {
                return _buildStep3();
              }
            }),
          ),
        ],
      ),
    );
  }

  // Step 1: Basic Info
  Widget _buildStep1() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Let's get you started",
              style: GoogleFonts.inter(
                fontSize: 30.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          SizedBox(height: 4.h),
          Center(
            child: Text(
              "Step 1: Basic Information",
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 16.h),

          // Profile Photo
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
                      image: controller.profilePhotoPath.value != null
                          ? DecorationImage(
                              image: FileImage(
                                File(controller.profilePhotoPath.value!),
                              ),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                  ),

                  // 📷 Camera Icon (ONLY clickable)
                  Positioned(
                    bottom: -6.h,
                    right: -6.w,
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

          SizedBox(height: 8.h),
          Center(
            child: Text(
              "Upload Profile Photo",
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 16.h),

          // Full Name
          CustomTextField(
            textEditingController: controller.fullNameController,
            titleText: "Enter your full name",
            borderSide: BorderSide.none,
            isDropdown: false,
            hintText: "Enter your full name",
          ),
          SizedBox(height: 6.h),

          // Date of Birth
          CustomTextField(
            textEditingController: controller.dobController,
            titleText: "Date of birth",
            hintText: "mm/dd/yyyy",
            readOnly: true, // ✅ typing off
            borderSide: BorderSide.none,
            suffixIcon: Icon(
              Icons.calendar_month,
              color: AppColors.primaryColor,
            ),
            onSuffixTap: () {
              controller.pickDate(Get.context!);
            },
          ),

          SizedBox(height: 6.h),

          // Years of Experience
          CustomTextField(
            textEditingController: controller.experienceController,
            titleText: "Enter years of experience",
            borderSide: BorderSide.none,
            isDropdown: false,
            hintText: "Enter years of experience",
          ),
          SizedBox(height: 6.h),
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
                controller.pickCountry(Get.context!);
              },
            ),
          SizedBox(height: 20.h),

          // Continue Button
          CustomButton(
            text: "Continue",
            onTap: controller.nextStep,
            backgroundColor: AppColors.buttonColor,
            radius: 4.r,
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  // Step 2: Specialties
  Widget _buildStep2() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "What are your specialties?",
              style: GoogleFonts.inter(
                fontSize: 25.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Center(
            child: Text(
              "Select up to 3 categories that best describe your spiritual gifts.",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 16.h),

          // Specialties Grid
          Obx(
            () => Wrap(
              spacing: 12.w,
              runSpacing: 12.h,
              children: List.generate(controller.specialties.length, (index) {
                final specialty = controller.specialties[index];
                final isSelected = specialty['selected'] as bool;

                return GestureDetector(
                  onTap: () => controller.toggleSpecialty(index),
                  child: Container(
                    width: (Get.width - 44.w) / 2,
                    height: 120.h,
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primaryColor
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (isSelected)
                          Align(
                            alignment: Alignment.topRight,
                            child: Icon(
                              Icons.check_box,
                              color: AppColors.buttonColor,
                              size: 24.sp,
                            ),
                          ),
                        Icon(
                          specialty['icon'] as IconData,
                          size: 32.sp,
                          color: AppColors.primaryColor,
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          specialty['name'] as String,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),

          SizedBox(height: 30.h),

          // Continue Button
          CustomButton(
            text: "Continue",
            onTap: controller.nextStep,
            backgroundColor: AppColors.buttonColor,
            radius: 4.r,
          ),
        ],
      ),
    );
  }

  // Step 3: Availability
  Widget _buildStep3() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Set Availability",
              style: GoogleFonts.inter(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Center(
            child: Text(
              "Step 3 of 3: Finalize your schedule.",
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 16.h),

          // Online Status
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Online Status",
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Obx(
                      () => Switch(
                        value: controller.isOnline.value,
                        onChanged: (val) => controller.isOnline.value = val,
                        activeThumbColor: AppColors.buttonColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Obx(
                  () => Row(
                    children: [
                      Container(
                        width: 8.w,
                        height: 8.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.isOnline.value
                              ? Colors.green
                              : Colors.grey,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        controller.isOnline.value ? "Online" : "Offline",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "When enabled, you are visible to clients and will receive immediate call notifications.",
                  style: GoogleFonts.inter(fontSize: 12.sp, color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),

          // Call Rate
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Call Rate",
                            style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            "Price per minute",
                            style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Obx(
                          () => Text(
                            "\$${controller.callRate.value.toStringAsFixed(2)}",
                            style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 8.h),
                Row(
                  children: [
                    Icon(Icons.warning_rounded),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        "Rate adjustments affect future calls only. Active sessions continue at the rate they started with.",
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 14.h),

          // Language
          CustomTextField(
            titleText: "Select Language",
            hintText: "Choose language",
            textEditingController: controller.languageController,
            isDropdown: true,
            readOnly: true,
            dropdownItems: controller.languages,
            suffixIcon: Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(height: 30.h),

          // Continue Button
          Obx(() {
            return controller.isLoading.value
                ? SpinKitDoubleBounce(color: AppColors.buttonColor, size: 24.0)
                : CustomButton(
                    text: "Continue",
                    onTap: controller.nextStep,
                    backgroundColor: AppColors.buttonColor,
                    radius: 4.r,
                  );
          }),
        ],
      ),
    );
  }
}
