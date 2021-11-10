import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  var server = Observable('');

  @action
  void setServer(String server) {
    this.server.value = server;
  }

  @observable
  var username = Observable('');

  @action
  void setUsername(String username) {
    this.username.value = username;
  }

  @observable
  var password = Observable('');

  @action
  void setPassword(String password) {
    this.password.value = password;
  }

  @computed
  bool get isFilled =>
      server.value.trim().isNotEmpty &&
      username.value.trim().isNotEmpty &&
      password.value.trim().isNotEmpty;
}
