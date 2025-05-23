import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../Core/navigation/routes.dart';
import '../../../Core/utils/app_colors.dart';
import '../../Common_Widgets/store_tex.dart';

class PaymentMethodsDetailButton extends StatelessWidget {
  const PaymentMethodsDetailButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        context.push(Routes.newCard);
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppColors.buttonBorder),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(vertical: 16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add, color: AppColors.black),
          SizedBox(width: 8.w),
          StoreText(
            text: "Add New Card",
            color: AppColors.black,
            fontSize: 14.sp,
          ),
        ],
      ),
    );
  }
}
