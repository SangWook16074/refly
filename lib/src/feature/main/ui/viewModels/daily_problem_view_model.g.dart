// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_problem_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dailyProblemViewModelHash() =>
    r'c3c9fcbe9a58e6ec6d8ec09c686432c2c8772289';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$DailyProblemViewModel
    extends BuildlessAsyncNotifier<List<ProblemModel>> {
  late final DateTime target;

  FutureOr<List<ProblemModel>> build({
    required DateTime target,
  });
}

/// See also [DailyProblemViewModel].
@ProviderFor(DailyProblemViewModel)
const dailyProblemViewModelProvider = DailyProblemViewModelFamily();

/// See also [DailyProblemViewModel].
class DailyProblemViewModelFamily
    extends Family<AsyncValue<List<ProblemModel>>> {
  /// See also [DailyProblemViewModel].
  const DailyProblemViewModelFamily();

  /// See also [DailyProblemViewModel].
  DailyProblemViewModelProvider call({
    required DateTime target,
  }) {
    return DailyProblemViewModelProvider(
      target: target,
    );
  }

  @override
  DailyProblemViewModelProvider getProviderOverride(
    covariant DailyProblemViewModelProvider provider,
  ) {
    return call(
      target: provider.target,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'dailyProblemViewModelProvider';
}

/// See also [DailyProblemViewModel].
class DailyProblemViewModelProvider extends AsyncNotifierProviderImpl<
    DailyProblemViewModel, List<ProblemModel>> {
  /// See also [DailyProblemViewModel].
  DailyProblemViewModelProvider({
    required DateTime target,
  }) : this._internal(
          () => DailyProblemViewModel()..target = target,
          from: dailyProblemViewModelProvider,
          name: r'dailyProblemViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dailyProblemViewModelHash,
          dependencies: DailyProblemViewModelFamily._dependencies,
          allTransitiveDependencies:
              DailyProblemViewModelFamily._allTransitiveDependencies,
          target: target,
        );

  DailyProblemViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.target,
  }) : super.internal();

  final DateTime target;

  @override
  FutureOr<List<ProblemModel>> runNotifierBuild(
    covariant DailyProblemViewModel notifier,
  ) {
    return notifier.build(
      target: target,
    );
  }

  @override
  Override overrideWith(DailyProblemViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: DailyProblemViewModelProvider._internal(
        () => create()..target = target,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        target: target,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<DailyProblemViewModel, List<ProblemModel>>
      createElement() {
    return _DailyProblemViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DailyProblemViewModelProvider && other.target == target;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, target.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DailyProblemViewModelRef on AsyncNotifierProviderRef<List<ProblemModel>> {
  /// The parameter `target` of this provider.
  DateTime get target;
}

class _DailyProblemViewModelProviderElement
    extends AsyncNotifierProviderElement<DailyProblemViewModel,
        List<ProblemModel>> with DailyProblemViewModelRef {
  _DailyProblemViewModelProviderElement(super.provider);

  @override
  DateTime get target => (origin as DailyProblemViewModelProvider).target;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
