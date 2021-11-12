// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ServerStore on _ServerStoreBase, Store {
  Computed<ObservableList<String>>? _$logComputed;

  @override
  ObservableList<String> get log =>
      (_$logComputed ??= Computed<ObservableList<String>>(() => super.log,
              name: '_ServerStoreBase.log'))
          .value;
  Computed<Server>? _$gameComputed;

  @override
  Server get game => (_$gameComputed ??=
          Computed<Server>(() => super.game, name: '_ServerStoreBase.game'))
      .value;
  Computed<bool>? _$isOnlineComputed;

  @override
  bool get isOnline =>
      (_$isOnlineComputed ??= Computed<bool>(() => super.isOnline,
              name: '_ServerStoreBase.isOnline'))
          .value;

  final _$logInfoAtom = Atom(name: '_ServerStoreBase.logInfo');

  @override
  ObservableList<String> get logInfo {
    _$logInfoAtom.reportRead();
    return super.logInfo;
  }

  @override
  set logInfo(ObservableList<String> value) {
    _$logInfoAtom.reportWrite(value, super.logInfo, () {
      super.logInfo = value;
    });
  }

  final _$serverIdAtom = Atom(name: '_ServerStoreBase.serverId');

  @override
  Observable<String> get serverId {
    _$serverIdAtom.reportRead();
    return super.serverId;
  }

  @override
  set serverId(Observable<String> value) {
    _$serverIdAtom.reportWrite(value, super.serverId, () {
      super.serverId = value;
    });
  }

  final _$gameServerAtom = Atom(name: '_ServerStoreBase.gameServer');

  @override
  Observable<Server?> get gameServer {
    _$gameServerAtom.reportRead();
    return super.gameServer;
  }

  @override
  set gameServer(Observable<Server?> value) {
    _$gameServerAtom.reportWrite(value, super.gameServer, () {
      super.gameServer = value;
    });
  }

  final _$_ServerStoreBaseActionController =
      ActionController(name: '_ServerStoreBase');

  @override
  void addLog(dynamic info) {
    final _$actionInfo = _$_ServerStoreBaseActionController.startAction(
        name: '_ServerStoreBase.addLog');
    try {
      return super.addLog(info);
    } finally {
      _$_ServerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearLog() {
    final _$actionInfo = _$_ServerStoreBaseActionController.startAction(
        name: '_ServerStoreBase.clearLog');
    try {
      return super.clearLog();
    } finally {
      _$_ServerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void switchOnline() {
    final _$actionInfo = _$_ServerStoreBaseActionController.startAction(
        name: '_ServerStoreBase.switchOnline');
    try {
      return super.switchOnline();
    } finally {
      _$_ServerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setServerId(String id) {
    final _$actionInfo = _$_ServerStoreBaseActionController.startAction(
        name: '_ServerStoreBase.setServerId');
    try {
      return super.setServerId(id);
    } finally {
      _$_ServerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _setGame(Server svs) {
    final _$actionInfo = _$_ServerStoreBaseActionController.startAction(
        name: '_ServerStoreBase._setGame');
    try {
      return super._setGame(svs);
    } finally {
      _$_ServerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
logInfo: ${logInfo},
serverId: ${serverId},
gameServer: ${gameServer},
log: ${log},
game: ${game},
isOnline: ${isOnline}
    ''';
  }
}
