import 'package:get/get.dart';
import '../model/product_model.dart';

class ShopController extends GetxController {
  final productList = <ProductModel>[
    ProductModel(
      title: 'Amethyst Cluster',
      image:
          'https://images.unsplash.com/photo-1611078489935-0cb964de46d6',
      price: 20.00,
      rating: 5,
    ),
    ProductModel(
      title: 'Rose Quartz',
      image:
          'https://images.unsplash.com/photo-1611078489935-0cb964de46d6',
      price: 25.00,
      rating: 4,
    ),
    ProductModel(
      title: 'Healing Crystal',
      image:
          'https://images.unsplash.com/photo-1611078489935-0cb964de46d6',
      price: 18.00,
      rating: 5,
    ),
    ProductModel(
      title: 'Energy Stone',
      image:
          'https://images.unsplash.com/photo-1611078489935-0cb964de46d6',
      price: 30.00,
      rating: 5,
    ),
     ProductModel(
      title: 'Healing Crystal',
      image:
          'https://images.unsplash.com/photo-1611078489935-0cb964de46d6',
      price: 18.00,
      rating: 5,
    ),
    ProductModel(
      title: 'Energy Stone',
      image:
          'https://images.unsplash.com/photo-1611078489935-0cb964de46d6',
      price: 30.00,
      rating: 5,
    ),
  ].obs;

  /// 👉 Home screen এ limited product
  List<ProductModel> get featuredProducts =>
      productList.take(4).toList();
}
