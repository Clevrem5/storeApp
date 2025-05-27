import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/data/models/mycart/my_cart_model.dart';

import '../../../../Core/navigation/routes.dart';
import '../../../Auth/store_onboarding/page/store_app_elevated_button.dart';
import '../../../Common_Widgets/store_tex.dart';

class CartDetailCalculate extends StatelessWidget {
  const CartDetailCalculate({
    super.key,
    required this.myCart,
  });

  final MyCartModel myCart;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StoreText(
              text: "Sub-total",
              color: Colors.black.withValues(alpha: 0.45),
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
            ),
            StoreText(
              text: "\$ ${myCart.subTotal}",
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StoreText(
              text: "Vat(%)",
              color: Colors.black.withValues(alpha: 0.45),
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
            ),
            StoreText(
              text: "\$ ${myCart.vat}",
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StoreText(
              text: "Shipping fee",
              color: Colors.black.withValues(alpha: 0.45),
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
            ),
            StoreText(
              text: "\$ ${myCart.shippingFee}",
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
          ],
        ),
        Divider(
          color: Colors.grey.withValues(alpha: 0.45),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StoreText(
              text: "Total",
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
            ),
            StoreText(
              text: "\$ ${myCart.total}",
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
          ],
        ),
        StoreAppElevatedButton(
          text: "Go To CheckOut ➡️",
          callback: () {
            context.push(Routes.checkout);
          },
          radius: 10,
        ),
      ],
    );
  }
}
