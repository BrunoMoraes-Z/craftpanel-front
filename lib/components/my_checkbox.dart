import 'package:craft_panel/components/elevated.dart';
import 'package:craft_panel/constants.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class MyCheckbox extends StatefulWidget {
  const MyCheckbox({
    Key? key,
    required this.label,
    required this.id,
  }) : super(key: key);

  final String label, id;

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  void _update() {
    setState(() {
      if (GetStorage().read(widget.id) == null) {
        GetStorage().write(widget.id, 'false');
      } else {
        GetStorage().remove(widget.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Elevated(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(5),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: inactiveColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(5),
        ),
        child: InkWell(
          onTap: () => _update(),
          child: Row(
            children: [
              Checkbox(
                value: GetStorage().read(widget.id) == null,
                onChanged: (v) => _update(),
                activeColor: activeColor,
                checkColor: backgroundColor,
                hoverColor: Colors.transparent,
              ),
              Text(
                widget.label,
                style: TextStyle(
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
