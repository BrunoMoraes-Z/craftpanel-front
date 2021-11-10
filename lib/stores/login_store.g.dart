// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  Computed<bool>? _$isFilledComputed;

  @override
  bool get isFilled =>
      (_$isFilledComputed ??= Computed<bool>(() => super.isFilled,
              name: '_LoginStoreBase.isFilled'))
          .value;

  final _$serverAtom = Atom(name: '_LoginStoreBase.server');

  @override
  Observable<String> get server {
    _$serverAtom.reportRead();
    return super.server;
  }

  @override
  set server(Observable<String> value) {
    _$serverAtom.reportWrite(value, super.server, () {
      super.server = value;
    });
  }

  final _$usernameAtom = Atom(name: '_LoginStoreBase.username');

  @override
  Observable<String> get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(Observable<String> value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginStoreBase.password');

  @override
  Observable<String> get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(Observable<String> value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase');

  @override
  void setServer(String server) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setServer');
    try {
      return super.setServer(server);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUsername(String username) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setUsername');
    try {
      return super.setUsername(username);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String password) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setPassword');
    try {
      return super.setPassword(password);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
server: ${server},
username: ${username},
password: ${password},
isFilled: ${isFilled}
    ''';
  }
}
