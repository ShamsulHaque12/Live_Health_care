import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_health/app_theme/app_colors.dart';
import 'package:live_health/app_user/modules/shop_screen/controller/shop_controller.dart';
import 'package:live_health/app_user/modules/shop_screen/widgets/product_grid.dart';
import 'package:live_health/core/global_widgets/custom_app_bar.dart';


class AllProductScreen extends StatelessWidget {
  AllProductScreen({super.key});

  final ShopController controller = Get.find<ShopController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(title: "All Products"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
        child: Obx(
          () => ProductGrid(
            products: controller.productList.toList(),
          ),
        ),
      ),
    );
  }
}


