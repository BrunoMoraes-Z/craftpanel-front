import 'package:craft_panel/constants.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.onClick,
    required this.text,
    this.color = activeColor,
    this.enabled = true,
  }) : super(key: key);

  final VoidCallback onClick;
  final String text;
  final bool enabled;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: enabled ? onClick : null,
        borderRadius: BorderRadius.circular(5),
        child: Container(
          decoration: BoxDecoration(
            color: enabled ? color : Colors.blueGrey[100],
            borderRadius: BorderRadius.circular(5),
          ),
          width: 250,
          height: 45,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
