import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ReviewControllerViews extends GetxController {
  // Observable data
  final averageRating = 4.9.obs;
  final totalReviews = 1240.obs;
  
  // Rating breakdown
  final ratingBreakdown = <RatingBreakdown>[
    RatingBreakdown(stars: 5, percentage: 10),
    RatingBreakdown(stars: 4, percentage: 5),
    RatingBreakdown(stars: 3, percentage: 3),
    RatingBreakdown(stars: 3, percentage: 2),
    RatingBreakdown(stars: 1, percentage: 1),
  ].obs;

  // Calculate filled stars (for half star support)
  int get fullStars => averageRating.value.floor();
  bool get hasHalfStar => (averageRating.value - fullStars) >= 0.5;
}

class RatingBreakdown {
  final int stars;
  final int percentage;

  RatingBreakdown({required this.stars, required this.percentage});
}