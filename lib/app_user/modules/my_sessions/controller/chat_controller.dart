import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/chat_user_model.dart';
import '../model/message_model.dart';
import 'my_session_controller.dart';

class ChatController extends GetxController {
  final ChatUserModel user;

  ChatController(this.user);

  final messages = <MessageModel>[].obs;
  final textController = TextEditingController();

  final isBlocked = false.obs;

  @override
  void onInit() {
    super.onInit();
    isBlocked.value = user.isBlocked;

    messages.addAll([
      MessageModel(
        id: '1',
        text: 'Hello! How can I help you today?',
        isMe: false,
        time: DateTime.now().subtract(const Duration(minutes: 5)),
        status: MessageStatus.read,
      ),
      MessageModel(
        id: '2',
        text: 'I have some questions about the session.',
        isMe: true,
        time: DateTime.now().subtract(const Duration(minutes: 3)),
        status: MessageStatus.read,
      ),
      MessageModel(
        id: '3',
        text: 'Sure, go ahead 😊',
        isMe: false,
        time: DateTime.now().subtract(const Duration(minutes: 2)),
        status: MessageStatus.read,
      ),
    ]);

    ever(messages, (_) {
    });
  }

  void blockUser() {
  isBlocked.value = true;
  user.isBlocked = true;

  final sessionController = Get.find<MySessionController>();
  sessionController.blockUser(user);
}

  void sendMessage() {
    final trimmedText = textController.text.trim();
    if (trimmedText.isEmpty || isBlocked.value) return;

    final now = DateTime.now();
    final tempId = now.millisecondsSinceEpoch.toString();

    final newMessage = MessageModel(
      id: tempId,
      text: trimmedText,
      isMe: true,
      time: now,
      status: MessageStatus.sent,
    );

    messages.add(newMessage);
    textController.clear();

    messages.refresh();

    Future.delayed(Duration(milliseconds: 800 + (now.millisecond % 700)), () {
      final index = messages.indexWhere((m) => m.id == tempId);
      if (index == -1) return;

      messages[index] = messages[index].copyWith(status: MessageStatus.sent);
      messages.refresh();

      Future.delayed(Duration(seconds: 2 + (now.second % 3)), () {
        final idx2 = messages.indexWhere((m) => m.id == tempId);
        if (idx2 != -1) {
          messages[idx2] = messages[idx2].copyWith(status: MessageStatus.read);
          messages.refresh();
        }
      });
    });
  }

  // void blockUser() {
  //   isBlocked.value = true;
  //   user.isBlocked = true;
  // }

  void unblockUser() {
    isBlocked.value = false;
    user.isBlocked = false;
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}
