import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_health/app_theme/app_colors.dart';
import 'package:live_health/app_user/modules/psychics_screen/controller/psychics_controller.dart';
import 'package:live_health/app_user/modules/psychics_screen/widgets/filter_chips_widget.dart';
import 'package:live_health/app_user/modules/psychics_screen/widgets/psychic_card_widget.dart';
import 'package:live_health/app_user/modules/psychics_screen/widgets/search_bar_widget.dart';

class PsychicsScreen extends StatelessWidget {
 PsychicsScreen({super.key});
 final PsychicsController controller = Get.put(PsychicsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
        children: [
          // Fixed Search Bar (NOT scrollable)
          SearchBarWidget(
            controller: controller.searchController,
            onChanged: controller.onSearch,
          ),

        SizedBox(height: 16.h),

          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Filter Chips
                FilterChipsWidget(),

                SizedBox(height: 16.h),

                  // Top Psychics Title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Top Psychics',
                      style: TextStyle(
                        fontSize: 18.sp,
                        height: 1.2,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                SizedBox(height: 16.h),

                  // Psychics List
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Obx(
                      () => Column(
                        children: controller.psychics
                            .map(
                              (psychic) => PsychicCardWidget(psychic: psychic),
                            )
                            .toList(),
                      ),
                    ),
                  ),

                  // Pagination
                SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
