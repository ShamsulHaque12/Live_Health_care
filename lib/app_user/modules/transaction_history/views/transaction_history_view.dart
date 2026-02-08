import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:live_health/app_theme/app_colors.dart';
import 'package:live_health/app_user/modules/transaction_history/controller/transaction_history_controller.dart';
import 'package:live_health/core/custom_tab_screen.dart';
import 'package:live_health/core/global_widgets/custom_app_bar.dart';

class TransactionHistoryView extends StatelessWidget {
 TransactionHistoryView({super.key});
 final TransactionHistoryController controller = Get.put(TransactionHistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(title: "Transaction History"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height:
                  MediaQuery.of(context).size.height * 0.5,
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