import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Features/Auth/sign_up/manager/sign_up_bloc.dart';
import 'package:store_app/Features/Auth/sign_up/manager/sign_up_event.dart';
import 'package:store_app/Features/Auth/sign_up/manager/sign_up_state.dart';
import 'package:store_app/core/utils/app_colors.dart';
import '../../../../core/navigation/routes.dart';

class SignUpDetail extends StatefulWidget {
  const SignUpDetail({super.key});

  @override
  _SignUpDetailState createState() => _SignUpDetailState();
}

class _SignUpDetailState extends State<SignUpDetail> {
  bool _isEmailValid = true;
  String? _emailError;
  bool _isPasswordVisible = false;

  void _validateEmail(String value) {
    setState(() {
      _isEmailValid = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value);
      _emailError = _isEmailValid ? null : 'Please enter a valid email address';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state.status == SignUpStatus.submitted) {
            showDialog(
              context: context,
              barrierDismissible: false,
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
                            "Muvaffaqiyatli Ro'yxatdan O'tdingiz!",
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
                              context.push(Routes.home);
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
          // if (state.status == SignUpStatus.error) {
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create an account',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text("Let's create your account.", style: TextStyle(color: Colors.grey[700])),
              SizedBox(height: 24),

              // Full Name
              Text(
                "Full Name",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              TextField(
                // controller: context.read<SignUpBloc>().fullNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                ),
              ),
              SizedBox(height: 16),

              // Email
              Text(
                "Email",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              SizedBox(height: 4),
              TextField(
                controller: context.read<SignUpBloc>().emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                  errorText: _isEmailValid ? null : _emailError,
                  suffixIcon: Icon(
                    _isEmailValid ? Icons.check_circle : Icons.error,
                    color: _isEmailValid ? Colors.green : Colors.red,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: _validateEmail,
              ),
              SizedBox(height: 16),

              // Password
              Text(
                "Password",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              TextField(
                controller: context.read<SignUpBloc>().passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<SignUpBloc>().add(SignUpLoad());
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: _isEmailValid ? Colors.black : Colors.grey,
                  ),
                  child: Text(
                    'Create an Account',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Or
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Or", style: TextStyle(color: Colors.grey[700])),
                ],
              ),
              SizedBox(height: 16),

              // Google Sign Up
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/icons/google.svg"),
                  label: Text(
                    'Sign Up with Google',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Facebook Sign Up
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.facebook, color: Colors.white),
                label: Text(
                  'Sign Up with Facebook',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
              SizedBox(height: 16),

              // Already have account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? ", style: TextStyle(color: Colors.grey[700])),
                  TextButton(
                    child: Text('Log In', style: TextStyle(color: Colors.black)),
                    onPressed: () {
                      context.push(Routes.login);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
