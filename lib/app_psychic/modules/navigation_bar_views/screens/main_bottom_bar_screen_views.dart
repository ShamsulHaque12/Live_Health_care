import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:live_health/app_psychic/modules/earning_views/views/earning_view_views.dart';
import 'package:live_health/app_psychic/modules/home_screen_views/screens/my_home_page_views.dart';
import 'package:live_health/app_psychic/modules/my_account_views/views/account_views.dart';
import 'package:live_health/app_psychic/modules/my_live_views/views/my_live_views.dart';
import 'package:live_health/app_psychic/modules/my_sessions_views/views/my_session_views.dart';
import 'package:live_health/app_theme/app_icons.dart';

/// ================= NAV ITEM MODEL =================
class BottomNavItem {
  final String label;
  final IconData? icon;
  final String? asset;
  final bool isSvg;

  BottomNavItem({
    required this.label,
    this.icon,
    this.asset,
    this.isSvg = false,
  }) : assert(icon != null || asset != null);
}

/// ================= MAIN SCREEN =================
class MainBottomBarScreenViews extends StatefulWidget {
  const MainBottomBarScreenViews({super.key});

  @override
  State<MainBottomBarScreenViews> createState() => _MainBottomBarScreenViewState();
}

class _MainBottomBarScreenViewState extends State<MainBottomBarScreenViews> {
  int _currentIndex = 0;

  /// 🔹 Dummy screens (replace with your real screens)
  final List<Widget> _screens = [
    MyHomePageViews(),
    MySessionViews(),
    MyLiveViews(),
    EarningViewViews(),
    AccountViews(),
  ];

  /// 🔹 Bottom items
  final List<BottomNavItem> _items = [
    BottomNavItem(label: "Home", icon: Icons.home),
    BottomNavItem(label: "Session", isSvg: true, asset: AppIcons.mens),
    BottomNavItem(label: "Live", isSvg: true, asset: AppIcons.live),
    BottomNavItem(label: "Earnings", icon: Icons.account_balance_wallet),
    BottomNavItem(label: "Account", icon: Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],

      /// ================= BOTTOM BAR =================
      bottomNavigationBar: Container(
        height: 64.h,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Color(0xFFEAEAEA)),
          ),
        ),
        child: Row(
          children: List.generate(
            _items.length,
            (index) => _navItem(
              item: _items[index],
              isSelected: _currentIndex == index,
              onTap: () {
                setState(() => _currentIndex = index);
              },
            ),
          ),
        ),
      ),
    );
  }

  /// ================= NAV ITEM UI =================
  Widget _navItem({
    required BottomNavItem item,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    const activeColor = Color(0xFFB46AF5); // purple
    const inactiveColor = Colors.grey;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// ICON / SVG / IMAGE
            if (item.icon != null)
              Icon(
                item.icon,
                size: 24.sp,
                color: isSelected ? activeColor : inactiveColor,
              )
            else if (item.asset != null && item.isSvg)
              SvgPicture.asset(
                item.asset!,
                width: 24.w,
                height: 24.h,
                color: isSelected ? activeColor : inactiveColor,
              )
            else if (item.asset != null)
              Image.asset(
                item.asset!,
                width: 24.w,
                height: 24.h,
                color: isSelected ? activeColor : inactiveColor,
              ),

            SizedBox(height: 4.h),

            Text(
              item.label,
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
                color: isSelected ? activeColor : inactiveColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
