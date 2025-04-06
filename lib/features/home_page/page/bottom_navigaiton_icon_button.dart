import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/app_colors.dart';

class BottomNavigaitonIconButton extends StatelessWidget {
  const BottomNavigaitonIconButton({
    super.key,
    required this.title,
    required this.svg,
    required this.iconColor,
    required this.titleColor, required this.callback,
  });

  final String title, svg;
  final Color iconColor, titleColor;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: 1.sp,
        children: [
          SvgPicture.asset(
              svg,
              width: 28.w,
              height: 28.h,
              fit: BoxFit.cover,
              color: iconColor,
            ),
          Text(
            title,
            style: TextStyle(
              color: titleColor,
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
