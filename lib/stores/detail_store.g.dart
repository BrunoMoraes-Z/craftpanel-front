// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailStore on _DetailStoreBase, Store {
  Computed<DetailType>? _$seletedComputed;

  @override
  DetailType get seleted =>
      (_$seletedComputed ??= Computed<DetailType>(() => super.seleted,
              name: '_DetailStoreBase.seleted'))
          .value;

  final _$detailTypeAtom = Atom(name: '_DetailStoreBase.detailType');

  @override
  Observable<DetailType> get detailType {
    _$detailTypeAtom.reportRead();
    return super.detailType;
  }

  @override
  set detailType(Observable<DetailType> value) {
    _$detailTypeAtom.reportWrite(value, super.detailType, () {
      super.detailType = value;
    });
  }

  final _$_DetailStoreBaseActionController =
      ActionController(name: '_DetailStoreBase');

  @override
  void toggle(DetailType detail) {
    final _$actionInfo = _$_DetailStoreBaseActionController.startAction(
        name: '_DetailStoreBase.toggle');
    try {
      return super.toggle(detail);
    } finally {
      _$_DetailStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
detailType: ${detailType},
seleted: ${seleted}
    ''';
  }
}
