import 'dart:async';

import 'package:craft_panel/enums/screen_type.dart';
import 'package:craft_panel/main.dart';
import 'package:craft_panel/screens/list/components/server_card.dart';
import 'package:craft_panel/stores/stores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_storage/get_storage.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late Timer timer = Timer.periodic(Duration(seconds: 10), (timer) async {
    await api.listServers();
    if (GetStorage().read('server') == null) timer.cancel();
  });

  @override
  void initState() {
    super.initState();
    // if (listServersStore.listServers.isEmpty) {
    //   api.listServers().then((value) => print(value));
    // }
    api.listServers().then((value) => print(value));
    if (!timer.isActive) {
      Timer.periodic(Duration(seconds: 10), (timer) async {
        await api.listServers();
        if (GetStorage().read('server') == null) timer.cancel();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (timer.isActive) {
      timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: Observer(
        builder: (_) {
          return Column(
            children: listServersStore.servers.map(
              (element) {
                return ServerCard(
                  serverName: element.serverName,
                  onClick: () async {
                    dashStore.toggle(ScreenType.DETAIL_SERVER);
                    dashStore.setServerName(element.serverName);
                    await GetStorage().write('view', element.serverId);
                    await GetStorage().write('view_status', element.isOnline);
                  },
                  serverPort: element.serverPort,
                  serverRam: element.maxRam,
                  version: element.serverVersion,
                  online: element.isOnline,
                );
              },
            ).toList(),
          );
        },
      ),
    );
  }
}
