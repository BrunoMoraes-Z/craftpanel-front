import 'dart:async';

import 'package:craft_panel/components/elevated.dart';
import 'package:craft_panel/constants.dart';
import 'package:craft_panel/main.dart';
import 'package:craft_panel/stores/server_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_storage/get_storage.dart';

final server = ServerStore(GetStorage().read('view'));

class Terminal extends StatefulWidget {
  @override
  State<Terminal> createState() => _TerminalState();
}

class _TerminalState extends State<Terminal> {
  Timer timer = Timer.periodic(Duration(seconds: 5), (timer) async {
    await api.getServerLog(server.game.serverId);
  });

  @override
  void initState() {
    super.initState();
    if (!timer.isActive) {
      timer = Timer.periodic(Duration(seconds: 5), (timer) async {
        await api.getServerLog(server.game.serverId);
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
    return Expanded(
      child: Elevated(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
            color: inactiveColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Observer(
              builder: (_) {
                return SelectableText(
                  server.log.join('\n'),
                  cursorColor: backgroundColor,
                  style: TextStyle(
                    color: textColor,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
