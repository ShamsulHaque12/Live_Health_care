import 'package:get/get.dart';
import 'package:live_health/app_psychic/modules/my_sessions_views/controller/chat_controller_views.dart';
import 'package:live_health/app_psychic/modules/my_sessions_views/model/chat_user_model.dart';

class MySessionControllerViews extends GetxController {
  final RxList<ChatUserModel> blockedUsers = <ChatUserModel>[].obs;
  final selectedTab = 0.obs;

  void changeTab(int index) {
    selectedTab.value = index;
  }

  final chatList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();

    chatList.assignAll([
      {
        "name": "Madame Zeroni",
        "message": "Hello",
        "time": "12:27PM",
        "unread": true,
        "isOnline": true,
      },
      {
        "name": "Kay Moga",
        "message": "The app don't work",
        "time": "2m ago",
        "unread": false,
        "isOnline": false,
      },
      {
        "name": "Ameer Kasim",
        "message": "You all are a piece of shit",
        "time": "2m ago",
        "unread": false,
        "isOnline": false,
      },
      {
        "name": "Kelz",
        "message": "You are the developer. I'm not a developer",
        "time": "2m ago",
        "unread": false,
        "isOnline": true,
      },
    ]);
  }

  void blockUser(ChatUserModel user) {
    if (!blockedUsers.any((u) => u.id == user.id)) {
      blockedUsers.add(user);
    }
  }

  // void unblockUser(String userId) {
  //   blockedUsers.removeWhere((u) => u.id == userId);
  //   try {
  //     final chatCtrl = Get.find<ChatController>(tag: userId);
  //     chatCtrl.isBlocked.value = false;
  //     chatCtrl.user.isBlocked = false;
  //   } catch (_) {}
  // }

  void unblockUser(String userId) {
    blockedUsers.removeWhere((u) => u.id == userId);

    if (Get.isRegistered<ChatControllerViews>(tag: userId)) {
      try {
        final chatCtrl = Get.find<ChatControllerViews>(tag: userId);
        chatCtrl.isBlocked.value = false;
        chatCtrl.user.isBlocked = false;
      } catch (_) {
        // fallback - should not reach here if isRegistered was true
      }
    }
  }
}
