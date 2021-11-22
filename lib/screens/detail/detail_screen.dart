import 'package:craft_panel/components/my_checkbox.dart';
import 'package:craft_panel/constants.dart';
import 'package:craft_panel/enums/detail_type.dart';
import 'package:craft_panel/main.dart';
import 'package:craft_panel/screens/detail/components/detail_action_item.dart';
import 'package:craft_panel/screens/detail/components/terminal_button.dart';
import 'package:craft_panel/stores/server_store.dart';
import 'package:craft_panel/stores/stores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';

ServerStore? server;

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    server = ServerStore(GetStorage().read('view'));
    if (server!.isOnline) {
      server!.swtichStatus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: MediaQuery.of(context).size.height - 250,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Observer(builder: (_) {
                        return DetailActionItem(
                          icon: FontAwesomeIcons.terminal,
                          toolTip: 'Terminal',
                          selected: detailStore.seleted == DetailType.TERMINAL,
                          onClick: () {
                            if (detailStore.seleted != DetailType.TERMINAL) {
                              detailStore.toggle(DetailType.TERMINAL);
                            }
                          },
                        );
                      }),
                      SizedBox(width: 16),
                      Observer(builder: (_) {
                        return DetailActionItem(
                          icon: Icons.settings,
                          toolTip: 'Configurações',
                          selected:
                              detailStore.seleted == DetailType.CONFIGURATION,
                          onClick: () {
                            if (detailStore.seleted !=
                                DetailType.CONFIGURATION) {
                              detailStore.toggle(DetailType.CONFIGURATION);
                            }
                          },
                        );
                      }),
                    ],
                  ),
                ],
              ),
              Observer(builder: (_) {
                return detailStore.seleted == DetailType.TERMINAL
                    ? Row(
                        children: [
                          MyCheckbox(
                            label: 'Auto Scroll',
                            id: 'auto_scroll',
                          ),
                          SizedBox(width: 24),
                          Observer(builder: (_) {
                            return TerminalButton(
                              label: server != null && server!.online.value
                                  ? 'Desligar'
                                  : 'Iniciar',
                              icon: FontAwesomeIcons.play,
                              color: server != null && server!.online.value
                                  ? Colors.redAccent
                                  : Colors.greenAccent,
                              onClick: () async {
                                if (server != null) {
                                  if (server!.online.value) {
                                    await api.stopServer(server!.game.serverId);
                                  } else {
                                    await api
                                        .startServer(server!.game.serverId);
                                  }
                                }
                              },
                            );
                          }),
                          SizedBox(width: 8),
                          Observer(builder: (_) {
                            return TerminalButton(
                              label: 'Matar',
                              icon: FontAwesomeIcons.skull,
                              enabled: server!.online.value,
                              color: Colors.red,
                              onClick: () async {
                                await api.killServer(server!.game.serverId);
                              },
                            );
                          }),
                        ],
                      )
                    : Container();
              }),
            ],
          ),
          Divider(
            color: inactiveColor,
          ),
          SizedBox(height: 8),
          Observer(
            builder: (_) {
              return detailStore.buildState();
            },
          ),
        ],
      ),
    );
  }
}
