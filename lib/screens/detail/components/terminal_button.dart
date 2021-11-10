// ignore_for_file: must_be_immutable

import 'package:craft_panel/components/elevated.dart';
import 'package:craft_panel/constants.dart';
import 'package:flutter/material.dart';

class TerminalButton extends StatelessWidget {
  TerminalButton({
    Key? key,
    required this.label,
    required this.onClick,
    required this.icon,
    this.enabled = true,
    this.color = Colors.transparent,
  }) : super(key: key);

  final String label;
  final VoidCallback? onClick;
  final IconData icon;
  final bool enabled;
  late Color? color;

  @override
  Widget build(BuildContext context) {
    if (color == Colors.transparent) {
      color = Colors.green[400];
    }
    return FittedBox(
      child: Elevated(
        borderRadius: BorderRadius.circular(5),
        child: InkWell(
          mouseCursor: !enabled ? MouseCursor.uncontrolled : null,
          onTap: enabled ? onClick : null,
          borderRadius: BorderRadius.circular(5),
          child: Container(
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: color,
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: backgroundColor,
                  size: 16,
                ),
                SizedBox(width: 16),
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: backgroundColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}