import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/features/login/widget/elevated_button_account.dart';
import 'package:store_app/features/login/widget/login_email_text_form_field.dart';
import 'package:store_app/features/login/widget/login_password_text_form_field.dart';

class LoginDetail extends StatelessWidget {
  const LoginDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final contr = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ListView(
        children: [
          Padding(
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
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8.h),
                Text(
                  "It’s great to see you again.",
                  style: TextStyle(color: AppColors.hintText, fontSize: 16.sp),
                ),
                SizedBox(height: 24.h),
                Text(
                  "Email",
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 4.h,
                ),
                LoginEmailTextForm(
                  label: "",
                  hint: "Enter your email address",
                  validator: (value) => null,
                  controller: contr,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "Password",
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 4.h,
                ),
                LoginPasswordTextForm(
                  label: "",
                  hint: "Enter your password",
                  validator: (value) => null,
                  controller: contr,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Text(
                      "Forgot your password?",
                      style: TextStyle(
                          color: AppColors.black.withValues(alpha: 1),
                          fontSize: 16.sp),
                    ),
                    Text(
                      "Reset your password",
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                SizedBox(
                  width: double.infinity,
                  height: 54.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.hintText,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Row(
                  spacing: 8,
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.hintText,
                        thickness: 1.5,
                      ),
                    ),
                    Text(
                      "Or",
                      style: TextStyle(
                        color: AppColors.hintText,
                        fontSize: 14,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.hintText,
                        thickness: 1.5,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                ElevatedButtonAccount(
                  backgroundColor: AppColors.white,
                  text: "Login with Google",
                  button: () {},
                  svg: "assets/google.svg",
                  textColor: AppColors.black,
                  sideColor: AppColors.buttonBorder,
                ),
                SizedBox(
                  height: 16.h,
                ),
                ElevatedButtonAccount(
                  backgroundColor: AppColors.blue,
                  text: "Login with Google",
                  button: () {},
                  svg: "assets/facebook.svg",
                  textColor: AppColors.white,
                  sideColor: AppColors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
