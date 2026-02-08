import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_health/app_psychic/modules/my_live_views/controller/my_live_controller_views.dart';
import 'package:live_health/app_theme/app_colors.dart';
import 'package:live_health/core/global_widgets/custom_app_bar.dart';


class ViewAllScreen extends StatelessWidget {
  const ViewAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MyLiveControllerViews controller = Get.put(MyLiveControllerViews());
    return Scaffold(
       backgroundColor: AppColors.backgroundColor,
       appBar: CustomAppBar(title: "View All Live Sessions"),
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
      //     "View All Live Sessions",
      //     style: GoogleFonts.inter(color: AppColors.primaryColor),
      //   ),
      //   centerTitle: true,
      // ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Obx(
        () => ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.liveActivities.length,
          separatorBuilder: (_, __) => SizedBox(height: 10.h),
          itemBuilder: (_, index) {
            final item = controller.liveActivities[index];
            return Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  Icon(Icons.wifi_tethering, color: Colors.purple, size: 24.h),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          "👁 ${item.views} | ❤️ ${item.likes} | \n💬 ${item.comments}",
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF666666),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        item.amount,
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "${item.date}, ${item.time}",
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF666666),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
            ),
      ),
    );
  }
  
}