import 'package:flutter/material.dart';

class Elevated extends StatelessWidget {
  const Elevated({
    Key? key,
    required this.child,
    this.type = MaterialType.canvas,
    this.elevation = 10,
    this.color,
    this.shadowColor,
    this.textStyle,
    this.borderRadius,
    this.shape,
    this.borderOnForeground = true,
    this.clipBehavior = Clip.none,
    this.animationDuration = kThemeChangeDuration,
  }) : super(key: key);

  final Widget child;
  final double elevation;
  final MaterialType type;
  final Color? color, shadowColor;
  final TextStyle? textStyle;
  final BorderRadiusGeometry? borderRadius;
  final ShapeBorder? shape;
  final bool borderOnForeground;
  final Clip clipBehavior;
  final Duration animationDuration;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: child,
      elevation: elevation,
      type: type,
      color: color,
      shadowColor: shadowColor,
      textStyle: textStyle,
      borderRadius: borderRadius,
      shape: shape,
      borderOnForeground: borderOnForeground,
      clipBehavior: clipBehavior,
      animationDuration: animationDuration,
      key: key,
    );
  }
}
