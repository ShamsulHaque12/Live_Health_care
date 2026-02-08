import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_health/app_theme/app_colors.dart';
import 'package:live_health/app_user/modules/review_rattings/controller/review_controller.dart';
import 'package:live_health/core/global_widgets/custom_app_bar.dart';

class ReviewRattingView extends StatelessWidget {
  const ReviewRattingView({super.key});

  @override
  Widget build(BuildContext context) {
    final ReviewController controller = Get.put(ReviewController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(title: "Review & Rattings"),
      // appBar: AppBar(
      //   scrolledUnderElevation: 0,
      //   leading: Padding(
      //     padding: EdgeInsets.only(left: 15.w),
      //     child: GestureDetector(
      //       onTap: () => Get.back(),
      //       child: Icon(Icons.arrow_back_ios, color: AppColors.primaryColor),
      //     ),
      //   ),
      //   backgroundColor: AppColors.backgroundColor,
      //   elevation: 0,
      //   title: Text(
      //     "Review & Rattings",
      //     style: TextStyle(color: AppColors.primaryColor),
      //   ),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [            
            // Rating Overview Card
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left side - Average rating
                  Obx(() => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.averageRating.value.toStringAsFixed(1),
                            style: TextStyle(
                              fontSize: 48.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Row(
                            children: List.generate(5, (index) {
                              if (index < controller.fullStars) {
                                return Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 24.sp,
                                );
                              } else if (index == controller.fullStars &&
                                  controller.hasHalfStar) {
                                return Icon(
                                  Icons.star_half,
                                  color: Colors.amber,
                                  size: 24.sp,
                                );
                              } else {
                                return Icon(
                                  Icons.star_border,
                                  color: Colors.amber,
                                  size: 20.sp,
                                );
                              }
                            }),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            '${controller.totalReviews.value} reviews',
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      )),
                  
                  SizedBox(width: 20.w),
                  
                  // Right side - Rating bars
                  Expanded(
                    child: Obx(() => Column(
                          children: controller.ratingBreakdown.map((rating) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 6.h),
                              child: Row(
                                children: [
                                  // Star number
                                  SizedBox(
                                    width: 15.w,
                                    child: Text(
                                      '${rating.stars}',
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  
                                  // Progress bar
                                  Expanded(
                                    child: Stack(
                                      children: [
                                        // Background bar
                                        Container(
                                          height: 10.h,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius: BorderRadius.circular(3.r),
                                          ),
                                        ),
                                        // Filled bar
                                        FractionallySizedBox(
                                          widthFactor: rating.percentage / 100,
                                          child: Container(
                                            height: 10.h,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  AppColors.buttonColor,
                                                  AppColors.buttonColor.withOpacity(0.7),
                                                ],
                                              ),
                                              borderRadius: BorderRadius.circular(3.r),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  
                                  // Percentage
                                  SizedBox(
                                    width: 30.w,
                                    child: Text(
                                      '${rating.percentage}%',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        )),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 20.h),
            
            // Reviews Section Title
            Text(
              'Customer Reviews',
              style: GoogleFonts.inter(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            ),
            
            SizedBox(height: 12.h),
            
            // Review List (You can add individual review cards here)
            // Example review card:
            _buildReviewCard(
              name: "John Doe",
              rating: 5,
              date: "2 days ago",
              comment: "Excellent service! Very professional and helpful.",
            ),
            
            SizedBox(height: 12.h),
            
            _buildReviewCard(
              name: "Jane Smith",
              rating: 4,
              date: "1 week ago",
              comment: "Great experience overall. Would recommend to others.",
            ),
            
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewCard({
    required String name,
    required int rating,
    required String date,
    required String comment,
  }) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    index < rating ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 20.sp,
                  ),
                ),
              ),
          SizedBox(height: 8.h),
          Text(
            comment,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[700],
              height: 1.4,
            ),
          ),
          SizedBox(height: 8.h),

          Row(
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundColor: AppColors.primaryColor.withOpacity(0.1),
                child: Text(
                  name[0],
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              
            ],
          ),
          SizedBox(height: 12.h),
          
        ],
      ),
    );
  }
}