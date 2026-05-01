import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/common/app_scaffold.dart';
import '../../presentation/screens/home/home_screen.dart';
import '../../presentation/screens/monthly/monthly_screen.dart';
import '../../presentation/screens/yearly/yearly_screen.dart';
import '../../presentation/screens/settings/settings_screen.dart';

class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text(title)), body: Center(child: Text(title)));
}

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
            path: '/mood',
            builder: (context, state) => const PlaceholderScreen(title: 'Moods'),
          ),
          GoRoute(
            path: '/finance',
            builder: (context, state) => const PlaceholderScreen(title: 'Finance'),
          ),
          GoRoute(
            path: '/statistics',
            builder: (context, state) => const YearlyScreen(), // Map to existing statistics screen
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
