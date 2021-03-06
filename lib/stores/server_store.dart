import 'package:craft_panel/models/server.dart';
import 'package:craft_panel/stores/stores.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobx/mobx.dart';
part 'server_store.g.dart';

class ServerStore = _ServerStoreBase with _$ServerStore;

abstract class _ServerStoreBase with Store {
  _ServerStoreBase(String id) {
    setServerId(id);
    _setGame(listServersStore.listServers
        .where((element) => element.serverId == id)
        .first);
  }

  @observable
  var logInfo = ObservableList<String>();

  @computed
  ObservableList<String> get log => logInfo;

  @action
  void addLog(info) {
    if (!logInfo.contains(info)) {
      logInfo.add(info);
    }
  }

  @action
  void clearLog() {
    logInfo.clear();
  }

  @observable
  var serverId = Observable('');

  @action
  void setServerId(String id) {
    serverId.value = id;
  }

  @observable
  var gameServer = Observable<Server?>(null);

  @computed
  Server get game => gameServer.value!;

  @observable
  var online = Observable<bool>(GetStorage().read('view_status') as bool);

  @action
  void swtichStatus() => online.value = !online.value;

  @computed
  bool get isOnline => online.value;

  @action
  void _setGame(Server svs) {
    gameServer.value = svs;
  }
}
