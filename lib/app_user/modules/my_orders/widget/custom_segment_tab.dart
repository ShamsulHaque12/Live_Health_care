import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSegmentTab extends StatefulWidget {
  final List<String> tabs;
  final Function(int index, String title)? onChanged;
  final int initialIndex;

  const CustomSegmentTab({
    super.key,
    required this.tabs,
    this.onChanged,
    this.initialIndex = 0,
  });

  @override
  State<CustomSegmentTab> createState() => _CustomSegmentTabState();
}

class _CustomSegmentTabState extends State<CustomSegmentTab> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: List.generate(widget.tabs.length, (index) {
          final isSelected = selectedIndex == index;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });

                /// notify parent (optional)
                widget.onChanged?.call(index, widget.tabs[index]);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                decoration: BoxDecoration(
                  color:
                      isSelected ? Colors.grey.shade200 : Colors.transparent,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Text(
                    widget.tabs[index],
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
  
}
