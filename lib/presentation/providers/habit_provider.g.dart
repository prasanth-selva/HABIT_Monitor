// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$localDataSourceHash() => r'1ac051b7b0a5c61ae720dd35f57d6695125760d0';

/// See also [localDataSource].
@ProviderFor(localDataSource)
final localDataSourceProvider = Provider<LocalDataSource>.internal(
  localDataSource,
  name: r'localDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$localDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocalDataSourceRef = ProviderRef<LocalDataSource>;
String _$habitRepositoryHash() => r'744f700a52ccaa73c4e4d248f5a56e9ca6058185';

/// See also [habitRepository].
@ProviderFor(habitRepository)
final habitRepositoryProvider = Provider<HabitRepository>.internal(
  habitRepository,
  name: r'habitRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$habitRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HabitRepositoryRef = ProviderRef<HabitRepository>;
String _$habitNotifierHash() => r'251e79fcb0ec0a5a5fd5ab0a0294023376c1895e';

/// See also [HabitNotifier].
@ProviderFor(HabitNotifier)
final habitNotifierProvider =
    AutoDisposeNotifierProvider<HabitNotifier, List<Habit>>.internal(
  HabitNotifier.new,
  name: r'habitNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$habitNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HabitNotifier = AutoDisposeNotifier<List<Habit>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
