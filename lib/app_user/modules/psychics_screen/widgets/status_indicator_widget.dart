import 'package:flutter/material.dart';
import 'package:live_health/app_user/modules/psychics_screen/model/psychic_model.dart';

class StatusIndicatorWidget extends StatelessWidget {
  final PsychicStatus status;

  const StatusIndicatorWidget({super.key, required this.status});

  Color get statusColor {
    switch (status) {
      case PsychicStatus.online:
        return const Color(0xFF43A047);
      case PsychicStatus.busy:
        return const Color(0xFFFF7F0F);
      case PsychicStatus.offline:
        return const Color(0xFFF44336);
    }
  }

  String get statusText {
    switch (status) {
      case PsychicStatus.online:
        return 'Online';
      case PsychicStatus.busy:
        return 'Busy';
      case PsychicStatus.offline:
        return 'Offline';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: statusColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: statusColor.withOpacity(0.5), blurRadius: 2),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Text(
          statusText,
          style: TextStyle(
            fontFamily: 'SF Pro',
            fontSize: 10,
            height: 1.2,
            color: statusColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
