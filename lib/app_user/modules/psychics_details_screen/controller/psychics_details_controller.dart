import 'package:get/get.dart';

class PsychicsDetailsController extends GetxController {
  RxBool isExpanded = false.obs;
  void toggle() {
    isExpanded.value = !isExpanded.value;
  }
}