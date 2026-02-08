import 'package:flutter/material.dart';
import 'package:live_health/app_theme/app_colors.dart';
import 'package:live_health/core/global_widgets/custom_app_bar.dart';


class AddCartSummary extends StatelessWidget {
  const AddCartSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(title: "Add to Cart Summary"),
    );
  }
}