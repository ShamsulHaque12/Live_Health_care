import 'package:get/get.dart';
import '../model/active_order.dart';

class MyOrderController extends GetxController {
  /// 0 = Active, 1 = Completed, 2 = Cancelled
  final selectedTabIndex = 0.obs;

  final activeOrderList = <ActiveOrder>[
    ActiveOrder(
      title: "Wireless Headphones",
      imageUrl: "https://cdn-icons-png.flaticon.com/512/2920/2920247.png",
      subtitle: "Over-ear, Noise Cancelling",
      price: "\$199.99",
    ),
    ActiveOrder(
      title: "Smart Watch",
      imageUrl: "https://cdn-icons-png.flaticon.com/512/891/891412.png",
      subtitle: "Fitness Tracker, Heart Rate Monitor",
      price: "\$149.99",
    ),
  ].obs;

  final completedOrderList = <ActiveOrder>[
    ActiveOrder(
      title: "Bluetooth Speaker",
      imageUrl: "https://cdn-icons-png.flaticon.com/512/364/364894.png",
      subtitle: "Portable, Waterproof",
      price: "\$99.99",
    ),
  ].obs;

  final cancelledOrderList = <ActiveOrder>[
    ActiveOrder(
      title: "VR Headset",
      imageUrl: "https://cdn-icons-png.flaticon.com/512/1046/1046784.png",
      subtitle: "Virtual Reality, Gaming",
      price: "\$299.99",
    ),
  ].obs;

  void changeTab(int index) {
    selectedTabIndex.value = index;
  }
}
