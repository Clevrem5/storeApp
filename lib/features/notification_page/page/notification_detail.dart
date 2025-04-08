import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Features/search_page/page/store_app_bar.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/features/notification_page/widget/store_notification_daily_news.dart';
import '../../../core/navigation/routes.dart';
import '../../Common_Widgets/store_app_bar.dart';
import '../../Common_Widgets/store_bottom_navigation_bar.dart';
import '../../Common_Widgets/store_tex.dart';

class NotificationDetail extends StatelessWidget {
  const NotificationDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.white,
      appBar: StoreAppBar(
        actionsCallBack: () {},
        leadingCallBack: () => context.pop(Routes.home),
        leading: "assets/icons/back.svg",
        actions: "",
        title: "Notifications",
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              color: AppColors.bottomBorder,
              height: 2.5,
            ),
            SizedBox(height: 20.h),
            StoreText(
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              text: "Today",
            ),
            SizedBox(height: 16.h),
            StoreNotificationDailyNews(
              icons: "assets/icons/no_discount.svg",
              iconsColor: AppColors.black,
              type: "30% Special Discount!",
              typeColor: AppColors.black,
              meaning: "Special promotion only valid today.",
              meaningColor: AppColors.hintText,
            ),
            SizedBox(height: 40.h),
            StoreText(
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              text: "Yesterday",
            ),
            SizedBox(height: 16.h),
            StoreNotificationDailyNews(
              icons: "assets/icons/no_wallet.svg",
              iconsColor: AppColors.black,
              type: "Top Up E-wallet Successfully!",
              typeColor: AppColors.black,
              meaning: "You have top up your e-wallet.",
              meaningColor: AppColors.hintText,
            ),
            SizedBox(height: 20.h),
            Divider(
              height: 2.5,
              color: AppColors.bottomBorder,
              indent: 35,
            ),
            SizedBox(height: 20.h),
            StoreNotificationDailyNews(
              icons: "assets/icons/map_pin.svg",
              iconsColor: AppColors.black,
              type: "New Service Available!",
              typeColor: AppColors.black,
              meaning: "Now you can track order in real-time.",
              meaningColor: AppColors.hintText,
            ),
            SizedBox(height: 20.h),
            Divider(
              height: 2.5,
              color: AppColors.bottomBorder,
            ),
            SizedBox(height: 20.h),
            StoreText(
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              text: "June 7, 2023",
            ),
            SizedBox(height: 16.h),
            StoreNotificationDailyNews(
              icons: "assets/icons/card.svg",
              iconsColor: AppColors.black,
              type: "Credit Card Connected! ",
              typeColor: AppColors.black,
              meaning: "Credit card has been linked.",
              meaningColor: AppColors.hintText,
            ),
            SizedBox(height: 20.h),
            Divider(
              height: 2.5,
              color: AppColors.bottomBorder,
              indent: 35,
            ),
            SizedBox(height: 20.h),
            StoreNotificationDailyNews(
              icons: "assets/icons/no_account.svg",
              iconsColor: AppColors.black,
              type: "Account Setup Successfully!",
              typeColor: AppColors.black,
              meaning: "Your account has been created.",
              meaningColor: AppColors.hintText,
            ),
          ],
        ),
      ),
      bottomNavigationBar: StoreBottomNavigationBar(
        selectedIndex: 0, // Dynamically set index
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
