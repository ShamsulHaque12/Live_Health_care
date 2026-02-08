// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:iza38230_psyche_app/core/global_widgets/custom_button_review.dart';

// void showBlockSheet({
//   required bool isBlocked,
//   required VoidCallback onConfirm,
//   required BuildContext context,
// }) {
//   final double h = MediaQuery.of(context).size.height;
//   final double w = MediaQuery.of(context).size.width;
//   Get.bottomSheet(
//     Container(
//       padding: const EdgeInsets.all(16),
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             isBlocked ? "Unblock User?" : "Block User?",
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             "Are you sure you want to ${isBlocked ? 'unblock' : 'block'} this user for chat?",
//           ),
//           const SizedBox(height: 16),
//           Row(
//             children: [
//               Expanded(
//                 // child: OutlinedButton(
//                 //   onPressed: Get.back,
//                 //   child: const Text("Cancel"),
//                 // ),
//                 child: CustomButtonReview(
//                   text: 'cancel',
//                   onPressed: Get.back,
//                   backgroundColor: Colors.grey,
//                   textColor: Colors.white,
//                   borderRadius: 4.r,
//                   height: h * 0.2,
//                   width: w * 0.2,
//                 ),
//               ),
//               const SizedBox(width: 8),
//               Expanded(
//                 child: CustomButtonReview(
//                   text: isBlocked ? "Yes, Unblock" : "Yes, Block",
//                   onPressed: onConfirm,
//                   backgroundColor: Colors.red,
//                   textColor: Colors.white,
//                   borderRadius: 4.r,
//                   height: h * 0.2,
//                   width: w * 0.2,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }
