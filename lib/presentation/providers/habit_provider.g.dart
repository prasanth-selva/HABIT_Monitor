// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$localDataSourceHash() => r'd901662c8452423f883231f64786eea18beed6d9';

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
String _$habitNotifierHash() => r'179bdb6e7bca3ae1dd2b503312d4c8efcdc51747';

/// See also [HabitNotifier].
@ProviderFor(HabitNotifier)
final habitNotifierProvider =
    AutoDisposeNotifierProvider<HabitNotifier, List<HabitModel>>.internal(
  HabitNotifier.new,
  name: r'habitNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$habitNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HabitNotifier = AutoDisposeNotifier<List<HabitModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
