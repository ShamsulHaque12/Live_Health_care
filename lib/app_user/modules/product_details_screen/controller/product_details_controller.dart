import 'package:get/get.dart';
import '../../shop_screen/model/product_model.dart';

class ProductDetailsController extends GetxController {
  // Selected product
  final Rx<ProductModel?> selectedProduct = Rx<ProductModel?>(null);

  // Selected size
  final RxString selectedSize = 'Small'.obs;

  RxBool isExpanded = false.obs;
  void toggle() {
    isExpanded.value = !isExpanded.value;
  }

  // Quantity
  final RxInt quantity = 1.obs;

  void setProduct(ProductModel product) {
    selectedProduct.value = product;
  }

  void setSize(String size) {
    selectedSize.value = size;
  }

  void incrementQuantity() {
    quantity.value++;
  }

  void decrementQuantity() {
    if (quantity.value > 1) quantity.value--;
  }
}
