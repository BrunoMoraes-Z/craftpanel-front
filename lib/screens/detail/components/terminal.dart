import 'dart:async';

import 'package:craft_panel/components/elevated.dart';
import 'package:craft_panel/components/my_text_field.dart';
import 'package:craft_panel/constants.dart';
import 'package:craft_panel/main.dart';
import 'package:craft_panel/screens/detail/detail_screen.dart';
import 'package:craft_panel/utilities/permission_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_storage/get_storage.dart';

var controller = ScrollController();

void _scroll() {
  if (GetStorage().read('auto_scroll') == null) {
    controller.animateTo(
      controller.position.maxScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}

class Terminal extends StatefulWidget {
  @override
  State<Terminal> createState() => _TerminalState();
}

class _TerminalState extends State<Terminal> {
  Timer timer = Timer.periodic(Duration(seconds: 5), (timer) async {
    if (server != null) await api.getServerLog(server!.game.serverId);
    if (GetStorage().read('server') == null) timer.cancel();
    _scroll();
  });

  @override
  void initState() {
    super.initState();
    if (server != null)
      api.getServerLog(server!.game.serverId).then((value) => print(''));
    if (!timer.isActive) {
      timer = Timer.periodic(Duration(seconds: 5), (timer) async {
        if (server != null) await api.getServerLog(server!.game.serverId);
        if (GetStorage().read('server') == null) timer.cancel();
        _scroll();
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
    Widget prompt = hasPermission('USE_TERMINAL')
        ? Container(
            height: 35,
            width: double.infinity,
            child: Elevated(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                child: MyTextField(
                  'Comando',
                  onSubmit: (v) async {
                    if (v.trim().isNotEmpty) {
                      await api.sendCommand(server!.game.serverId, v);
                      await api.getServerLog(server!.game.serverId);
                      _scroll();
                    }
                  },
                  action: TextInputAction.send,
                  clearOnSubmit: true,
                  textAlign: TextAlign.left,
                  length: 1000,
                  backColor: backgroundColor,
                  cursorColor: textColor,
                ),
              ),
            ),
          )
        : Container();

    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: inactiveColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          child: Column(
            children: [
              prompt,
              Flexible(
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: SingleChildScrollView(
                    controller: controller,
                    child: Observer(
                      builder: (_) {
                        return SelectableText(
                          server != null ? server!.log.join('\n') : '',
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
            ],
          ),
        ),
      ),
    );
  }
}
