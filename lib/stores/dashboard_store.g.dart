// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DashboardStore on _DashboardStoreBase, Store {
  Computed<ScreenType>? _$getScreenTypeComputed;

  @override
  ScreenType get getScreenType => (_$getScreenTypeComputed ??=
          Computed<ScreenType>(() => super.getScreenType,
              name: '_DashboardStoreBase.getScreenType'))
      .value;
  Computed<String>? _$nameComputed;

  @override
  String get name => (_$nameComputed ??=
          Computed<String>(() => super.name, name: '_DashboardStoreBase.name'))
      .value;

  final _$screenTypeAtom = Atom(name: '_DashboardStoreBase.screenType');

  @override
  Observable<ScreenType> get screenType {
    _$screenTypeAtom.reportRead();
    return super.screenType;
  }

  @override
  set screenType(Observable<ScreenType> value) {
    _$screenTypeAtom.reportWrite(value, super.screenType, () {
      super.screenType = value;
    });
  }

  final _$serverNameAtom = Atom(name: '_DashboardStoreBase.serverName');

  @override
  Observable<String> get serverName {
    _$serverNameAtom.reportRead();
    return super.serverName;
  }

  @override
  set serverName(Observable<String> value) {
    _$serverNameAtom.reportWrite(value, super.serverName, () {
      super.serverName = value;
    });
  }

  final _$_DashboardStoreBaseActionController =
      ActionController(name: '_DashboardStoreBase');

  @override
  void toggle(ScreenType type) {
    final _$actionInfo = _$_DashboardStoreBaseActionController.startAction(
        name: '_DashboardStoreBase.toggle');
    try {
      return super.toggle(type);
    } finally {
      _$_DashboardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setServerName(String serverName) {
    final _$actionInfo = _$_DashboardStoreBaseActionController.startAction(
        name: '_DashboardStoreBase.setServerName');
    try {
      return super.setServerName(serverName);
    } finally {
      _$_DashboardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
screenType: ${screenType},
serverName: ${serverName},
getScreenType: ${getScreenType},
name: ${name}
    ''';
  }
}
