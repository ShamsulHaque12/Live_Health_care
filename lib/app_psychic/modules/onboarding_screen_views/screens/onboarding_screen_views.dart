// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:iiza38230_user_app/app_theme/app_colors.dart';
// import 'package:iiza38230_user_app/core/custom_button.dart';
// import 'package:iiza38230_user_app/routes/app_routes.dart';

// class OnboardingScreens extends StatelessWidget {
//   const OnboardingScreens({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background Image
//           Positioned.fill(
//             child: Image.asset(
//               'assets/images/bakground.png',
//               fit: BoxFit.cover,
//             ),
//           ),

//           // Bottom Text Area
//           Positioned(
//             left: 24,
//             right: 24,
//             bottom: 40,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   "Your Psychic Hub",
//                   textAlign: TextAlign.center,
//                   style: GoogleFonts.inter(
//                     fontSize: 32.sp,
//                     fontWeight: FontWeight.w600,
//                     color: AppColors.primaryColor,
//                   ),
//                 ),
//                 SizedBox(height: 8.h),
//                 Text(
//                   "Seamlessly manage your profile, connect with clients instantly, and track your spiritual business growth in one place.",
//                   textAlign: TextAlign.center,
//                   style: GoogleFonts.inter(
//                     color: AppColors.primaryColor,
//                     fontSize: 14.sp,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//                 SizedBox(height: 24.h),
//                 CustomButton(
//                   text: "Get Started",
//                   onTap: () {
//                     Get.toNamed(AppRoutes.onboardingScreenView);
//                   },
//                   backgroundColor: AppColors.buttonColor,
//                   radius: 4.r,
//                 ),
//                 SizedBox(height: 16.h),
//                 CustomButton(
//                   text: "Login",
//                   onTap: () {
//                     Get.toNamed(AppRoutes.loginScreenViews);
//                   },
//                   backgroundColor: Colors.transparent,
//                   radius: 4.r,
//                   borderColor: AppColors.buttonColor,
//                   borderWidth: 1.w,
//                   textColor: AppColors.buttonColor,
//                 ),
//                 SizedBox(height: 16.h),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
