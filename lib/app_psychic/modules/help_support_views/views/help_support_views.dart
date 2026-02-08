import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_health/app_psychic/modules/help_support_views/controller/help_controller_views.dart';
import 'package:live_health/app_theme/app_colors.dart';
import 'package:live_health/core/custom_text_field.dart';
import 'package:live_health/core/global_widgets/custom_app_bar.dart';
import 'package:live_health/routes/app_routes.dart';


class HelpSupportViews extends StatelessWidget {
  HelpSupportViews({super.key});
  final HelpControllerViews controller = Get.put(HelpControllerViews());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(title: "Help & Support"),
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
      //     "Help & Support",
      //     style: GoogleFonts.inter(color: AppColors.primaryColor),
      //   ),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "How can we guide you today?",
              style: GoogleFonts.inter(
                color: AppColors.primaryColor,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16.h),

            // Search Field
            CustomTextField(
              textEditingController: controller.searchController,
              hintText: "Search FAQs...",
              isDropdown: false,
              prefixIcon: Icon(Icons.search, color: AppColors.primaryColor),
            ),
            SizedBox(height: 16.h),

            // FAQ Section Title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Frequently Asked Questions",
                  style: GoogleFonts.inter(
                    color: AppColors.primaryColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Obx(
                  () => controller.filteredItems.isNotEmpty
                      ? Text(
                          "${controller.filteredItems.length} items",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 13.sp,
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            ),
            SizedBox(height: 12.h),

            // FAQ List
            Obx(() {
              if (controller.filteredItems.isEmpty) {
                return _buildEmptyState();
              }
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.filteredItems.length,
                separatorBuilder: (_, __) => SizedBox(height: 12.h),
                itemBuilder: (context, index) {
                  final item = controller.filteredItems[index];
                  return Obx(() {
                    final isExpanded = controller.isExpanded(item);
                    return _buildFAQCard(
                      title: item['title']!,
                      content: item['content']!,
                      isExpanded: isExpanded,
                      onTap: () => controller.toggleItem(item),
                    );
                  });
                },
              );
            }),

            SizedBox(height: 4.h),

            // Live Chat Button
            GestureDetector(
              onTap: () {
              },
              child: Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15.w),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/chatting.svg",
                        width: 24.w,
                        height: 24.w,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Live Chat",
                          style: GoogleFonts.inter(
                            color: AppColors.primaryColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "24h Response",
                          style: GoogleFonts.inter(
                            color: Colors.grey.shade600,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.primaryColor,
                      size: 20.sp,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),

            // Contact Cards Row
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildContactCard(
                    iconPath: "assets/icons/mail.svg",
                    title: "Email Us",
                    subtitle: "24h Response",
                  ),

                  SizedBox(width: 12.w),
                  _buildContactCard(
                    iconPath: "assets/icons/whatsapp.svg",
                    title: "Whats App",
                    subtitle: "Mon-Fri (9AM-5PM)",
                  ),
                ],
              ),
            ),

            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.termsOfServicesViews);
                  },
                  child: Text(
                    "Terms Of Service",
                    style: GoogleFonts.inter(
                      color: AppColors.primaryColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  "&",
                  style: GoogleFonts.inter(
                    color: AppColors.primaryColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 8.w),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.privacyPolicyViews);
                  },
                  child: Text(
                    "Privacy Policy",
                    style: GoogleFonts.inter(
                      color: AppColors.primaryColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Center(
              child: Text(
                "App Version 2.4.1",
                style: GoogleFonts.inter(
                  color: Colors.grey[600],
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQCard({
    required String title,
    required String content,
    required bool isExpanded,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12.r),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: GoogleFonts.inter(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.primaryColor,
                      size: 24.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Expandable Content
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: isExpanded
                ? Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
                    child: Text(
                      content,
                      style: GoogleFonts.inter(
                        fontSize: 13.sp,
                        color: Colors.grey.shade600,
                        height: 1.5,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: EdgeInsets.all(40.w),
      child: Column(
        children: [
          Icon(Icons.search_off_rounded, size: 64.sp, color: Colors.grey[300]),
          SizedBox(height: 16.h),
          Text(
            "No results found",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "Try different keywords",
            style: TextStyle(fontSize: 13.sp, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard({
    required String iconPath,
    required String title,
    required String subtitle,
  }) {
    return Container(
      width: 150.w,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(15.w),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(iconPath, width: 24.w, height: 24.w),
          ),
          SizedBox(height: 8.h),
          Text(
            title,
            style: GoogleFonts.inter(
              color: AppColors.primaryColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            subtitle,
            style: GoogleFonts.inter(
              color: Colors.grey.shade600,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
