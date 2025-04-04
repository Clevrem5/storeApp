import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/features/login/widget/text_form_field.dart';

class LoginDetail extends StatelessWidget {
  const LoginDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.only(
          top: 59,
          left: 24,
          right: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Login to your account",
              style: TextStyle(color: AppColors.black, fontSize: 32.sp),
            ),
            SizedBox(height: 8.h),
            Text(
              "It’s great to see you again.",
              style: TextStyle(color: AppColors.hintText, fontSize: 16.sp),
            ),
            SizedBox(height: 24.h),
            Text(
              "Email",
              style: TextStyle(color: AppColors.black, fontSize: 16.sp),
            ),
            StoreAuthTextField(label: "", hint: "hint", validator: (value) => null, controller: )
          ],
        ),
      ),
    );
  }
}
