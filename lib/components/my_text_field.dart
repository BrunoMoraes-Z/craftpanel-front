// ignore_for_file: must_be_immutable

import 'package:craft_panel/constants.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  MyTextField(
    this.hint, {
    this.onChange = null,
    this.onSubmit = null,
    this.text = '',
    this.obscure = false,
    this.clearOnSubmit = false,
    this.width = 250,
    this.height = 35,
    this.length = 20,
    this.action = TextInputAction.next,
    this.decoration = null,
    this.style = null,
    this.messageColor = null,
    this.backColor = null,
    this.cursorColor = null,
    this.textAlign = TextAlign.center,
  }) {
    if (messageColor == null) {
      messageColor = textColor;
    }
    if (backColor == null) {
      backColor = inactiveColor;
    }
    if (cursorColor == null) {
      cursorColor = backgroundColor;
    }
    if (this.style == null) {
      this.style = TextStyle(
        color: messageColor,
      );
    }
    if (this.decoration == null) {
      this.decoration = BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.circular(5),
      );
    }
  }

  final bool obscure, clearOnSubmit;
  final double height, width;
  late Decoration? decoration;
  late TextStyle? style;
  final int length;
  final TextInputAction action;
  late String hint, text;
  final TextAlign textAlign;
  late Function(String)? onChange;
  late Function(String)? onSubmit;
  late Color? messageColor, backColor, cursorColor;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late bool visible = false;

  FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: widget.decoration,
      child: TextField(
        controller: TextEditingController(
          text: widget.text,
        ),
        obscureText: widget.obscure,
        style: widget.style,
        textAlign: widget.textAlign,
        autocorrect: false,
        cursorColor: widget.cursorColor,
        maxLines: 1,
        maxLength: widget.length,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,
        focusNode: myFocusNode,
        onChanged: widget.onChange,
        autofocus: true,
        onSubmitted: widget.onSubmit != null
            ? (v) {
                if (widget.clearOnSubmit) {
                  setState(() {
                    widget.text = '';
                  });
                }
                widget.onSubmit!(v);
                myFocusNode.requestFocus();
              }
            : (v) {},
        decoration: InputDecoration(
          suffixIcon: null,
          hintText: widget.hint,
          hintStyle: TextStyle(
            color: widget.messageColor,
          ),
          contentPadding: const EdgeInsets.only(bottom: 15, left: 5, right: 5),
          border: InputBorder.none,
          counterText: "",
        ),
      ),
    );
  }
}
