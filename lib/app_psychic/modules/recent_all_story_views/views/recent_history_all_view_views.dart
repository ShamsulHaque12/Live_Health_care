import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:live_health/app_psychic/modules/recent_all_story_views/controller/recent_history_controller_views.dart';
import 'package:live_health/app_theme/app_colors.dart';
import 'package:live_health/core/custom_tab_screen.dart';

import '../../../../core/global_widgets/custom_app_bar.dart';

class RecentHistoryAllViewViews extends StatelessWidget {
 RecentHistoryAllViewViews({super.key});
 final RecentHistoryControllerViews controller = Get.put(RecentHistoryControllerViews());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(title: "Recent History"),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 15.w, vertical: 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height:
                  MediaQuery.of(context).size.height * 0.5, // dynamic height
              child: CustomTabScreen(
                selectedIndex: controller.selectedIndex,
                tabTitles: controller.tabTitles,
                screens: controller.screens,
                activeColor: Colors.white,
                inactiveColor: Colors.grey.shade200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}