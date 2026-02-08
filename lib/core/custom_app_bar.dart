import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_health/app_theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;
  final VoidCallback? onBackTap;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? titleColor;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBack = true,
    this.onBackTap,
    this.actions,
    this.backgroundColor,
    this.titleColor,
  });

  @override
  Size get preferredSize => Size.fromHeight(56.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: backgroundColor ?? AppColors.backgroundColor,
      centerTitle: true,
      leading: showBack
          ? Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: GestureDetector(
                onTap: onBackTap ?? () => Get.back(),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          : null,
      title: Text(
        title,
        style: GoogleFonts.inter(
          color: titleColor ?? AppColors.primaryColor,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: actions,
    );
  }
}
