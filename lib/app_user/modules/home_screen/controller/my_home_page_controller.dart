import 'package:get/get.dart';
import 'package:live_health/app_user/modules/home_screen/model/live_user_model.dart';

class MyHomePageController extends GetxController {
  final liveUsers = <LiveUserModel>[
    LiveUserModel(
      name: "Mandy Zemlak",
      image: "https://i.pravatar.cc/150?img=3",
      isLive: true,
    ),
    LiveUserModel(
      name: "Abel Pollich",
      image: "https://i.pravatar.cc/150?img=4",
      isLive: true,
    ),
    LiveUserModel(
      name: "Wilfred Miggi",
      image: "https://i.pravatar.cc/150?img=5",
      isLive: true,
    ),
    LiveUserModel(
      name: "Nicholas Gorc",
      image: "https://i.pravatar.cc/150?img=6",
      isLive: true,
    ),
  ].obs;
}