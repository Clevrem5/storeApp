import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreAppElevatedButton extends StatelessWidget {
  const StoreAppElevatedButton({
    super.key,
    required this.text,
    required this.callback,
    this.radius = 0,
    this.backRoundColor = Colors.black,
  });

  final String text;
  final VoidCallback callback;
  final double radius;
  final Color backRoundColor;
  // final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 107.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          backgroundColor: backRoundColor,
          minimumSize: Size(341.w, 54.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          elevation: 5,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: backRoundColor == Colors.black ? Colors.white : Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
