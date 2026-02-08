import 'package:get/get.dart';
import 'package:live_health/app_psychic/modules/pay_out_history_views/model/pay_out_model.dart';

class PayOutControllerViews extends GetxController {
  // Sample payout history
  final payoutHistory = <PayOutModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadHistory();
  }

  void _loadHistory() {
    payoutHistory.addAll([
      PayOutModel(
        title: "120.oo",
        subtitle: "Oct 1, 2023",
        image: "assets/icons/tick.svg",
      ),
      PayOutModel(
        title: "200.56",
        subtitle: "Oct 1, 2023",
        image: "assets/icons/tick.svg",
      ),
      PayOutModel(
        title: "124.wee",
        subtitle: "Oct 1, 2023",
       image: "assets/icons/tick.svg",
      ),
    ]);
  }
}
