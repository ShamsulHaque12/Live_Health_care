import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppsBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showBackButton;
  final VoidCallback? onBackTap;
  final String? scrolledUnderElevation;

  final Widget? actionWidget;
  final VoidCallback? onActionTap;

  final Color? backgroundColor;
  final Color? titleColor;
  final double? titleSize;
  final String? fontFamily;
  final bool centerTitle;

  const CustomAppsBar({
    super.key,
    this.title,
    this.showBackButton = false,
    this.onBackTap,
    this.actionWidget,
    this.onActionTap,
    this.backgroundColor,
    this.titleColor,
    this.titleSize,
    this.fontFamily,
    this.centerTitle = true,
    this.scrolledUnderElevation,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: centerTitle,

      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: onBackTap ?? () => Get.back(),
            )
          : null,

      title: title != null
          ? Text(
              title!,
              style: TextStyle(
                color: titleColor ?? Colors.black,
                fontSize: titleSize ?? 18,
                fontFamily: fontFamily,
                fontWeight: FontWeight.w600,
              ),
            )
          : null,

      actions: actionWidget != null
          ? [
              GestureDetector(
                onTap: onActionTap,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: actionWidget!,
                ),
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
