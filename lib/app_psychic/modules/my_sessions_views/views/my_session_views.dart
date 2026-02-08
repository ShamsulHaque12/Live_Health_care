import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_health/app_psychic/modules/history_screens/sessions_screen_views/screens/sessions_views.dart';
import 'package:live_health/app_psychic/modules/my_sessions_views/controller/my_session_controller_views.dart';
import 'package:live_health/app_psychic/modules/my_sessions_views/model/chat_user_model.dart';
import 'package:live_health/app_psychic/modules/my_sessions_views/views/block_list_views.dart';
import 'package:live_health/app_psychic/modules/my_sessions_views/views/chat_views.dart';
import 'package:live_health/app_psychic/modules/my_sessions_views/widgets/custom_apps_bar.dart';
import 'package:live_health/app_theme/app_colors.dart';

class MySessionViews extends StatelessWidget {
  MySessionViews({super.key});

  final MySessionControllerViews controller = Get.put(MySessionControllerViews());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppsBar(
        title: "My Session",
        showBackButton: false,
        centerTitle: true,
        actionWidget: PopupMenuButton<int>(
          surfaceTintColor: Colors.white,
          color: Colors.white,
          icon: const Icon(Icons.more_vert_outlined),

          offset: const Offset(0, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          onSelected: (value) {
            if (value == 1) {
              Get.to(() => BlockListViews());
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
              child: Text("Block List", style: TextStyle(fontSize: 15.sp)),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: Column(
          children: [
            SizedBox(height: 12.h),

            // Tab bar
            Container(
              height: 35.h,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: [_tabButton("Chats", 0), _tabButton("Session", 1)],
                ),
              ),
            ),

            SizedBox(height: 16.h),

            // Content area
            Expanded(
              child: Obx(() {
                if (controller.selectedTab.value == 0) {
                  return _chatList();
                }
                return SessionsViews();
                // return const Center(
                //   child: Text(
                //     "Session List (Coming Soon)",
                //     style: TextStyle(fontSize: 16, color: Colors.grey),
                //   ),
                // );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabButton(String title, int index) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => controller.changeTab(index),
        child: Obx(() {
          final isActive = controller.selectedTab.value == index;
          return Container(
            height: 30.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isActive ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                color: isActive ? Colors.black : Colors.grey[700],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _chatList() {
    return Obx(() {
      if (controller.chatList.isEmpty) {
        return const Center(
          child: Text(
            "No chats yet",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        );
      }

      return ListView.separated(
        itemCount: controller.chatList.length,
        separatorBuilder: (_, __) =>
            Divider(height: 1.h, color: Colors.grey.shade300),
        itemBuilder: (context, index) {
          final chat = controller.chatList[index];
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              final user = ChatUserModel(
                id: index.toString(),
                name: chat["name"] ?? "Unknown",
                subtitle: chat["subtitle"] ?? " ",
                avatar: chat["avatar"] ?? "assets/images/profile.png",
                isOnline: chat["isOnline"] ?? false,
                isBlocked: chat["isBlocked"] ?? false,
              );

              Get.to(() => ChatViews(user: user));
            },
            child: _chatTile(
              name: chat["name"] ?? "",
              message: chat["message"] ?? "",
              time: chat["time"] ?? "",
              hasUnread: chat["unread"] ?? false,
              isOnline: chat["isOnline"] ?? false,
            ),
          );
        },
      );
    });
  }

  Widget _chatTile({
    required String name,
    required String message,
    required String time,
    required bool hasUnread,
    required bool isOnline,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar + online indicator
          Stack(
            children: [
              CircleAvatar(
                radius: 22.r,
                backgroundImage: const AssetImage("assets/images/profile.png"),
              ),
              if (isOnline)
                Positioned(
                  bottom: 1,
                  right: 1,
                  child: Container(
                    width: 11.w,
                    height: 11.h,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2.2),
                    ),
                  ),
                ),
            ],
          ),

          SizedBox(width: 12.w),

          // Name + last message
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  message,
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey[700]),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // Time + unread badge
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                time,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: hasUnread ? const Color(0xFFB46AF5) : Colors.grey[600],
                ),
              ),
              SizedBox(height: 6.h),
              if (hasUnread)
                Container(
                  width: 18.w,
                  height: 18.h,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color(0xFFB46AF5),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    // "${controller.unreadCount.value}",
                    '2',
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
