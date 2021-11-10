// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_servers_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListServersStore on _ListServersStoreBase, Store {
  Computed<ObservableList<Server>>? _$listServersComputed;

  @override
  ObservableList<Server> get listServers => (_$listServersComputed ??=
          Computed<ObservableList<Server>>(() => super.listServers,
              name: '_ListServersStoreBase.listServers'))
      .value;

  final _$serversAtom = Atom(name: '_ListServersStoreBase.servers');

  @override
  ObservableList<Server> get servers {
    _$serversAtom.reportRead();
    return super.servers;
  }

  @override
  set servers(ObservableList<Server> value) {
    _$serversAtom.reportWrite(value, super.servers, () {
      super.servers = value;
    });
  }

  final _$_ListServersStoreBaseActionController =
      ActionController(name: '_ListServersStoreBase');

  @override
  void addServers(Map<String, dynamic> input) {
    final _$actionInfo = _$_ListServersStoreBaseActionController.startAction(
        name: '_ListServersStoreBase.addServers');
    try {
      return super.addServers(input);
    } finally {
      _$_ListServersStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateServer(Server server) {
    final _$actionInfo = _$_ListServersStoreBaseActionController.startAction(
        name: '_ListServersStoreBase.updateServer');
    try {
      return super.updateServer(server);
    } finally {
      _$_ListServersStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
servers: ${servers},
listServers: ${listServers}
    ''';
  }
}
