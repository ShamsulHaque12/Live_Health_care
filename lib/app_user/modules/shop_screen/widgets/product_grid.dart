import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_health/app_user/modules/product_details_screen/controller/product_details_controller.dart';
import 'package:live_health/routes/app_routes.dart';

import '../model/product_model.dart';
import 'product_card.dart';

class ProductGrid extends StatelessWidget {
  final List<ProductModel> products;

  const ProductGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16.h,
        crossAxisSpacing: 16.w,
        childAspectRatio: 0.65,
      ),
      itemBuilder: (_, index) {
        return GestureDetector(
          onTap: () {
            final ProductDetailsController detailsController = Get.put(
              ProductDetailsController(),
            );
            detailsController.setProduct(products[index]);
            Get.toNamed(AppRoutes.productDetailsView);
          },
          child: ProductCard(
            product: products[index],
            onAdd: () {
              Get.snackbar('Added', '${products[index].title} added to cart');
            },
          ),
        );
      },
    );
  }
}
