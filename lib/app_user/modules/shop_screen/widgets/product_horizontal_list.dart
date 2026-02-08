import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_health/app_user/modules/product_details_screen/controller/product_details_controller.dart';
import 'package:live_health/routes/app_routes.dart';
import '../model/product_model.dart';
import 'product_card.dart';

class ProductHorizontalList extends StatelessWidget {
  final List<ProductModel> products;

  const ProductHorizontalList({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        separatorBuilder: (_, __) => SizedBox(width: 16.w),
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
               final ProductDetailsController detailsController = Get.put(
              ProductDetailsController(),
            );
            detailsController.setProduct(products[index]);
            Get.toNamed(AppRoutes.productDetailsView);
            },
            child: SizedBox(
              width: 180.w,
              child: ProductCard(
                product: products[index],
                onAdd: () {
                  Get.snackbar(
                    'Added',
                    '${products[index].title} added to cart',
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
