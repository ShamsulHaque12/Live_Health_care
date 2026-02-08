import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:country_picker/country_picker.dart';

class MyProfileControllerViews extends GetxController {
  final nameController = TextEditingController();
  final dateController = TextEditingController();
  final languageController = TextEditingController();
  final hobbyController = TextEditingController();
  final countryController = TextEditingController();

  RxString profilePhotoPath = ''.obs;

  final ImagePicker _picker = ImagePicker();

  /// ✅ Language dropdown list
  final List<String> languages = [
    "English",
    "Bangla",
  ];

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

  /// ✅ Pick Date
  Future<void> pickDate(BuildContext context) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime(2000),
    firstDate: DateTime(1950),
    lastDate: DateTime.now(),
  );

  if (pickedDate != null) {
    dateController.text =
        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
  }
}


  Future<void> pickPhoto() async {
    XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      profilePhotoPath.value = pickedFile.path;
    }
  }
}
