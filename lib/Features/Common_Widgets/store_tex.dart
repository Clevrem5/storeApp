import 'package:flutter/material.dart';

class StoreText extends StatelessWidget {
  const StoreText({
    super.key,
    required this.text,
    required this.color,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.w500,
    this.height=1,
    this.line=4,
  });

  final String text;
  final Color color;
  final double fontSize,height;
  final int line;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: line,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
