// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problem_update_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$problemUpdateViewModelHash() =>
    r'97787844035c8549c0a42fd606c488b7ad7b5041';

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

abstract class _$ProblemUpdateViewModel
    extends BuildlessAutoDisposeNotifier<ProblemUpdateViewState> {
  late final ProblemModel problem;

  ProblemUpdateViewState build(
    ProblemModel problem,
  );
}

/// See also [ProblemUpdateViewModel].
@ProviderFor(ProblemUpdateViewModel)
const problemUpdateViewModelProvider = ProblemUpdateViewModelFamily();

/// See also [ProblemUpdateViewModel].
class ProblemUpdateViewModelFamily extends Family<ProblemUpdateViewState> {
  /// See also [ProblemUpdateViewModel].
  const ProblemUpdateViewModelFamily();

  /// See also [ProblemUpdateViewModel].
  ProblemUpdateViewModelProvider call(
    ProblemModel problem,
  ) {
    return ProblemUpdateViewModelProvider(
      problem,
    );
  }

  @override
  ProblemUpdateViewModelProvider getProviderOverride(
    covariant ProblemUpdateViewModelProvider provider,
  ) {
    return call(
      provider.problem,
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
  String? get name => r'problemUpdateViewModelProvider';
}

/// See also [ProblemUpdateViewModel].
class ProblemUpdateViewModelProvider extends AutoDisposeNotifierProviderImpl<
    ProblemUpdateViewModel, ProblemUpdateViewState> {
  /// See also [ProblemUpdateViewModel].
  ProblemUpdateViewModelProvider(
    ProblemModel problem,
  ) : this._internal(
          () => ProblemUpdateViewModel()..problem = problem,
          from: problemUpdateViewModelProvider,
          name: r'problemUpdateViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$problemUpdateViewModelHash,
          dependencies: ProblemUpdateViewModelFamily._dependencies,
          allTransitiveDependencies:
              ProblemUpdateViewModelFamily._allTransitiveDependencies,
          problem: problem,
        );

  ProblemUpdateViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.problem,
  }) : super.internal();

  final ProblemModel problem;

  @override
  ProblemUpdateViewState runNotifierBuild(
    covariant ProblemUpdateViewModel notifier,
  ) {
    return notifier.build(
      problem,
    );
  }

  @override
  Override overrideWith(ProblemUpdateViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProblemUpdateViewModelProvider._internal(
        () => create()..problem = problem,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        problem: problem,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ProblemUpdateViewModel,
      ProblemUpdateViewState> createElement() {
    return _ProblemUpdateViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProblemUpdateViewModelProvider && other.problem == problem;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, problem.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProblemUpdateViewModelRef
    on AutoDisposeNotifierProviderRef<ProblemUpdateViewState> {
  /// The parameter `problem` of this provider.
  ProblemModel get problem;
}

class _ProblemUpdateViewModelProviderElement
    extends AutoDisposeNotifierProviderElement<ProblemUpdateViewModel,
        ProblemUpdateViewState> with ProblemUpdateViewModelRef {
  _ProblemUpdateViewModelProviderElement(super.provider);

  @override
  ProblemModel get problem =>
      (origin as ProblemUpdateViewModelProvider).problem;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
