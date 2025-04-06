import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/app_colors.dart';

class StoreIcons extends StatelessWidget {
  const StoreIcons({
    super.key,
    required this.icons,
    required this.color,
    this.width = 24.0,
    this.height = 24.0, required this.callback,
  });

  final String icons;
  final Color color;
  final double width;
  final double height;
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: SvgPicture.asset(
        icons,
        color: color,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
