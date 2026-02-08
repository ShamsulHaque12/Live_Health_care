import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_health/app_psychic/modules/history_screens/affilliate_scrrens/screens/affilate_scrren.dart';
import 'package:live_health/app_psychic/modules/history_screens/live_screens/screens/live_screen.dart';
import 'package:live_health/app_psychic/modules/history_screens/sessions_screen_views/screens/sessions_views.dart';

class EarningViewControllerViews extends GetxController {
  RxDouble progress = 0.5.obs;

  void incrementProgress(double val) {
    progress.value += val;
    if (progress.value > 1.0) progress.value = 1.0;
    if (progress.value < 0.0) progress.value = 0.0;
  }

  RxInt selectedIndex = 0.obs;

  final screens = [
    SessionsViews(),
    LiveScreen(),
    AffilateScrren(),
  ];

  final tabTitles = ["Sessions", "Live", "Affiliate"];

  ScrollController scrollController = ScrollController();
  RxDouble topSectionOffset = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    double offset = scrollController.offset;
    // adjust 200 based on top section height
    double value = (offset / 200).clamp(0.0, 1.0);
    topSectionOffset.value = value;
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
