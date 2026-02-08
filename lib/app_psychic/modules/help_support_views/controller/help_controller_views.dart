import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpControllerViews extends GetxController {
  final searchController = TextEditingController();

  // FAQ items data
  final faqItems = [
    {
      'title': 'My Readings History',
      'content': 'Lorem ipsum dolor sit amet consectetur. Habitant pellentesque nunc sem eleifend in mauris ridiculus.',
    },
    {
      'title': 'Billing & Money',
      'content': 'View your billing history, payment methods, and transaction details here.',
    },
    {
      'title': 'Advisor Vetting Process',
      'content': 'Learn about our comprehensive advisor verification and quality assurance process.',
    },
    {
      'title': 'How to Book a Session?',
      'content': 'Browse through our advisors, select your preferred one, and choose an available time slot that works for you.',
    },
   
  ];

  // Track which items are expanded using title as key
  final expandedStates = <String, bool>{}.obs;

  // Filtered FAQ items based on search
  final filteredItems = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredItems.value = faqItems;
    searchController.addListener(_filterFAQs);
  }

  // Filter FAQs based on search query
  void _filterFAQs() {
    final query = searchController.text.toLowerCase();

    if (query.isEmpty) {
      filteredItems.value = faqItems;
    } else {
      filteredItems.value = faqItems.where((item) {
        final title = item['title']!.toLowerCase();
        final content = item['content']!.toLowerCase();
        return title.contains(query) || content.contains(query);
      }).toList();
    }

    // Clear expanded states when searching
    expandedStates.clear();
  }

  // Toggle specific item
  void toggleItem(Map<String, String> item) {
    final key = item['title']!;
    expandedStates[key] = !(expandedStates[key] ?? false);
  }

  // Check if item is expanded
  bool isExpanded(Map<String, String> item) {
    final key = item['title']!;
    return expandedStates[key] ?? false;
  }

  // Collapse all items
  void collapseAll() {
    expandedStates.clear();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
