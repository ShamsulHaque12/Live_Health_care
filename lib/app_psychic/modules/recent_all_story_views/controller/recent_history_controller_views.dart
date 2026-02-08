import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:live_health/app_psychic/modules/history_screens/affilliate_scrrens/screens/affilate_scrren.dart';
import 'package:live_health/app_psychic/modules/history_screens/live_screens/screens/live_screen.dart';
import 'package:live_health/app_psychic/modules/history_screens/sessions_screen_views/screens/sessions_views.dart';

class RecentHistoryControllerViews extends GetxController {
   RxInt selectedIndex = 0.obs;

  final screens = [
    SessionsViews(),
    LiveScreen(),
    AffilateScrren(),
  ];

  final tabTitles = ["Sessions", "Live", "Affiliate"];
}