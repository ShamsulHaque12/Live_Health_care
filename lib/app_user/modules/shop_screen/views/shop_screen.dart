import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:live_health/app_theme/app_colors.dart';
import 'package:live_health/app_theme/app_icons.dart';
import 'package:live_health/app_user/modules/shop_screen/widgets/product_horizontal_list.dart';
import 'package:live_health/routes/app_routes.dart';
import '../controller/shop_controller.dart';
import '../widgets/product_grid.dart';

class ShopScreen extends StatelessWidget {
  ShopScreen({super.key});

  final ShopController controller = Get.put(ShopController());

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
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.addCartSummary);
            },
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Icon(Icons.shopping_cart, color: AppColors.primaryColor),
            ),
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // GIF Banner
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  AppIcons.gifIamge,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Free Delivery for First-Time',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      'Purchase Any Spiritual Product ',
                      style: TextStyle(
                        color: Colors.white,
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
                  'Featured Spiritual Product',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.allProductScreen);
                  },
                  child: const Text(
                    'See All',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),

            SizedBox(height: 16.h),

            Obx(() => ProductHorizontalList(products: controller.featuredProducts)),

            SizedBox(height: 16.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Trending Products In Store',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.allProductScreen);
                  },
                  child: const Text(
                    'See All',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),

            SizedBox(height: 16.h),

            Obx(() => ProductGrid(products: controller.featuredProducts)),
          ],
        ),
      ),
    );
  }
}
