import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Core/utils/app_colors.dart';
import 'package:store_app/Features/Common_Widgets/store_tex.dart';

import '../../../../Core/navigation/routes.dart';

class StoreElevatedButton extends StatelessWidget {
  const StoreElevatedButton({
    super.key,
    required this.isValid, required this.text, required this.textColor, required this.colorCorrect, required this.colorIncorrect, required this.onTap,
  });
  final String text;
  final Color textColor, colorCorrect, colorIncorrect;

  final bool isValid;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isValid ? AppColors.black : AppColors.buttonBorder,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onTap,
      child: StoreText(
        text: "Davom Etish",
        color: AppColors.white,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
