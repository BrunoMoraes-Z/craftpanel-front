import 'dart:convert';

import 'package:craft_panel/screens/detail/components/terminal.dart';
import 'package:craft_panel/stores/server_store.dart';
import 'package:craft_panel/stores/stores.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class Api {
  // Realizar login
  Future<bool> login({
    required String server,
    required String username,
    required String password,
  }) async {
    await GetStorage().write('server', server);
    await GetStorage().save();

    Map<String, dynamic> body = {
      'username': username,
      'password': password,
    };

    try {
      var response = await http.post(
        Uri.parse('$server/auth/session'),
        body: json.encode(body),
      );

      body = json.decode(response.body);

      if (response.statusCode == 200) {
        await GetStorage().write('token', body['Authorization']);
        await GetStorage().write('permissions', body['perms']);
        await GetStorage().save();
        return true;
      }
      await GetStorage().write('error', body['message']);
    } catch (e) {
      await GetStorage().write('error', 'Não foi possível efetuar login.');
    }

    return false;
  }

  Future<bool> listServers() async {
    Map<String, String> head = {
      'Authorization': GetStorage().read('token'),
    };
    try {
      var response = await http.get(
        Uri.parse('${GetStorage().read("server")}/server/'),
        headers: head,
      );

      var body = json.decode(response.body);

      if ((body['servers'] as List).isNotEmpty) {
        listServersStore.addServers(body);
      } else {
        await GetStorage()
            .write('list', 'Nenhum servidor criado até o momento.');
      }
    } catch (e) {
      await GetStorage()
          .write('list', 'Ouve algum erro ao tentar listar os servidores.');
      return false;
    }

    return false;
  }

  Future<void> getServerLog(String serverId) async {
    Map<String, String> head = {
      'Authorization': GetStorage().read('token'),
    };
    try {
      var response = await http.get(
        Uri.parse('${GetStorage().read("server")}/action/$serverId/log'),
        headers: head,
      );

      var body = json.decode(response.body);

      if (response.statusCode == 200) {
        List.of(body['logs']).forEach((element) {
          server.addLog(element);
        });
      }
    } catch (e) {
      await GetStorage()
          .write('list', 'Ouve algum erro ao tentar listar os servidores.');
    }
  }

  Future<void> getServerConfig(String serverId) async {
    Map<String, String> head = {
      'Authorization': GetStorage().read('token'),
    };
    try {
      var response = await http.get(
        Uri.parse('${GetStorage().read("server")}/action/$serverId/log'),
        headers: head,
      );

      var body = json.decode(response.body);

      if (response.statusCode == 200) {
        List.of(body['logs']).forEach((element) {
          server.addLog(element);
        });
      }
    } catch (e) {
      await GetStorage()
          .write('list', 'Ouve algum erro ao tentar listar os servidores.');
    }
  }
}
