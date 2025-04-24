// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problem_list_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$problemListViewModelHash() =>
    r'f24bcae9383cc861360a315dcc0f958c5b6ba342';

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

abstract class _$ProblemListViewModel
    extends BuildlessAutoDisposeNotifier<ProblemListViewState> {
  late final String listId;

  ProblemListViewState build({
    required String listId,
  });
}

/// See also [ProblemListViewModel].
@ProviderFor(ProblemListViewModel)
const problemListViewModelProvider = ProblemListViewModelFamily();

/// See also [ProblemListViewModel].
class ProblemListViewModelFamily extends Family<ProblemListViewState> {
  /// See also [ProblemListViewModel].
  const ProblemListViewModelFamily();

  /// See also [ProblemListViewModel].
  ProblemListViewModelProvider call({
    required String listId,
  }) {
    return ProblemListViewModelProvider(
      listId: listId,
    );
  }

  @override
  ProblemListViewModelProvider getProviderOverride(
    covariant ProblemListViewModelProvider provider,
  ) {
    return call(
      listId: provider.listId,
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
  String? get name => r'problemListViewModelProvider';
}

/// See also [ProblemListViewModel].
class ProblemListViewModelProvider extends AutoDisposeNotifierProviderImpl<
    ProblemListViewModel, ProblemListViewState> {
  /// See also [ProblemListViewModel].
  ProblemListViewModelProvider({
    required String listId,
  }) : this._internal(
          () => ProblemListViewModel()..listId = listId,
          from: problemListViewModelProvider,
          name: r'problemListViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$problemListViewModelHash,
          dependencies: ProblemListViewModelFamily._dependencies,
          allTransitiveDependencies:
              ProblemListViewModelFamily._allTransitiveDependencies,
          listId: listId,
        );

  ProblemListViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.listId,
  }) : super.internal();

  final String listId;

  @override
  ProblemListViewState runNotifierBuild(
    covariant ProblemListViewModel notifier,
  ) {
    return notifier.build(
      listId: listId,
    );
  }

  @override
  Override overrideWith(ProblemListViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProblemListViewModelProvider._internal(
        () => create()..listId = listId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        listId: listId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ProblemListViewModel, ProblemListViewState>
      createElement() {
    return _ProblemListViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProblemListViewModelProvider && other.listId == listId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, listId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProblemListViewModelRef
    on AutoDisposeNotifierProviderRef<ProblemListViewState> {
  /// The parameter `listId` of this provider.
  String get listId;
}

class _ProblemListViewModelProviderElement
    extends AutoDisposeNotifierProviderElement<ProblemListViewModel,
        ProblemListViewState> with ProblemListViewModelRef {
  _ProblemListViewModelProviderElement(super.provider);

  @override
  String get listId => (origin as ProblemListViewModelProvider).listId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
