import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/app_colors.dart';
import '../../../../core/navigation/routes.dart';

class SignUpDetail extends StatefulWidget {
  const SignUpDetail({super.key});

  @override
  _SignUpDetailState createState() => _SignUpDetailState();
}

class _SignUpDetailState extends State<SignUpDetail> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isEmailValid = true;
  String? _emailError;
  bool _isPasswordVisible = false;

  void _validateEmail(String value) {
    setState(() {
      _isEmailValid = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}")
          .hasMatch(value);
      _emailError =
          _isEmailValid ? 'Correct' : 'Please enter a valid email address';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        colorScheme: ColorScheme.light(
          primary: Colors.black,
          secondary: Colors.grey,
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.black87),
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create an account',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: 8),
                  Text("Let's create your account.",
                      style: TextStyle(color: Colors.grey[700])),
                  SizedBox(height: 24),
                  Text(
                    "Full Name",
                    style: TextStyle(color: AppColors.black, fontSize: 16.sp),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "Email",
                    style: TextStyle(color: AppColors.black, fontSize: 16.sp),
                  ),
                  SizedBox(height: 4.h),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      errorText: _isEmailValid ? null : _emailError,
                      suffixIcon: Icon(
                        _isEmailValid ? Icons.check_circle : Icons.error,
                        color: _isEmailValid ? Colors.green : Colors.red,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: _validateEmail,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "Password",
                    style: TextStyle(color: AppColors.black, fontSize: 16.sp),
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    obscureText: !_isPasswordVisible,
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(
                    width: double.infinity.h,
                    height: 54.h,
                    child: ElevatedButton(
                      onPressed: _isEmailValid ? () {} : null,

                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), // bu yerda radiusni berasiz
                        ),
                        backgroundColor:
                            _isEmailValid ? Colors.black : Colors.grey,
                      ),

                      // Button active only if email is valid
                      child: Text('Create an Account',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Or", style: TextStyle(color: Colors.grey[700]))
                    ],
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(
                    width: double.infinity.w,
                    height: 56.h,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: SvgPicture.asset("assets/google.svg"),
                      label: Text('Sign Up with Google',
                          style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        minimumSize: Size(double.infinity, 50.sp),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.facebook, color: Colors.white),
                    label: Text('Sign Up with Facebook',
                        style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50.sp),
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account? ",
                          style: TextStyle(color: Colors.grey[700])),
                      TextButton(
                        onPressed: () {
                          context.push(Routes.login);
                        },
                        child: Text('Log In',
                            style: TextStyle(color: Colors.black)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
