import 'package:craft_panel/constants.dart';
import 'package:craft_panel/enums/detail_type.dart';
import 'package:craft_panel/screens/detail/components/detail_action_item.dart';
import 'package:craft_panel/screens/detail/components/terminal_button.dart';
import 'package:craft_panel/stores/stores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                          TerminalButton(
                            label: 'Iniciar',
                            icon: FontAwesomeIcons.play,
                            onClick: () {},
                          ),
                          SizedBox(width: 8),
                          TerminalButton(
                            label: 'Matar',
                            icon: FontAwesomeIcons.skull,
                            onClick: () {},
                            enabled: false,
                            color: Colors.red,
                          ),
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
