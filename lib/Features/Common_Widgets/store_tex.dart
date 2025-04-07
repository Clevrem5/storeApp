import 'package:flutter/material.dart';
import 'package:store_app/core/utils/app_colors.dart';

class StoreText extends StatelessWidget {
  const StoreText({
    super.key,
    required this.text,
    required this.color,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.w500,
  });

  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
