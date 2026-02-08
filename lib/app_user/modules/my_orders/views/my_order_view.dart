import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_health/core/global_widgets/custom_app_bar.dart';
import '../../../../app_theme/app_colors.dart';
import '../controller/my_order_controller.dart';
import '../model/active_order.dart';
import '../widget/custom_segment_tab.dart';

class MyOrderView extends StatelessWidget {
  MyOrderView({super.key});

  final MyOrderController controller = Get.put(MyOrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(title: "My Orders"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
        child: Column(
          children: [
            CustomSegmentTab(
              tabs: const ["Active", "Completed", "Cancelled"],
              onChanged: (index, title) {
                controller.changeTab(index);
              },
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: Obx(() {
                List<ActiveOrder> currentList;

                switch (controller.selectedTabIndex.value) {
                  case 0:
                    currentList = controller.activeOrderList;
                    break;
                  case 1:
                    currentList = controller.completedOrderList;
                    break;
                  case 2:
                    currentList = controller.cancelledOrderList;
                    break;
                  default:
                    currentList = [];
                }

                if (currentList.isEmpty) {
                  return const Center(child: Text("No data"));
                }

                return ListView.separated(
                  itemCount: currentList.length,
                  separatorBuilder: (_, __) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    final order = currentList[index];
                    return _orderItem(order);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  /// Order item widget
  Widget _orderItem(ActiveOrder order) {
    String? buttonText;
    VoidCallback? onTap;

    if (controller.selectedTabIndex.value == 0) {
      buttonText = "Track Order";
      onTap = () {
        Get.snackbar("Track Order", "Tracking ${order.title}");
      };
    } else if (controller.selectedTabIndex.value == 1) {
      buttonText = "Re-Order";
      onTap = () {
        controller.completedOrderList.remove(order);
        controller.activeOrderList.add(order);
        Get.snackbar("Re-Order", "${order.title} added back to Active orders");
      };
    } else {
      buttonText = null;
    }

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.network(
              order.imageUrl,
              width: 60.w,
              height: 60.w,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 60.w,
                  height: 60.w,
                  color: Colors.grey[300],
                  child: Icon(
                    Icons.image_not_supported,
                    color: Colors.grey[600],
                  ),
                );
              },
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  order.subtitle,
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      order.price,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                    if (buttonText != null)
                      GestureDetector(
                        onTap: onTap,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.buttonColor,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            buttonText,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
        ],
      ),
    );
  }
}
