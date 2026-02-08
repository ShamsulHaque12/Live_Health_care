import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_health/role_change_screen/controller/role_change_controller.dart';

class RoleChangeView extends StatelessWidget {
  RoleChangeView({super.key});

  final RoleChangeController controller =
      Get.put(RoleChangeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose Your Role',
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Select how you want to experience our psychic guidance community.',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 24.h),

              /// USER CARD
              Obx(() => _roleCard(
                    icon: Icons.person_outline,
                    title: "I’m Seeking Guidance",
                    subtitle:
                        "Discover psychic guidance, live sessions, and exclusive products",
                    isSelected:
                        controller.selectedType.value == UserType.user,
                    onTap: () => controller.select(UserType.user),
                  )),

              SizedBox(height: 16.h),

              /// PSYCHIC CARD
              Obx(() => _roleCard(
                    icon: Icons.psychology,
                    title: "I am a Psychic",
                    subtitle:
                        "Provide readings, go live, and guided globally",
                    isSelected:
                        controller.selectedType.value == UserType.psychic,
                    onTap: () => controller.select(UserType.psychic),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _roleCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected
                ? const Color(0xffB16CEA)
                : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 48.w,
              width: 48.w,
              decoration: BoxDecoration(
                color: const Color(0xffF2F2F2),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(icon, size: 26.sp),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Container(
                height: 26.w,
                width: 26.w,
                decoration: BoxDecoration(
                  color: const Color(0xffB16CEA),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 18.sp,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
