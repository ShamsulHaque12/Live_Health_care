import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class OrderSummaryController extends GetxController {
  final promoController = TextEditingController();
  RxInt quantity = 1.obs;
}