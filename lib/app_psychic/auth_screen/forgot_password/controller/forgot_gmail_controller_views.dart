import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotGmailControllerViews extends GetxController {
  final emailController = TextEditingController();
  final pinController = TextEditingController();
  final isLoading = false.obs;

  // Resend timer
  RxInt seconds = 30.obs;
  Timer? _timer;
  RxBool canResend = false.obs;

  String get otp => pinController.text;

  void startTimer() {
    seconds.value = 30;
    canResend.value = false;

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds.value > 0) {
        seconds.value--;
      } else {
        canResend.value = true;
        timer.cancel();
      }
    });
  }

  void resendCode() {
    if (canResend.value) {
      pinController.clear();
      startTimer();
    }
  }

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  @override
  void onClose() {
    _timer?.cancel();
    pinController.dispose();
    super.onClose();
  }
}