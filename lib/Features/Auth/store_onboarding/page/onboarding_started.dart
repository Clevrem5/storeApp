import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Features/Auth/store_onboarding/page/store_app_elevated_button.dart';
import 'package:store_app/Features/Common_Widgets/store_tex.dart';

import '../../../../Core/navigation/routes.dart';

class OnboardingStarted extends StatelessWidget {
  const OnboardingStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 30, 24, 30),
              child: SizedBox(
                width: 324.w,
                height: 204.h,
                child: StoreText(
                  text: "Define \n"
                      "yourself in \n"
                      "your unique \n"
                      "way.",
                  color: Colors.black,
                  fontSize: 50.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Image.asset(
                "assets/images/onboarding_pattern.png",
                fit: BoxFit.cover,
                width: 358.w,
                height: 600.h,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Image.asset(
                "assets/images/onboarding_person.png",
                fit: BoxFit.cover,
                width: double.infinity,
                height: 575.h,
              ),
            ),
          ],
        ),
        bottomNavigationBar: StoreAppElevatedButton(
          text: "get started",callback: ()=>context.go(Routes.signUp),
        ),
      ),
    );
  }
}
