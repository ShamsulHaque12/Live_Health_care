import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_health/app_theme/app_colors.dart';
import 'package:live_health/app_user/modules/order_summary_screen/controller/order_summary_controller.dart';
import 'package:live_health/core/custom_button.dart';
import 'package:live_health/core/custom_text_field.dart';
import 'package:live_health/core/global_widgets/custom_app_bar.dart';


class OrderSummaryView extends StatelessWidget {
  OrderSummaryView({super.key});
  final OrderSummaryController controller = Get.put(OrderSummaryController());

  @override
  Widget build(BuildContext context) {
    // Get arguments
    final args = Get.arguments as Map<String, dynamic>;
    final String title = args['title'];
    final String image = args['image'];
    final double price = args['price'];
    final String size = args['size'];

    // Set initial quantity from previous screen
    controller.quantity.value = args['quantity'];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(title: 'Order Summary'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Card
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.network(
                      image,
                      height: 100.h,
                      width: 100.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  // Product Details + Quantity
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.inter(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Size: $size',
                          style: GoogleFonts.inter(
                              fontSize: 14.sp, color: Colors.grey.shade700),
                        ),
                        SizedBox(height: 8.h),
                        // Quantity selector
                        Obx(
                          () => Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (controller.quantity.value > 1) {
                                    controller.quantity.value--;
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8.w),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Icon(Icons.remove, size: 20.sp),
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Text(
                                controller.quantity.value.toString(),
                                style: GoogleFonts.inter(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 12.w),
                              GestureDetector(
                                onTap: () => controller.quantity.value++,
                                child: Container(
                                  padding: EdgeInsets.all(8.w),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Icon(Icons.add,
                                      size: 20.sp, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Price: \$${price.toStringAsFixed(2)}',
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            // Total Card
            Obx(
              () => Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: GoogleFonts.inter(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '\$${(price * controller.quantity.value).toStringAsFixed(2)}',
                      style: GoogleFonts.inter(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),

            // Promo Code
            Text(
              "Promo Code",
              style: GoogleFonts.inter(
                  fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8.h),
            CustomTextField(
              textEditingController: controller.promoController,
              hintText: 'Enter Promo Code',
            ),
            SizedBox(height: 24.h),

            // Proceed Button
            CustomButton(
              text: 'Proceed to Payment',
              onTap: () {
                // TODO: Navigate to payment
              },
              backgroundColor: AppColors.buttonColor,
              borderColor: Colors.transparent,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
