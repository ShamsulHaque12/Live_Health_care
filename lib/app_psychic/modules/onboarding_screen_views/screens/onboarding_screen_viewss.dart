import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_health/app_psychic/modules/onboarding_screen_views/controller/onboarding_controller_views.dart';
import 'package:live_health/app_theme/app_colors.dart';
import 'package:live_health/app_theme/app_images.dart';
import 'package:live_health/routes/app_routes.dart';

class OnboardingScreenViewss extends StatelessWidget {
  OnboardingScreenViewss({super.key});
  final OnboardingControllerViews controller = Get.put(OnboardingControllerViews());

  @override
  Widget build(BuildContext context) {
    final bgImages = [
      AppImages.onboarding4,
      AppImages.onboarding5,
      AppImages.onboarding6,
    ];

    final titles = [
      'Watch Live Psychic Sessions',
      'All-in-One Psychic Dashboard',
      'Control Your Time & Earnings',
    ];

    final descriptions = [
      'Connect with clients anytime, anywhere through secure 1-to-1 live sessions.',
      'Manage your availability, go live, and stream to multiple platforms from one powerful dashboard',
      'Set your availability, toggle Online when ready, and track your schedule and earnings in one place.',
    ];

    return Scaffold(
      body: Stack(
        children: [
          // PageView with background images
          PageView.builder(
            controller: controller.pageController,
            itemCount: bgImages.length,
            onPageChanged: controller.onPageChanged,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  // Background Image
                  Positioned.fill(
                    child: Image.asset(bgImages[index], fit: BoxFit.cover),
                  ),
                ],
              );
            },
          ),

          // Overlay content
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  // Skip button at top-right
                  SizedBox(height: 20.h),
                  Obx(
                    () => controller.currentIndex.value == 0
                        ? Align(
                            alignment: Alignment.topRight,
                            child: TextButton(
                              onPressed: () {
                                Get.toNamed(AppRoutes.loginScreenViews);
                              },
                              child: Text(
                                'Skip',
                                style: GoogleFonts.inter(
                                  color: AppColors.buttonColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),

                  const Spacer(),

                  Obx(() {
                    int index = controller.currentIndex.value;
                    return Column(
                      children: [
                        Text(
                          titles[index],
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          descriptions[index],
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    );
                  }),

                  SizedBox(height: 8.h),

                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        bgImages.length,
                        (dotIndex) => Container(
                          margin: EdgeInsets.all(4),
                          height: 8,
                          width: controller.currentIndex.value == dotIndex
                              ? 20
                              : 8,
                          decoration: BoxDecoration(
                            color: controller.currentIndex.value == dotIndex
                                ? AppColors.buttonColor
                                : const Color.fromARGB(137, 58, 51, 51),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 12.h),

                  // Next/Get Started button
                  // Next/Get Started button
                  SizedBox(
                    width: double.infinity,
                    height: 45.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      onPressed: () {
                        if (controller.currentIndex.value ==
                            bgImages.length - 1) {
                          Get.toNamed(AppRoutes.loginScreenViews);
                        } else {
                          controller.nextPage();
                        }
                      },
                      child: Obx(
                        () => Text(
                          controller.currentIndex.value == bgImages.length - 1
                              ? 'Get Started'
                              : 'Next',
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
