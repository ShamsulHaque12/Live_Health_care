import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_health/app_user/modules/psychics_screen/model/psychic_model.dart';


class PsychicsController extends GetxController {
  // Observable for selected filter index
  final selectedFilterIndex = 0.obs;

  // Observable for current page
  final currentPage = 1.obs;

  // Total pages
  final totalPages = 7;

  // Filter options
  final List<String> filters = [
    'All',
    'Crystals',
    'Tarot',
    'Incense',
    'Readings',
  ];

  // Search text controller
  final searchController = TextEditingController();

  // Sample psychics data (replace with API call)
  final RxList<PsychicModel> psychics = <PsychicModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadPsychics();
  }

  void loadPsychics() {
    // Sample data - replace with actual API call
    psychics.value = List.generate(10, (index) {
      PsychicStatus status;
      if (index < 6) {
        status = PsychicStatus.online;
      } else if (index < 8) {
        status = PsychicStatus.busy;
      } else {
        status = PsychicStatus.offline;
      }

      return PsychicModel(
        id: 'psychic_$index',
        name: 'Mystic Mara',
        pricePerMin: 3.00,
        specialties: 'Career, Finance, Eastern',
        status: status,
        imageUrl: "https://images.unsplash.com/photo-1526256262350-7da7584cf5eb",
        badges: ['AK', '1k+'],
      );
    });
  }

  void selectFilter(int index) {
    selectedFilterIndex.value = index;
    // Add logic to filter psychics based on selected filter
  }

  void changePage(int page) {
    if (page >= 1 && page <= totalPages) {
      currentPage.value = page;
      // Add logic to load psychics for the selected page
    }
  }

  void onChatTap(String psychicId) {
    // Handle chat action
    print('Chat with psychic: $psychicId');
  }

  void onSessionTap(String psychicId) {
    // Handle session action
    print('Start session with psychic: $psychicId');
  }

  void onNotifyTap(String psychicId) {
    // Handle notify action
    print('Notify me for psychic: $psychicId');
  }

  void onSearch(String query) {
    // Handle search
    print('Searching for: $query');
    // Add logic to filter psychics based on search query
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
