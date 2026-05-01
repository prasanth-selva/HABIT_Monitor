import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/common/app_scaffold.dart';
import '../../presentation/screens/home/home_screen.dart';
import '../../presentation/screens/monthly/monthly_screen.dart';
import '../../presentation/screens/yearly/yearly_screen.dart';
import '../../presentation/screens/settings/settings_screen.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return AppScaffold(child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/monthly',
            builder: (context, state) => const MonthlyScreen(),
          ),
          GoRoute(
            path: '/yearly',
            builder: (context, state) => const YearlyScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
}
