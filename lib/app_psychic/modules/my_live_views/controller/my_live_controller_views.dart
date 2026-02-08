import 'package:get/get.dart';
import 'package:live_health/app_psychic/modules/my_live_views/model/live_activity_model.dart';
import 'package:live_health/app_psychic/modules/my_live_views/model/stats_model.dart';

class MyLiveControllerViews extends GetxController {
   final statsList = <StatsModel>[].obs;
  final liveActivities = <LiveActivityModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadStats();
    loadLiveActivities();
  }

  void loadStats() {
    statsList.value = [
      StatsModel(
        title: "Followers",
        value: "1.2k",
        changePercent: "+12%",
        isIncrease: true,
        icon: "assets/icons/user1.svg",
      ),
      StatsModel(
        title: "Views",
        value: "10k",
        changePercent: "+5%",
        isIncrease: true,
        icon: "assets/icons/view.svg",
      ),
      StatsModel(
        title: "Love",
        value: "1.9k",
        changePercent: "+12%",
        isIncrease: true,
        icon: "assets/icons/favourite.svg",
      ),
      StatsModel(
        title: "Comments",
        value: "1.1k",
        changePercent: "+5%",
        isIncrease: true,
        icon: "assets/icons/comment.svg",
      ),
    ];
  }

  void loadLiveActivities() {
    liveActivities.value = [
      LiveActivityModel(
        title: "Clairvoyant • Crystal...",
        amount: "\$53,548",
        date: "Oct 24",
        time: "10:30 PM",
        views: 1200,
        likes: 1200,
        comments: 1200,
      ),
      LiveActivityModel(
        title: "Clairvoyant • Crystal...",
        amount: "\$53,548",
        date: "Oct 24",
        time: "10:30 PM",
        views: 1200,
        likes: 1200,
        comments: 1200,
      ),
    ];
  }
}