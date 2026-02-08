import 'package:get/get.dart';
import 'package:live_health/app_user/modules/live_history/views/live_history_view.dart';
import 'package:live_health/app_user/modules/my_sessions/sessions_screen/screens/sessions.dart';
import 'package:live_health/app_user/modules/shop_history_screen/views/shop_history_view.dart';
import 'package:live_health/app_user/modules/top_up_history/views/top_up_history_view.dart';

class TransactionHistoryController extends GetxController {
   RxInt selectedIndex = 0.obs;

  final screens = [
    TopUpHistoryView(),
    Sessions(),
    LiveHistoryView(),
    ShopHistoryView(),
  ];

  final tabTitles = ["Top Up", "Sessions", "Live", "Shop"];
}
