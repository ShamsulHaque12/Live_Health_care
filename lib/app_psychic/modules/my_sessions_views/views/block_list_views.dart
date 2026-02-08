// lib/app/modules/my_sessions/views/block_list_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_health/app_psychic/modules/my_sessions_views/controller/my_session_controller_views.dart';
import 'package:live_health/app_psychic/modules/my_sessions_views/model/chat_user_model.dart';
import 'package:live_health/app_psychic/modules/my_sessions_views/widgets/custom_apps_bar.dart';
import 'package:live_health/app_psychic/modules/my_sessions_views/widgets/show_unblock_bottom_sheets.dart';
import 'package:live_health/app_theme/app_colors.dart';
import 'package:live_health/core/global_widgets/custom_button_review.dart';

class BlockListViews extends StatelessWidget {
  const BlockListViews({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MySessionControllerViews>();

    return Scaffold(
      backgroundColor: AppColors.homeColor,
      appBar: CustomAppsBar(
        title: "Block list",
        showBackButton: true,
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.blockedUsers.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.block_outlined, size: 80.r, color: Colors.grey[400]),
                SizedBox(height: 16.h),
                Text(
                  "No blocked users yet",
                  style: TextStyle(fontSize: 18.sp, color: Colors.grey[600]),
                ),
              ],
            ),
          );
        }

        return ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.h),
          itemCount: controller.blockedUsers.length,
          separatorBuilder: (_, __) => Divider(
            height: 1.h,
            thickness: 1.h,
            color: Colors.grey.shade200,
            indent: 80.w,
          ),
          itemBuilder: (context, index) {
            final user = controller.blockedUsers[index];
            return _buildUserTile(user);
          },
        );
      }),
    );
  }

  Widget _buildUserTile(ChatUserModel user) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 4.r,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar
              CircleAvatar(
                radius: 28.r,
                backgroundImage: AssetImage(user.avatar),
                backgroundColor: Colors.grey[200],
              ),

              SizedBox(width: 16.w),

              // Name + Subtitle
              // Expanded(
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         user.name,
              //         style: TextStyle(
              //           fontSize: 16.sp,
              //           fontWeight: FontWeight.w600,
              //           color: Colors.black87,
              //         ),
              //         maxLines: 1,
              //         overflow: TextOverflow.ellipsis,
              //       ),
              //       SizedBox(height: 4.h),
              //       Text(
              //         user.subtitle,
              //         style: TextStyle(fontSize: 13.sp, color: Colors.grey[700]),
              //         maxLines: 1,
              //         overflow: TextOverflow.ellipsis,
              //       ),
              //     ],
              //   ),
              // ),
              Expanded(
                child: Text(
                  user.name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              // Unblock Button
              CustomButtonReview(
                text: "Unblock",
                backgroundColor: Colors.purple,
                textColor: Colors.white,
                borderRadius: 4.r,
                onPressed: () {
                  showUnblockSheet(
                    isBlocked: true,
                    onConfirm: () =>
                        Get.find<MySessionControllerViews>().unblockUser(user.id),
                    context: Get.context!,
                  );
                },
              ),
              // TextButton(
              //   onPressed: () {
              //     showUnblockSheet(
              //       isBlocked: true,
              //       onConfirm: () =>
              //           Get.find<MySessionController>().unblockUser(user.id),
              //       context: Get.context!,
              //     );
              //   },
              //   style: TextButton.styleFrom(
              //     padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              //     minimumSize: Size(0, 0),
              //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              //   ),
              //   child: Text(
              //     "Unblock",
              //     style: TextStyle(
              //       color: const Color(0xFF9B51E0),
              //       fontSize: 14.sp,
              //       fontWeight: FontWeight.w600,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
