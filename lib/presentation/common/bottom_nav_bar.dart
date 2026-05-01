import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    int currentIndex = 0;
    if (location == '/monthly') currentIndex = 1;
    if (location == '/yearly') currentIndex = 2;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == 0) context.go('/');
        if (index == 1) context.go('/monthly');
        if (index == 2) context.go('/yearly');
      },
      selectedItemColor: AppColors.coral,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.check_circle_outline),
          label: 'Today',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: 'Monthly',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view),
          label: 'Yearly',
        ),
      ],
    );
  }
}
