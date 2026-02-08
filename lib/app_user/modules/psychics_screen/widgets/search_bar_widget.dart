import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const SearchBarWidget({super.key, this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 50.h,
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0F0),
        border: Border.all(color: const Color(0x08000000)),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Icon(Icons.search, color: Color(0xFF7B7B7B), size: 20),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              controller: controller,
              onChanged: onChanged,
              style: const TextStyle(
                fontSize: 12,
                height: 1.2,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: 'Search psychics, astrology, tarot...',
                hintStyle: TextStyle(
                  fontSize: 12.sp,
                  height: 1.2,
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
