import 'package:craft_panel/models/server.dart';
import 'package:mobx/mobx.dart';
part 'list_servers_store.g.dart';

class ListServersStore = _ListServersStoreBase with _$ListServersStore;

abstract class _ListServersStoreBase with Store {
  @observable
  var servers = ObservableList<Server>();

  @action
  void addServers(Map<String, dynamic> input) {
    servers.clear();
    var svs = (input['servers'] as List);
    svs.forEach((element) {
      var server = Server.fromJson({
        'serverId': element['server_id'],
        'serverName': element['info']['server_name'],
        'serverPort': element['info']['server_port'],
        'serverVersion': element['info']['server_version'],
        'provider': element['info']['provider'],
        'maxRam': element['info']['max_ram'],
        'isOnline': element['online'],
      });
      servers.add(server);
    });
  }

  @computed
  ObservableList<Server> get listServers => servers;

  bool _containsId(String serverId) {
    if (listServers.isEmpty) return false;
    return listServers.where((element) => element.serverId == serverId).isEmpty;
  }

  @action
  void updateServer(Server server) {
    servers.removeWhere((element) => element.serverId == server.serverId);
    servers.add(server);
  }
}
