import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/features/login/widget/elevated_button_account.dart';

import '../widget/login_email_text_form_field.dart';
import '../widget/login_password_text_form_field.dart';
import '../widget/value_listenable_builder.dart';

class LoginDetail extends StatelessWidget {
  LoginDetail({super.key});

  final ValueNotifier<String> emailNotifier = ValueNotifier('');
  final ValueNotifier<String> passwordNotifier = ValueNotifier('');

  bool _isEmailValid(String email) => email.endsWith('@gmail.com');
  bool _isPasswordValid(String password) => password.length >= 8;

  @override
  Widget build(BuildContext context) {
    final contr = TextEditingController();
    final contr2 = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.white,
      extendBody: true,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 59,
                left: 24,
                right: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
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
                  ValueListenableBuilder<String>(
                    valueListenable: emailNotifier,
                    builder: (context, email, _) {
                      final isValid = _isPasswordValid(email);
                      return LoginEmailTextForm(
                        email: email,
                        emailNotifier: emailNotifier,
                        isValid: isValid,
                        label: "",
                        hint: "Enter your email address",
                        validator: (value) => null,
                        controller: contr,
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  ValueListenableBuilder<String>(
                    valueListenable: passwordNotifier,
                    builder: (context, password, _) {
                      final isValid = _isPasswordValid(password);
                      return LoginPasswordTextForm(
                        password: password,
                        isValid: isValid,
                        passwordNotifier: passwordNotifier,
                        label: "",
                        hint: "Enter your email address",
                        validator: (value) => null,
                        controller: contr2,
                      );
                    },
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
                  ValueListenableBuilder2<String, String>(
                    first: emailNotifier,
                    second: passwordNotifier,
                    builder: (context, email, password, _) {
                      final isValid =
                          _isEmailValid(email) && _isPasswordValid(password);
                      return SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: isValid ? () {} : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isValid ? AppColors.black : AppColors.buttonBorder,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    },
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
                  SizedBox(height: 150.h,),
                  Padding(
                    padding: EdgeInsets.only(right: 90.w, left: 90.w),
                    child: Row(
                      children: [
                        Text(
                          "Don’t have an account?",
                          style: TextStyle(
                              color: AppColors.black.withValues(alpha: 1),
                              fontSize: 15.sp),
                        ),
        
                        Text(
                          "Join",
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
