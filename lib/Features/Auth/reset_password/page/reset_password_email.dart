import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Core/utils/app_colors.dart';
import 'package:store_app/Features/Auth/reset_password/manager/email/reset_bloc.dart';
import 'package:store_app/Features/Auth/reset_password/widget/store_elevated_button.dart';
import 'package:store_app/Features/Common_Widgets/store_app_bar.dart';
import 'package:store_app/Features/Common_Widgets/store_tex.dart';

import '../../../../Core/navigation/routes.dart';
import '../widget/reset_password_value_listenable_builder.dart';

class ResetPasswordEmailDetail extends StatefulWidget {
  ResetPasswordEmailDetail({super.key});

  @override
  State<ResetPasswordEmailDetail> createState() => _ResetPasswordEmailDetailState();
}

class _ResetPasswordEmailDetailState extends State<ResetPasswordEmailDetail> {
  final ValueNotifier<String> emailNotifier = ValueNotifier('');

  bool isEmailValid(String email) => email.endsWith('gmail.com');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white,
      extendBody: true,
      appBar: StoreAppBar(
        title: "",
        actions: "",
        leading: "assets/icons/back.svg",
        leadingCallBack: () {
          context.pop();
        },
        actionsCallBack: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          left: 24,
          right: 24,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                StoreText(
                  text: "Forgot password",
                  color: AppColors.black,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 8.h),
                StoreText(
                  text: "Enter your email for the verification process.\nWe will send 4 digits code to your email.",
                  color: AppColors.hintText,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 24.h),
                StoreText(
                  text: "Email",
                  color: AppColors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 4.h),
                ValueListenableBuilder(
                  valueListenable: emailNotifier,
                  builder: (context, email, _) => SizedBox(
                    width: double.infinity,
                    height: 52.h,
                    child: BlocListener<ResetEmailBloc, ResetState>(
                      listener: (context, state) {
                        if (state.status == ResetStatus.success) {
                          context.push(Routes.resetPasswordCode);
                        } else {
                          ScaffoldMessenger(
                            child: SnackBar(
                              content: Text("XATO BRATISHKA"),
                            ),
                          );
                        }
                      },
                      child: TextFormField(
                        controller: context.read<ResetEmailBloc>().emailController,
                        onChanged: (value) => emailNotifier.value = value,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: AppColors.buttonBorder,
                              width: 1,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: AppColors.black,
                              width: 1.w,
                            ),
                          ),
                          hintText: "Enter your email address",
                          hintStyle: TextStyle(
                            color: AppColors.hintText,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: ValueListenableBuilder1<String>(
            first: emailNotifier,
            builder: (context, email, _) {
              final isValid = isEmailValid(email);
              return SizedBox(
                width: double.infinity,
                height: 54.h,
                child: StoreElevatedButton(
                  isValid: isValid,
                  onTap: () {
                    context.read<ResetEmailBloc>().add(
                          SendEmailEvent(
                            email: context.read<ResetEmailBloc>().emailController.text.trim(),
                          ),
                        );
                  },
                  textColor: AppColors.white,
                  colorCorrect: AppColors.black,
                  colorIncorrect: AppColors.hintText,
                  text: "Davom Etish",
                ),
              );
            }),
      ),
    );
  }
}
