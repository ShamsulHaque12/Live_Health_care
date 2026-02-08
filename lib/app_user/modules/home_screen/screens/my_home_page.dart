import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_health/app_theme/app_colors.dart';
import 'package:live_health/app_theme/app_icons.dart';
import 'package:live_health/app_user/modules/home_screen/controller/my_home_page_controller.dart';
import 'package:live_health/app_user/modules/home_screen/model/live_user_model.dart';
import 'package:live_health/app_user/modules/psychics_screen/controller/psychics_controller.dart';
import 'package:live_health/app_user/modules/psychics_screen/widgets/psychic_card_widget.dart';
import 'package:live_health/app_user/modules/view_all_psychis/views/psychis_view_all.dart';
import 'package:live_health/routes/app_routes.dart';


class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final MyHomePageController controller = Get.put(MyHomePageController());
  final PsychicsController psychicsController = Get.put(PsychicsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeColor,
      appBar: AppBar(
        backgroundColor: AppColors.homeColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundColor: AppColors.buttonColor,
              child: SvgPicture.asset(AppIcons.addWallet),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$0.00",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  "Balance",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Icon(Icons.search, color: AppColors.primaryColor),
          SizedBox(width: 10.w),
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: SvgPicture.asset(AppIcons.notification),
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Live Now",
                  style: GoogleFonts.inter(
                    color: AppColors.primaryColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.liveStreamScreen);
                  },
                  child: Text(
                    "View all",
                    style: GoogleFonts.inter(
                      color: AppColors.primaryColor.withAlpha(80),
                      decoration: TextDecoration.underline,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            SizedBox(
              height: 80.h,
              width: double.infinity,
              child: Obx(
                () => ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  itemCount: controller.liveUsers.length,
                  separatorBuilder: (_, __) => SizedBox(width: 12.w),
                  itemBuilder: (context, index) {
                    final user = controller.liveUsers[index];
                    return _liveUserItem(user);
                  },
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Stack(
              alignment: Alignment.center,
              children: [
                // GIF
                Image.asset(
                  AppIcons.gifIamge,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                // Text Column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SPECIAL OFFER',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      'First 1 Session Free',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      "With any top-rated Tarot reader today",
                      style: TextStyle(
                        color: Color(0xFFffffff).withAlpha(84),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      padding: EdgeInsets.all(5.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        "Claim Now",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Top Psychics',
                  style: TextStyle(
                    fontSize: 18.sp,
                    height: 1.2,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => PsychisViewAll());
                  },
                  child: Text(
                    "View all",
                    style: GoogleFonts.inter(
                      color: AppColors.primaryColor.withAlpha(80),
                      decoration: TextDecoration.underline,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Obx(
              () => Column(
                children: psychicsController.psychics
                    .map((psychic) => PsychicCardWidget(psychic: psychic))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _liveUserItem(LiveUserModel user) {
    return GestureDetector(
      onTap: () {
        // Get.to(
        //   () => LiveStreamScreen(
        //     name: user.name,
        //     image: user.image,
        //   ),
        //   transition: Transition.rightToLeft,
        // );
      },
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.pinkAccent, width: 2.w),
                ),
                child: CircleAvatar(
                  radius: 30.r,
                  backgroundImage: NetworkImage(user.image),
                ),
              ),

              if (user.isLive)
                Positioned(
                  bottom: -3,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "Live",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          SizedBox(height: 6.h),

          SizedBox(
            width: 70.w,
            child: Text(
              user.name,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 10.sp),
            ),
          ),
        ],
      ),
    );
  }
}
