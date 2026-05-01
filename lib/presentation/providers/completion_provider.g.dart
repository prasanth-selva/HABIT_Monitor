// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completion_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$completionRepositoryHash() =>
    r'32f25ac5b02878647ca9b4370d6176d85aeb8060';

/// See also [completionRepository].
@ProviderFor(completionRepository)
final completionRepositoryProvider = Provider<CompletionRepository>.internal(
  completionRepository,
  name: r'completionRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$completionRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CompletionRepositoryRef = ProviderRef<CompletionRepository>;
String _$completionNotifierHash() =>
    r'ebac1f8499e632dfb46dd222e4ca5000b344d672';

/// See also [CompletionNotifier].
@ProviderFor(CompletionNotifier)
final completionNotifierProvider = AutoDisposeNotifierProvider<
    CompletionNotifier, Map<String, Map<String, bool>>>.internal(
  CompletionNotifier.new,
  name: r'completionNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$completionNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CompletionNotifier
    = AutoDisposeNotifier<Map<String, Map<String, bool>>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
