import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/navigation/routes.dart';
import 'package:store_app/core/utils/app_colors.dart';

class StoreOnboardingDetail extends StatefulWidget {
  const StoreOnboardingDetail({super.key});

  @override
  State<StoreOnboardingDetail> createState() => _StoreOnboardingDetailState();
}

class _StoreOnboardingDetailState extends State<StoreOnboardingDetail> {
  @override
  void initState() {
    super.initState();
    _checkAndNavigate();
  }

  Future<bool> _checkInternet() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  void _checkAndNavigate() async {
    bool connected = await _checkInternet();

    if (connected) {
      await Future.delayed(const Duration(seconds: 2));
      if (!mounted) return;
      context.go(Routes.onboardingStarted);
    } else {
      _showRetryDialog();
    }
  }

  void _showRetryDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text("Internet yo'q"),
          content: const Text("Iltimos, internet aloqasini tekshiring."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _checkAndNavigate();
              },
              child: const Text("Qayta urinish"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          Image.asset(
            "assets/element.png",
            width: double.infinity,
            height: 627,
            color: AppColors.chiziq,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 309, left: 129, right: 127),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/store_logo.png",
                  width: 120,
                  height: 120,
                  color: Colors.white,
                ),
                const SizedBox(height: 200),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
