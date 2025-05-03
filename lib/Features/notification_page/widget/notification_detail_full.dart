import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/data/models/notification_model/notification_model.dart';
import 'package:store_app/features/notification_page/widget/store_notification_daily_news.dart';

import '../../Common_Widgets/store_tex.dart';

class NotificationDetailFull extends StatelessWidget {
  const NotificationDetailFull({
    super.key,
    required this.data,
  });

  final List<NotificationModel> data;

  @override
  Widget build(BuildContext context) {
    final sortedData = [...data]..sort((a, b) => b.date.compareTo(a.date));
    final Map<String, List<NotificationModel>> grouped = _groupNotificationsByDate(sortedData);

    return ListView.builder(
      itemCount: grouped.length,
      itemBuilder: (context, index) {
        final key = grouped.keys.elementAt(index);
        final notifications = grouped[key]!;

        return Padding(
          padding: const EdgeInsets.only(top: 16, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // if (index != 0)
                // Divider(
                //   height: 2,
                //   color: AppColors.bottomBorder,
                //   indent: 35,
                // ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: StoreText(
                  text: key,
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ...notifications.map((notif) => Column(
                    children: [
                      StoreNotificationDailyNews(
                        icons: notif.icon,
                        iconsColor: AppColors.black,
                        type: notif.title,
                        typeColor: AppColors.black,
                        meaning: notif.content,
                        meaningColor: AppColors.hintText,
                      ),
                      const SizedBox(height: 12),
                      Divider(
                        height: 1,
                        color: AppColors.bottomBorder,
                        indent: 35,
                      ),
                      const SizedBox(height: 12),
                    ],
                  )),
            ],
          ),
        );
      },
    );
  }

  Map<String, List<NotificationModel>> _groupNotificationsByDate(List<NotificationModel> notifications) {
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));

    final Map<String, List<NotificationModel>> grouped = LinkedHashMap();

    for (var notif in notifications) {
      String key;
      if (_isSameDay(notif.date, now)) {
        key = 'Today';
      } else if (_isSameDay(notif.date, yesterday)) {
        key = 'Yesterday';
      } else {
        key = DateFormat.yMMMMd().format(notif.date);
      }

      grouped.putIfAbsent(key, () => []).add(notif);
    }

    return grouped;
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
