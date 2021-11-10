import 'package:craft_panel/constants.dart';
import 'package:flutter/material.dart';

class DetailServerCardItem extends StatelessWidget {
  const DetailServerCardItem({
    Key? key,
    required this.icon,
    required this.text,
    this.selectable = false,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final bool selectable;

  @override
  Widget build(BuildContext context) {
    Widget item = selectable
        ? SelectableText(
            text,
            style: TextStyle(
              fontSize: 15,
              color: textColor,
            ),
            cursorColor: backgroundColor,
            maxLines: 1,
          )
        : Text(
            text,
            style: TextStyle(
              fontSize: 15,
              color: textColor,
            ),
            maxLines: 1,
          );
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 5,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 14,
            color: textColor,
          ),
          SizedBox(width: 12),
          item,
        ],
      ),
    );
  }
}
