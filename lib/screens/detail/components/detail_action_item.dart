import 'package:craft_panel/constants.dart';
import 'package:flutter/material.dart';

class DetailActionItem extends StatefulWidget {
  const DetailActionItem({
    Key? key,
    required this.toolTip,
    required this.icon,
    required this.onClick,
    this.selected = false,
  }) : super(key: key);

  final String toolTip;
  final IconData icon;
  final bool selected;
  final VoidCallback onClick;

  @override
  State<DetailActionItem> createState() => _DetailActionItemState();
}

class _DetailActionItemState extends State<DetailActionItem> {
  bool hover = false;

  update(enable) {
    setState(() {
      hover = enable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => update(true),
      onExit: (e) => update(false),
      child: Column(
        children: [
          Container(
            width: 32,
            height: 45,
            child: InkWell(
              onTap: widget.onClick,
              child: Icon(
                widget.icon,
                size: 18,
                color: widget.selected || hover ? Colors.white : textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
