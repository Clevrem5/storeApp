import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Features/Auth/login/manger/login_event.dart';
import 'package:store_app/Features/Auth/login/manger/login_state.dart';
import 'package:store_app/core/utils/app_colors.dart';
import '../../../../Core/navigation/routes.dart';
import '../manger/login_bloc.dart';
import '../widget/elevated_button_account.dart';
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
    return Scaffold(
      backgroundColor: AppColors.white,
      // extendBody: true,
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) async {
          if (state.status == LoginStatus.success) {
            context.push(Routes.home);
          } else {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) {
                return Center(
                  child: Dialog(
                    backgroundColor: Colors.white,
                    child: Container(
                      width: 341.w,
                      height: 292.h,
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 36.h),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // spacing: 20.h,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/no_succes.svg",
                            width: 78.w,
                            height: 78.h,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Text(
                            "Ro'yxatdan O'tib Bo'lmadi",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                )),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Center(
                              child: Text(
                                "Go Home",
                                style: TextStyle(fontSize: 15.sp, color: AppColors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          // if (state.status == LoginStatus.error) {
          //   showDialog(
          //     context: context,
          //     barrierDismissible: true,
          //     builder: (context) {
          //       return Center(
          //         child: Dialog(
          //           backgroundColor: Colors.white,
          //           child: Container(
          //             width: 341.w,
          //             height: 292.h,
          //             padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 36.h),
          //             child: Column(
          //               // crossAxisAlignment: CrossAxisAlignment.center,
          //               // mainAxisAlignment: MainAxisAlignment.center,
          //               // spacing: 20.h,
          //               mainAxisSize: MainAxisSize.min,
          //               children: [
          //                 SvgPicture.asset(
          //                   "assets/icons/no_succes.svg",
          //                   width: 78.w,
          //                   height: 78.h,
          //                   fit: BoxFit.cover,
          //                 ),
          //                 SizedBox(
          //                   height: 12.h,
          //                 ),
          //                 Text(
          //                   "Ro'yxatdan O'tib Bo'lmadi",
          //                   textAlign: TextAlign.center,
          //                   style: TextStyle(
          //                     color: AppColors.black,
          //                     fontSize: 20,
          //                     fontWeight: FontWeight.w600,
          //                   ),
          //                 ),
          //                 ElevatedButton(
          //                   style: ElevatedButton.styleFrom(
          //                       backgroundColor: AppColors.black,
          //                       shape: RoundedRectangleBorder(
          //                         borderRadius: BorderRadius.circular(50),
          //                       )),
          //                   onPressed: () {
          //                     Navigator.pop(context);
          //                   },
          //                   child: Center(
          //                     child: Text(
          //                       "Go Home",
          //                       style: TextStyle(fontSize: 15.sp, color: AppColors.white),
          //                     ),
          //                   ),
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //       );
          //     },
          //   );
          // }
        },
        child: SafeArea(
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
                      style: TextStyle(color: AppColors.black, fontSize: 32.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "It’s great to see you again.",
                      style: TextStyle(color: AppColors.hintText, fontSize: 16.sp),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      "Email",
                      style: TextStyle(color: AppColors.black, fontSize: 16.sp, fontWeight: FontWeight.w600),
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
                          controller: context.read<LoginBloc>().loginContr,
                        );
                      },
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      "Password",
                      style: TextStyle(color: AppColors.black, fontSize: 16.sp, fontWeight: FontWeight.w600),
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
                          hint: "Enter your password",
                          validator: (value) => null,
                          controller: context.read<LoginBloc>().passwordContr,
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
                          style: TextStyle(color: AppColors.black.withValues(alpha: 1), fontSize: 16.sp),
                        ),
                        Text(
                          "Reset your password",
                          style: TextStyle(color: AppColors.black, fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    ValueListenableBuilder2<String, String>(
                      first: emailNotifier,
                      second: passwordNotifier,
                      builder: (context, email, password, _) {
                        final isValid = _isEmailValid(email) && _isPasswordValid(password);
                        return SizedBox(
                          width: double.infinity,
                          height: 54,
                          child: ElevatedButton(
                            onPressed: () {
                              // if (){
                              //
                              // }
                              context.read<LoginBloc>().add(LoginLoad());
                            },
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
                      svg: "assets/icons/google.svg",
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
                      svg: "assets/icons/facebook.svg",
                      textColor: AppColors.white,
                      sideColor: AppColors.blue,
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.go(Routes.signUp);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t have an account?",
                            style: TextStyle(color: AppColors.black.withValues(alpha: 1), fontSize: 15.sp),
                          ),
                          Text(
                            "Join",
                            style: TextStyle(color: AppColors.black, fontSize: 15.sp, fontWeight: FontWeight.w600),
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
      ),
    );
  }
}
