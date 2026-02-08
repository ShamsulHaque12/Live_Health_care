import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_health/app_theme/app_colors.dart';
import 'package:live_health/app_user/modules/psychics_details_screen/controller/psychics_details_controller.dart';
import 'package:live_health/app_user/modules/psychics_screen/model/psychic_model.dart';
import 'package:live_health/core/global_widgets/custom_app_bar.dart';


class PsychicsDetailsView extends StatelessWidget {
  PsychicsDetailsView({super.key});
  final PsychicsDetailsController controller = Get.put(
    PsychicsDetailsController(),
  );

  @override
  Widget build(BuildContext context) {
    final PsychicModel psychic = Get.arguments as PsychicModel;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(title: "Psychic Details"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Psychic Image
              Container(
                height: 200.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(psychic.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/circel.svg"),
                  SizedBox(width: 8.w),
                  Text(
                    psychic.status == PsychicStatus.online ? "Online" : "Offline",
                    style: TextStyle(
                      fontSize: 16,
                      color: psychic.status == PsychicStatus.online
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "\$${psychic.pricePerMin.toStringAsFixed(2)}/min",
                    style: TextStyle(
                      fontSize: 22.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              // Name & Status
              Text(
                psychic.name,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                "Specialties: ${psychic.specialties}",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 6.h),
              Row(
                children: [
                  Icon(Icons.language, color: Colors.black54, size: 20.sp),
                  SizedBox(width: 6.w),
                  Text(
                    "Languages:",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 20.sp),
                  SizedBox(width: 6.w),
                  Text(
                    "4.9 Rating",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              Text(
                "About Me",
                style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4.h),
              Obx(
                () => Text(
                  "I am a 3rd generation clairvoyant specializing in love, career, and spiritual healing. My readings are honest, direct, and compassionate. I use Tarot, Astrology, and Crystal Ball to guide you through life's toughest questions. Let's unlock your future together",
                  maxLines: controller.isExpanded.value ? null : 3,
                  overflow: controller.isExpanded.value
                      ? TextOverflow.visible
                      : TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 3.h),
              GestureDetector(
                onTap: controller.toggle,
                child: Obx(
                  () => Text(
                    controller.isExpanded.value ? 'See Less' : 'See More',
                    style: TextStyle(
                      color: AppColors.buttonColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Photos & Videos",
                    style: GoogleFonts.inter(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColors.buttonColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6.h),
             Container(
                height: 60.h,
                width: 80.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(psychic.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 6.h),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Client Love",
                    style: GoogleFonts.inter(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColors.buttonColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              Container(
                width: 280.w,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20.r,
                          backgroundImage: NetworkImage(psychic.imageUrl),
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          psychic.name,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      "Amazing reading!",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Thank you so much for the insightful reading. It really helped me gain clarity on my situation.",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h,)
            ],
          ),
        ),
      ),
    );
  }
}
