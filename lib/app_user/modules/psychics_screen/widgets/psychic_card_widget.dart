import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_health/app_user/modules/psychics_screen/model/psychic_model.dart';
import 'package:live_health/routes/app_routes.dart';
import '../controller/psychics_controller.dart';
import 'status_indicator_widget.dart';

class PsychicCardWidget extends GetView<PsychicsController> {
  final PsychicModel psychic;

  const PsychicCardWidget({super.key, required this.psychic});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.psychicsDetailsView,arguments: psychic);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(8),
        height: 100.h,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0x1A000000)),
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Row(
          children: [
            // Profile Image Section
            _buildProfileImage(),
           SizedBox(width: 12.w),
            // Info Section
            Expanded(child: _buildInfoSection()),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Stack(
      children: [
        Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            image: DecorationImage(
              image: NetworkImage(psychic.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 26.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFFF5F5F5).withOpacity(0),
                    const Color(0xFFF5F5F5),
                  ],
                  stops: const [0.25, 1.0],
                ),
              ),
            ),
          ),
        ),
        // Avatar badges
        Positioned(
          bottom: 4,
          left: 4,
          child: Row(
            children: [
              _buildAvatarBadge('AK', null),
              Transform.translate(
                offset: const Offset(-4, 0),
                child: _buildAvatarBadge(null, psychic.imageUrl),
              ),
              Transform.translate(
                offset: const Offset(-8, 0),
                child: _buildAvatarBadge('1k+', null),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAvatarBadge(String? text, String? imageUrl) {
    return Container(
      width: 30.w,
      height: 20.h,
      decoration: BoxDecoration(
        color: imageUrl == null ? const Color(0xFF212121) : null,
        image: imageUrl != null
            ? DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover)
            : null,
        border: Border.all(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(4.r),
      ),
      alignment: Alignment.center,
      child: text != null
          ? Text(
              text,
              style: const TextStyle(
                fontSize: 6,
                height: 1.2,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            )
          : null,
    );
  }

  Widget _buildInfoSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Name, Status, and Price
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StatusIndicatorWidget(status: psychic.status),
                   SizedBox(height: 4.h),
                    Text(
                      psychic.name,
                      style: TextStyle(
                        fontSize: 14.sp,
                        height: 1.2,
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '\$${psychic.pricePerMin.toStringAsFixed(2)}/min',
                style: TextStyle(
                  fontSize: 18.sp,
                  height: 1.2,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          // Specialties
          Text(
            psychic.specialties,
            style: TextStyle(
              fontSize: 12.sp,
              height: 1.2,
              color: Colors.black.withOpacity(0.5),
              fontWeight: FontWeight.w400,
            ),
          ),
          // Action Buttons
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => controller.onChatTap(psychic.id),
            child: Container(
              height: 32.h,
              decoration: BoxDecoration(
                color: const Color(0xFFF0F0F0),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.chat_bubble_outline,
                    color: Color(0xFF5E5C5C),
                    size: 12,
                  ),
                   SizedBox(width: 8.w),
                   Text(
                    'Chat',
                    style: TextStyle(
                      fontSize: 12.sp,
                      height: 1.2,
                      color: Color(0xFF5E5C5C),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
       SizedBox(width: 8.w),
        Expanded(
          child: GestureDetector(
            onTap: () => psychic.status == PsychicStatus.online
                ? controller.onSessionTap(psychic.id)
                : controller.onNotifyTap(psychic.id),
            child: Container(
              height: 32.h,
              decoration: BoxDecoration(
                color: const Color(0xFFB575C0),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    psychic.status == PsychicStatus.online
                        ? Icons.phone
                        : Icons.notifications,
                    color: Colors.white,
                    size: 12,
                  ),
                 SizedBox(width: 5.h),
                  Text(
                    psychic.status == PsychicStatus.online
                        ? 'Session'
                        : 'Notify me',
                    style: TextStyle(
                      fontSize: 12.sp,
                      height: 1.2,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
