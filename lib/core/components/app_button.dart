import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final double? fontSize;
  final double? elevation;
  final double? horizontal;
  final double? vertical;
  final double? borderRadius;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? shadowColor;
  final FontWeight? fontWeight;
  final BorderSide? borderSide;
  final VoidCallback onPressed;
  const AppButton(
      {super.key,
      required this.text,
      this.fontSize,
      this.elevation = 4,
      this.horizontal = 120,
      this.vertical = 6,
      this.borderRadius = 10,
      this.textColor = Colors.white,
      this.backgroundColor = Colors.cyan,
      this.shadowColor,
      this.fontWeight,
      this.borderSide = BorderSide.none,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: elevation,
        shadowColor: shadowColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          side: borderSide!,
        ),
        padding:
            EdgeInsets.symmetric(horizontal: horizontal!, vertical: vertical!),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
