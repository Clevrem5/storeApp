import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Features/Auth/store_onboarding/page/store_app_elevated_button.dart';
import 'package:store_app/Features/cart_page/page/cart_detail_container.dart';
import 'package:store_app/Features/Common_Widgets/store_app_bar.dart';
import 'package:store_app/core/utils/app_colors.dart';

import '../../../core/navigation/routes.dart';
import '../../Common_Widgets/store_bottom_navigation_bar.dart';
import '../../Common_Widgets/store_tex.dart';

class CartDetail extends StatelessWidget {
  const CartDetail({super.key});

  // final List list = List.generate(
  //   5,
  //   (index) => CartDetailContainer(),
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: StoreAppBarTwo(text: "My Cart"),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 10,
        ),
        child: Column(
          spacing: 10,
          children: [
            SizedBox(
              width: double.infinity,
              height: 355.h,
              child: ListView.separated(
                itemBuilder: (context, index) => CartDetailContainer(),
                separatorBuilder: (context, index) => SizedBox(
                  height: 15.h,
                ),
                itemCount: 5,
              ),
            ),
            Column(
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
                      text: "\$ 5,870",
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
                      text: "\$ 0.00",
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
                      text: "\$ 80",
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
                      text: "\$ 5,950",
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
            ),
          ],
        ),
      ),
      bottomNavigationBar: StoreBottomNavigationBar(
        selectedIndex: 3, // Dynamically set index
        onTap: (index) {
          switch (index) {
            case 0:
              context.push(Routes.home);
              break;
            case 1:
              context.push(Routes.search);
              break;
            case 2:
              context.push(Routes.saved);
              break;
            case 3:
              context.push(Routes.cart);
              break;
            case 4:
              context.push(Routes.account);
              break;
            default:
              break;
          }
        },
      ),
    );
  }
}
