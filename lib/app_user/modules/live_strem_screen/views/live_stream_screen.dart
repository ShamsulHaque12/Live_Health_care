import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_health/app_theme/app_colors.dart';
import 'package:live_health/app_user/modules/live_strem_screen/controller/live_stream_controller.dart';
import 'package:live_health/core/global_widgets/custom_app_bar.dart';


class LiveStreamScreen extends StatelessWidget {
  LiveStreamScreen({super.key});
  final LiveStreamController controller = Get.put(LiveStreamController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(title: 'Live Streams'),
      body: Obx(
        () => GridView.builder(
          padding: EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.75, // adjust height
          ),
          itemCount: controller.allStreams.length,
          itemBuilder: (context, index) {
            final stream = controller.allStreams[index];
            return LiveStreamGridItem(stream: stream);
          },
        ),
      ),
    );
  }
}

class LiveStreamGridItem extends StatelessWidget {
  final dynamic stream;
  const LiveStreamGridItem({super.key, required this.stream});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        image: DecorationImage(
          image: NetworkImage(stream.thumbnailUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Dark overlay for better text visibility
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Colors.black26,
            ),
          ),
          // LIVE badge
          if (stream.isLive)
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'LIVE',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          // Stream info at bottom
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stream.streamTitle,
                  style:  TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
               SizedBox(height: 2.h),
                Text(
                  stream.streamerName,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    const Icon(Icons.remove_red_eye,
                        size: 14, color: Colors.white70),
                    const SizedBox(width: 4),
                    Text(
                      '${stream.viewerCount} viewers',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
