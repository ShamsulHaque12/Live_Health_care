// Controller
import 'package:get/get.dart';

import '../model/session_model.dart';

class SessionController extends GetxController {
  // Session list
  final sessions = <SessionModel>[
    SessionModel(
      name: 'Kayla Swaniawski',
      imageUrl: 'https://i.pravatar.cc/150?img=1',
      time: '15min Session',
      taka: '+\$45.00',
      image: "assets/icons/mans.svg",
    ),
    SessionModel(
      name: 'Kayla Swaniawski',
      imageUrl: 'https://i.pravatar.cc/150?img=2',
      time: '15min Session',
      taka: '+\$45.00',
      image: "assets/icons/mans.svg",
    ),
  ].obs;

}