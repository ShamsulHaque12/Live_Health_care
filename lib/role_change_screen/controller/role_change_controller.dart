import 'package:get/get.dart';
import 'package:live_health/routes/app_routes.dart';

enum UserType { user, psychic }

class RoleChangeController extends GetxController {
  var selectedType = UserType.user.obs;

  void select(UserType type) {
    selectedType.value = type;
    navigateBasedOnRole();
  }

  void navigateBasedOnRole() {
    if (selectedType.value == UserType.user) {
      Get.toNamed(AppRoutes.onboardingScreenView);
    } else if (selectedType.value == UserType.psychic) {
      Get.toNamed(AppRoutes.onboardingScreenViewss);
    }
  }
}
