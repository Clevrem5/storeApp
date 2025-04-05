import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/core/utils/app_colors.dart';

class ElevatedButtonAccount extends StatelessWidget {
  const ElevatedButtonAccount({
    super.key,
    required this.svg,
    required this.text,
    required this.button,
    required this.backgroundColor,
    required this.textColor, required this.sideColor,
  });

  final String svg, text;
  final VoidCallback button;
  final Color backgroundColor, textColor, sideColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54.h,
      child: ElevatedButton(
        onPressed: button,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          side: BorderSide(
            color: sideColor,
            width: 0.8,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(svg),
            SizedBox(
              width: 10.w,
            ),
            Text(
              text,
              style: TextStyle(
                color: AppColors.black,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
