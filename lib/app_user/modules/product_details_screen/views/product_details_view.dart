import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_health/app_theme/app_colors.dart';
import 'package:live_health/core/custom_button.dart';
import 'package:live_health/routes/app_routes.dart';
import '../controller/product_details_controller.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView>
    with SingleTickerProviderStateMixin {
  final ProductDetailsController controller = Get.put(
    ProductDetailsController(),
  );

  late TabController tabController;
  final List<String> sizes = ['Small', 'Medium', 'Large'];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final product = controller.selectedProduct.value;
      if (product == null) {
        return const Scaffold(body: Center(child: Text('No product selected')));
      }

      return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Icon(Icons.arrow_back, color: AppColors.primaryColor),
            ),
          ),
          actions: [
            Icon(Icons.favorite, color: AppColors.primaryColor),
            SizedBox(width: 16.w),
            Icon(Icons.share, color: AppColors.primaryColor),
            SizedBox(width: 16.w),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Image.network(
                product.image,
                width: double.infinity,
                height: 220.h,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16.h),

              // Title & Price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.title,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 22.sp,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 16.sp),
                  SizedBox(width: 4.w),
                  Text(
                    product.rating.toString(),
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  SizedBox(width: 8.w),
                  Text('(${2} reviews)', style: TextStyle(fontSize: 14.sp)),
                ],
              ),
              SizedBox(height: 16.h),

              // Size Selector
              Text(
                'Select Size',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor.withAlpha(80),
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                children: sizes.map((size) {
                  return Obx(
                    () => GestureDetector(
                      onTap: () => controller.setSize(size),
                      child: Container(
                        margin: EdgeInsets.only(right: 8.w),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: controller.selectedSize.value == size
                              ? Colors.blue
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          size,
                          style: TextStyle(
                            color: controller.selectedSize.value == size
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 16.h),

              // Quantity Selector
              Text(
                'Quantity',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor.withAlpha(80),
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: GestureDetector(
                      onTap: controller.decrementQuantity,
                      child: Icon(Icons.remove, color: Colors.black),
                    ),
                  ),
                  Obx(
                    () => Text(
                      controller.quantity.value.toString(),
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: GestureDetector(
                      onTap: controller.incrementQuantity,
                      child: Icon(Icons.add, color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              // Tabs
              TabBar(
                controller: tabController,
                labelColor: AppColors.primaryColor,
                unselectedLabelColor: Colors.grey,
                indicatorColor: AppColors.primaryColor,
                tabs: const [
                  Tab(text: 'Description'),
                  Tab(text: 'Reviews'),
                ],
              ),

              // Tab Views inside Column
              SizedBox(
                height: 400.h, // Or calculate based on content
                child: TabBarView(
                  controller: tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    // Description
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Text(
                            "Enhance your intuition and spiritual awareness with this natural ${product.title}. Each piece is unique, ethically sourced, and cleansed with sage before shipping.",
                            maxLines: controller.isExpanded.value ? null : 3,
                            overflow: controller.isExpanded.value
                                ? TextOverflow.visible
                                : TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 6.h),
                        GestureDetector(
                          onTap: controller.toggle,
                          child: Obx(
                            () => Text(
                              controller.isExpanded.value
                                  ? 'See Less'
                                  : 'See More',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                text: 'Add to Cart',
                                onTap: () {
                                  Get.toNamed(AppRoutes.addCartSummary);
                                },
                                backgroundColor: Colors.grey.shade300,
                                textColor: Colors.black,
                                borderColor: Colors.transparent,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: CustomButton(
                                text: 'Buy Now',
                                onTap: () {
                                  Get.toNamed(
                                    AppRoutes.orderSummaryView,
                                    arguments: {
                                      'title': product.title,
                                      'image': product.image,
                                      'price': product.price,
                                      'quantity': controller.quantity.value,
                                      'size': controller.selectedSize.value,
                                    },
                                  );
                                },
                                backgroundColor: AppColors.buttonColor,
                                borderColor: Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // Reviews
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 2,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 16.r,
                                backgroundColor: Colors.grey.shade300,
                                child: Icon(Icons.person, size: 16.sp),
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'User ${index + 1}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                        SizedBox(width: 8.w),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 14.sp,
                                        ),
                                        Text(
                                          '5',
                                          style: TextStyle(fontSize: 12.sp),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      'This is a great ${product.title}! Loved it.',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      );
    });
  }
}
