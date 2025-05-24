import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/Features/Common_Widgets/store_tex.dart';

class StoreAppDialog extends StatelessWidget {
  const StoreAppDialog({
    super.key,
    required this.title,
    required this.subtitle,
    required this.callback,
  });

  final VoidCallback callback;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 341.w,
        height: 270.h,
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          spacing: 20.h,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/validation_success.svg',
              width: 59.w,
              height: 59.h,
              fit: BoxFit.cover,
            ),
            Column(
              spacing: 15.h,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                StoreText(
                  text: title,
                  // text: "Congratulations!",
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
                StoreText(
                  text: subtitle,
                  // text: "Your new card added has been added...",
                  color: Colors.black.withValues(alpha: 0.50),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  height: 1,line: 1,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: callback,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                minimumSize: Size(293.w, 54.h),
                elevation: 5,
                alignment: Alignment.center,
              ),
              child: StoreText(
                text: "Thanks!!!",
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
