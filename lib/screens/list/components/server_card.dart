import 'package:craft_panel/components/elevated.dart';
import 'package:craft_panel/constants.dart';
import 'package:craft_panel/screens/list/components/detail_server_card_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ServerCard extends StatefulWidget {
  const ServerCard({
    Key? key,
    required this.serverName,
    required this.onClick,
    required this.serverPort,
    required this.serverRam,
    required this.version,
    this.online = false,
  }) : super(key: key);

  final String serverName;
  final int serverPort;
  final int serverRam;
  final String version;
  final bool online;
  final VoidCallback onClick;

  @override
  State<ServerCard> createState() => _ServerCardState();
}

class _ServerCardState extends State<ServerCard> {
  bool hover = false;

  update(enable) {
    setState(() {
      hover = enable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MouseRegion(
          onEnter: (e) => update(true),
          onExit: (e) => update(false),
          child: Elevated(
            borderRadius: BorderRadius.circular(15),
            child: InkWell(
              onTap: widget.onClick,
              child: Container(
                height: 110,
                decoration: BoxDecoration(
                  color: inactiveColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: hover ? textColor : Colors.transparent,
                    width: 1,
                  ),
                ),
                padding: const EdgeInsets.only(
                  top: 8,
                  left: 32,
                  bottom: 8,
                  right: 8,
                ),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.server,
                      color: textColor,
                      size: 32,
                    ),
                    SizedBox(width: 32),
                    Text(
                      widget.serverName,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DetailServerCardItem(
                          icon: FontAwesomeIcons.networkWired,
                          text: '192.168.1.107:${widget.serverPort}',
                          selectable: true,
                        ),
                        DetailServerCardItem(
                          icon: FontAwesomeIcons.memory,
                          text: '${widget.serverRam} MB',
                        ),
                        DetailServerCardItem(
                          icon: FontAwesomeIcons.infoCircle,
                          text: widget.version,
                        ),
                      ],
                    ),
                    SizedBox(width: 32),
                    Container(
                      width: 8,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: widget.online
                            ? Colors.greenAccent
                            : Colors.redAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
