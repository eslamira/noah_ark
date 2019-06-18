import 'package:flutter/material.dart';

class NoahContainer extends StatelessWidget {
  final double maxWidth;
  final double maxHeight;
  final double width;
  final double height;
  final double fontSize;
  final String text;
  final Widget child;
  final String fontFamily;
  final Color backgroundColor;
  final Color textColor;
  final FontWeight fontWeight;
  final VoidCallback onTap;

  const NoahContainer({
    Key key,
    this.maxWidth,
    this.maxHeight,
    this.width,
    this.height,
    this.text,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.fontFamily,
    this.fontWeight,
    this.child,
    this.onTap,
  })  : assert(child != null || text != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // Child Widget, might be text or child and most common to be child;
    Widget childWidget;

    if (child != null) {
      childWidget = child;
    } else {
      childWidget = FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          "$text",
          textScaleFactor: 1.0,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontWeight: fontWeight ?? FontWeight.normal,
            fontSize: fontSize ?? 14,
            fontFamily: fontFamily ?? "Hacen",
          ),
        ),
      );
    }

    // Our Widget
    Widget finalWidget = SizedBox(
      width: maxWidth ?? MediaQuery.of(context).size.width * 0.25,
      height: maxHeight ?? MediaQuery.of(context).size.height * 0.06,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width * 0.15,
        height: height ?? MediaQuery.of(context).size.height * 0.03,
        decoration: BoxDecoration(
          color: backgroundColor ?? Color(0xFF6D6DFF),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        alignment: Alignment.center,
        child: childWidget,
      ),
    );

    // adding Tab Feature
    if (onTap != null) {
      finalWidget = InkWell(
        onTap: onTap,
        child: finalWidget,
      );
    }

    return finalWidget;
  }
}
