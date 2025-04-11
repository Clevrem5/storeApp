import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:store_app/Features/Auth/reset_password/manager/reset_bloc.dart';

import '../../../../Core/navigation/routes.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../Common_Widgets/store_app_bar.dart';
import '../../../Common_Widgets/store_tex.dart';
import '../widget/reset_password_value_listenable_builder.dart';
import '../widget/store_elevated_button.dart';

class ResetPasswordCode extends StatelessWidget {
  ResetPasswordCode({super.key});

  final ValueNotifier<String> passwordNotifier = ValueNotifier('');

  bool isPasswordValid(String password) => password.length == 4;

  @override
  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetEmailBloc, ResetState>(
      listener: (context, state) {
        if (state.status == ResetStatus.success) {
          context.push(Routes.resetNewPassword);
        }

        if (state.status == ResetStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message ?? 'Xatolik yuz berdi')),
          );
        }
      },
      child: Scaffold(
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
          padding: const EdgeInsets.only(top: 15, left: 24, right: 24),
          child: SafeArea(
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  StoreText(
                    text: "Enter 4 Digit Code",
                    color: AppColors.black,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 8.h),
                  StoreText(
                    text: "Enter 4 digit code that you receive on your\nemail (cody.fisher45@example.com).",
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
                  SizedBox(height: 24.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ValueListenableBuilder(
                      valueListenable: passwordNotifier,
                      builder: (context, password, _) => PinCodeTextField(
                        // controller: context.read<ResetEmailBloc>().codeController,
                        appContext: context,
                        length: 4,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        animationType: AnimationType.slide,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(10),
                          fieldHeight: 60.h,
                          fieldWidth: 64.w,
                          activeFillColor: AppColors.white,
                          selectedFillColor: AppColors.white,
                          inactiveFillColor: AppColors.white,
                          selectedColor: AppColors.hintText,
                          activeColor: Colors.green,
                          inactiveColor: Colors.red,
                        ),
                        animationDuration: Duration(milliseconds: 300),
                        enableActiveFill: true,
                        onChanged: (value) {
                          passwordNotifier.value = value;
                        },
                        onCompleted: (value) {
                          // context.read<ResetEmailBloc>().add(
                          //       SendEmailEvent(
                          //         email: context.read<ResetEmailBloc>().codeController.text.trim(),
                          //       ),
                          //     );
                        },
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
            first: passwordNotifier,
            builder: (context, code, _) {
              final isValid = isPasswordValid(code);
              return SizedBox(
                width: double.infinity,
                height: 54.h,
                child: StoreElevatedButton(
                  onTap: () {
                    if (isValid) {
                      // context.read<ResetEmailBloc>().add(
                      //       SendCodeEmailEvent(
                      //         code: context.read<ResetEmailBloc>().codeController.text.trim(),
                      //       ),
                      //     );
                      context.push(Routes.resetNewPassword);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Kod 4 xonali bo'lishi kerak")),
                      );
                    }
                  },
                  text: "Yuborish",
                  textColor: AppColors.white,
                  colorIncorrect: AppColors.hintText,
                  colorCorrect: AppColors.black,
                  isValid: isValid,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
