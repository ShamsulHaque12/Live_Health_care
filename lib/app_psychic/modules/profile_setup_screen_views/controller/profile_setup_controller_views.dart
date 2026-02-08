// controller/profile_setup_controller.dart

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:live_health/routes/app_routes.dart';

class ProfileSetupControllerViews extends GetxController {
  // Current step
  final currentStep = 0.obs;

  // Loading state
  final isLoading = false.obs;

  // Step 1 data
  final fullNameController = TextEditingController();
  final dobController = TextEditingController();
  final experienceController = TextEditingController();
  final languageController = TextEditingController();
  final profilePhotoPath = Rx<String?>(null);
  final selectedDate = Rx<DateTime?>(null);
  final countryController = TextEditingController();

  // Step 2 data - Specialties
  final specialties = <Map<String, dynamic>>[
    {'id': 'tarot', 'name': 'Tarot Reading', 'icon': Icons.auto_awesome, 'selected': false},
    {'id': 'love', 'name': 'Love & Relationships', 'icon': Icons.favorite, 'selected': false},
    {'id': 'career', 'name': 'Career Forecast', 'icon': Icons.work_outline, 'selected': false},
    {'id': 'numerology', 'name': 'Numerology', 'icon': Icons.calculate, 'selected': false},
    {'id': 'astrology', 'name': 'Astrology', 'icon': Icons.brightness_2, 'selected': false},
  ].obs;

  // Step 3 data
  final isOnline = false.obs;
  final callRate = 2.0.obs;
  final selectedLanguage = Rx<String?>(null);
  final languages = ['English', 'Spanish'];

  @override
  void onClose() {
    fullNameController.dispose();
    dobController.dispose();
    experienceController.dispose();
    languageController.dispose();
    super.onClose();
  }

  // Pick profile photo
  Future<void> pickPhoto() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
      );

      if (image != null) {
        profilePhotoPath.value = image.path;
        Get.snackbar('Success', 'Photo selected', snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image', backgroundColor: Colors.red);
    }
  }

  // Select date
  Future<void> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1990),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      selectedDate.value = picked;
      dobController.text = "${picked.day}/${picked.month}/${picked.year}";
    }
  }

  // Toggle specialty
  void toggleSpecialty(int index) {
    final selectedCount = specialties.where((s) => s['selected'] == true).length;

    if (specialties[index]['selected']) {
      specialties[index]['selected'] = false;
    } else {
      if (selectedCount < 3) {
        specialties[index]['selected'] = true;
      } else {
        Get.snackbar('Limit', 'Maximum 3 specialties allowed', snackPosition: SnackPosition.TOP);
        return;
      }
    }
    specialties.refresh();
  }

  // ✅ Next step (validation OFF)
  Future<void> nextStep() async {
    if (currentStep.value < 2) {
      currentStep.value++;
    } else {
      // Show loading
  isLoading.value = true;

  // Fake delay (simulate API or processing)
  await Future.delayed(const Duration(seconds: 2));

  // Hide loading
  isLoading.value = false;
      Get.offAllNamed(AppRoutes.loginScreenViews);
    }
  }

  // Previous step
  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    } else {
      Get.back();
    }
  }

  // Get selected specialties
  List<String> getSelectedSpecialties() {
    return specialties
        .where((s) => s['selected'] == true)
        .map((s) => s['name'] as String)
        .toList();
  }

  /// ✅ Pick Country
  void pickCountry(BuildContext context) {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: (Country country) {
        countryController.text = country.name;
      },
    );
  }
}
