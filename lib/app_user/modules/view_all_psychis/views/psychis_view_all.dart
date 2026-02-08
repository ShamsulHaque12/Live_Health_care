import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:live_health/app_theme/app_colors.dart';
import 'package:live_health/app_user/modules/psychics_screen/controller/psychics_controller.dart';
import 'package:live_health/app_user/modules/psychics_screen/widgets/psychic_card_widget.dart';
import 'package:live_health/core/global_widgets/custom_app_bar.dart';


class PsychisViewAll extends StatelessWidget {
 PsychisViewAll({super.key});
 final PsychicsController controller = Get.put(PsychicsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(title: 'All Psychics'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Column(
                children: controller.psychics
                    .map((psychic) => PsychicCardWidget(psychic: psychic))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}