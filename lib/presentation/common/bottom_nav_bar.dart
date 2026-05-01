import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();

    int currentIndex = 0;
    if (location == '/') currentIndex = 0;
    if (location == '/mood') currentIndex = 1;
    // index 2 is FAB
    if (location == '/finance') currentIndex = 3;
    if (location == '/statistics') currentIndex = 4;

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(context, icon: Icons.calendar_today, label: 'Today', index: 0, currentIndex: currentIndex, route: '/'),
          _buildNavItem(context, icon: Icons.emoji_emotions, label: 'Moods', index: 1, currentIndex: currentIndex, route: '/mood'),
          const SizedBox(width: 48), // Space for FAB
          _buildNavItem(context, icon: Icons.account_balance_wallet, label: 'Finance', index: 3, currentIndex: currentIndex, route: '/finance'),
          _buildNavItem(context, icon: Icons.bar_chart, label: 'Statistics', index: 4, currentIndex: currentIndex, route: '/statistics'),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, {
    required IconData icon,
    required String label,
    required int index,
    required int currentIndex,
    required String route,
  }) {
    final isSelected = index == currentIndex;
    final color = isSelected ? AppColors.primary : AppColors.textSecondary;

    return InkWell(
      onTap: () => context.go(route),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Text(label, style: TextStyle(color: color, fontSize: 10, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
