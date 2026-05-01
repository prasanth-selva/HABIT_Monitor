import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_provider.dart';
import 'core/router/app_router.dart';
import 'data/datasources/local_datasource.dart';
import 'data/models/habit_model.dart';
import 'data/models/completion_model.dart';
import 'presentation/providers/habit_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  
  Hive.registerAdapter(HabitModelAdapter());
  Hive.registerAdapter(CompletionModelAdapter());

  final localDataSource = LocalDataSource();
  await localDataSource.init();

  runApp(
    ProviderScope(
      overrides: [
        localDataSourceProvider.overrideWithValue(localDataSource),
      ],
      child: const StreaklyApp(),
    ),
  );
}

class StreaklyApp extends ConsumerWidget {
  const StreaklyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appThemeModeProvider);
    return MaterialApp.router(
      title: 'Streakly',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: themeMode,
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
