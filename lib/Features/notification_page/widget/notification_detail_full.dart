import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/data/models/notifiaction_model/notification_model.dart';
import 'package:store_app/features/notification_page/widget/store_notification_daily_news.dart';

import '../../Common_Widgets/store_tex.dart';

class NotificationDetailFull extends StatelessWidget {
  const NotificationDetailFull({
    super.key, required this.data,
  });
  final List<NotificationModel> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) =>
          Column(
            children: [
              Divider(
                height: 2.5,
                color: AppColors.bottomBorder,
                indent: 35,
              ),
              StoreText(
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                text: "Today",
              ),
              SizedBox(height: 16.h),
              StoreNotificationDailyNews(
                // icons: "assets/icons/no_discount.svg",
                icons: data[index].icon,
                iconsColor: AppColors.black,
                // type: "30% Special Discount!",
                type: data[index].title,
                typeColor: AppColors.black,
                // meaning: "Special promotion only valid today.",
                meaning: data[index].content,
                meaningColor: AppColors.hintText,
              ),
            ],
          ),
        // SizedBox(height: 20.h),
        //
        // SizedBox(height: 40.h),
        // StoreText(
        //   color: AppColors.black,
        //   fontSize: 16,
        //   fontWeight: FontWeight.w500,
        //   text: "Yesterday",
        // ),
        // SizedBox(height: 16.h),
        // StoreNotificationDailyNews(
        //   icons: "assets/icons/no_wallet.svg",
        //   iconsColor: AppColors.black,
        //   type: "Top Up E-wallet Successfully!",
        //   typeColor: AppColors.black,
        //   meaning: "You have top up your e-wallet.",
        //   meaningColor: AppColors.hintText,
        // ),
        // SizedBox(height: 20.h),
        //
        // SizedBox(height: 20.h),
        // StoreNotificationDailyNews(
        //   icons: "assets/icons/map_pin.svg",
        //   iconsColor: AppColors.black,
        //   type: "New Service Available!",
        //   typeColor: AppColors.black,
        //   meaning: "Now you can track order in real-time.",
        //   meaningColor: AppColors.hintText,
        // ),
        // SizedBox(height: 20.h),
        // Divider(
        //   height: 2.5,
        //   color: AppColors.bottomBorder,
        // ),
        // SizedBox(height: 20.h),
        // StoreText(
        //   color: AppColors.black,
        //   fontSize: 16,
        //   fontWeight: FontWeight.w500,
        //   text: "June 7, 2023",
        // ),
        // SizedBox(height: 16.h),
        // StoreNotificationDailyNews(
        //   icons: "assets/icons/card.svg",
        //   iconsColor: AppColors.black,
        //   type: "Credit Card Connected! ",
        //   typeColor: AppColors.black,
        //   meaning: "Credit card has been linked.",
        //   meaningColor: AppColors.hintText,
        // ),
        // SizedBox(height: 20.h),
        // Divider(
        //   height: 2.5,
        //   color: AppColors.bottomBorder,
        //   indent: 35,
        // ),
        // SizedBox(height: 20.h),
        // StoreNotificationDailyNews(
        //   icons: "assets/icons/no_account.svg",
        //   iconsColor: AppColors.black,
        //   type: "Account Setup Successfully!",
        //   typeColor: AppColors.black,
        //   meaning: "Your account has been created.",
        //   meaningColor: AppColors.hintText,
        // ),
    );
  }
}
