import 'package:craft_panel/constants.dart';
import 'package:flutter/material.dart';

class LateralButton extends StatefulWidget {
  const LateralButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onClick,
    this.focused = false,
  }) : super(key: key);

  final IconData icon;
  final bool focused;
  final String text;
  final VoidCallback onClick;

  @override
  State<LateralButton> createState() => _LateralButtonState();
}

class _LateralButtonState extends State<LateralButton> {
  bool hover = false;

  update(bool enter) {
    setState(() {
      hover = enter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => update(true),
      onExit: (e) => update(false),
      child: Container(
        // padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.focused || hover ? inactiveColor : null,
        ),
        child: InkWell(
          onTap: widget.onClick,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: widget.focused || hover ? activeColor : inactiveColor,
                ),
                child: Icon(
                  widget.icon,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              SizedBox(width: 16),
              Text(
                widget.text,
                style: TextStyle(
                  fontSize: 17,
                  color: widget.focused || hover ? Colors.white : textColor,
                  fontWeight: widget.focused || hover
                      ? FontWeight.w600
                      : FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
