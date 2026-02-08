import 'package:get/get.dart';
import 'package:live_health/app_psychic/modules/session_history_views/model/session_history_model.dart';

class SessionHistoryController extends GetxController {
  final history = <SessionHistoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getHistory();
  }

  void getHistory() async {
    history.value = [
      SessionHistoryModel(
        title: "Kayla Swaniawski",
        image: "https://images.unsplash.com/photo-1526256262350-7da7584cf5eb",
        subtitle: "15min Session",
        taka: "৳500",
      ),
      SessionHistoryModel(
        title: "Mental Health Check",
        image: "https://images.unsplash.com/photo-1506126613408-eca07ce68773",
        subtitle: "Completed • 30 min",
        taka: "৳300",
      ),
      SessionHistoryModel(
        title: "Counseling Session",
        image: "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
        subtitle: "Completed • 60 min",
        taka: "৳700",
      ),
    ];
  }
}
