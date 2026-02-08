import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:live_health/app_theme/app_colors.dart';
import 'package:live_health/app_theme/app_icons.dart';
import 'package:live_health/app_user/modules/session_history/controller/session_history_controller.dart';
import 'package:live_health/core/global_widgets/custom_app_bar.dart';

class SessionHistory extends StatelessWidget {
  SessionHistory({super.key});

  final SessionHistoryController controller = Get.put(
    SessionHistoryController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(title: "Session History"),
      body: Obx(() {
        if (controller.history.isEmpty) {
          return const Center(child: Text("No session history found"));
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 5.h),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: ListView.builder(
              itemCount: controller.history.length,
              itemBuilder: (context, index) {
                final history = controller.history[index];
          
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 10.h,
                      ),
                      child: Row(
                        children: [
                          /// Avatar
                          CircleAvatar(
                            radius: 28.r,
                            backgroundColor: Colors.grey.shade200,
                            child: ClipOval(
                              child: Image.network(
                                history.image,
                                width: 56.w,
                                height: 56.h,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) =>
                                    const Icon(Icons.person, size: 26),
                              ),
                            ),
                          ),
          
                          SizedBox(width: 12.w),
          
                          /// Texts
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  history.title,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppIcons.session,
                                      height: 14.h,
                                      width: 14.w,
                                    ),
                                    SizedBox(width: 6.w),
                                    Text(
                                      history.subtitle,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
          
                          /// Price
                          Text(
                            history.taka,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
          
                    /// Divider (last item এ না দেখানোর জন্য)
                    if (index != controller.history.length - 1)
                      Divider(
                        height: 1,
                        thickness: 0.8,
                        color: Colors.grey.shade300,
                      ),
                  ],
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
