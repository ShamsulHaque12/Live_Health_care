import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_health/app_theme/app_colors.dart';

class CustomRowTile extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback onTap;
  final Color iconBackgroundColor;
  final double iconSize;
  final Color textColor;
  final IconData trailingIcon;
  final Color trailingIconColor;

  const CustomRowTile({
    super.key,
    required this.title,
    required this.iconPath,
    required this.onTap,
    this.iconBackgroundColor = const Color(0x3D000000),
    this.iconSize = 24,
    this.textColor = AppColors.primaryColor,
    this.trailingIcon = Icons.arrow_forward_ios,
    this.trailingIconColor = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque, // Makes whole row clickable
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              iconPath,
              width: iconSize.w,
              height: iconSize.w,
            ),
          ),
          SizedBox(width: 10.w),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          Icon(trailingIcon, color: trailingIconColor),
        ],
      ),
    );
  }
}
