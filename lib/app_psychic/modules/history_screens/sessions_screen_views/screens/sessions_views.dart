// Screen
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:live_health/app_psychic/modules/history_screens/sessions_screen_views/controller/session_controller_views.dart';
import 'package:live_health/app_psychic/modules/history_screens/sessions_screen_views/model/session_model.dart';
import 'package:live_health/app_theme/app_colors.dart';


class SessionsViews extends StatelessWidget {
  const SessionsViews({super.key});

  @override
  Widget build(BuildContext context) {
    final SessionControllerViews controller = Get.put(SessionControllerViews());

    return Scaffold(
      backgroundColor:AppColors.homeColor,
      body: Obx(
        () => ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 10),
          itemCount: controller.sessions.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final session = controller.sessions[index];
            return _buildSessionItem(session);
          },
        ),
      ),
    );
  }

  Widget _buildSessionItem(SessionModel session) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      color: Colors.white,
      child: Row(
        children: [
          // Profile Image
          CircleAvatar(
            radius: 30.r,
            backgroundImage: session.imageUrl != null
                ? NetworkImage(session.imageUrl!)
                : null,
            child: session.imageUrl == null
                ? const Icon(Icons.person, size: 30)
                : null,
          ),
         SizedBox(width: 12.w),
          
          // Name and Time
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  session.name ?? '',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
               SizedBox(height: 2.h),
                Row(
                  children: [
                    SvgPicture.asset(session.image ?? ''),
                   SizedBox(width: 4.w),
                    Text(
                      session.time ?? '',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Amount
          Text(
            session.taka ?? '',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}