import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Features/myCart/presentation/page/cart_detail_empty.dart';
import 'package:store_app/Features/notification_page/manager/notification_bloc.dart';
import 'package:store_app/Features/notification_page/manager/notification_state.dart';
import 'package:store_app/Features/notification_page/widget/notification_detail_full.dart';
import 'package:store_app/core/utils/app_colors.dart';

import '../../../core/navigation/routes.dart';
import '../../Common_Widgets/storeAppBar.dart';
import '../../Common_Widgets/store_bottom_navigation_bar.dart';

class NotificationDetail extends StatelessWidget {
  NotificationDetail({super.key});

  bool isNotEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.white,
      appBar: StoreAppBar(
        actions: [],
        title: "Notifications",
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24),
        child: BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, state) {
            final isNotEmpty = state.notification.isNotEmpty;
            if (state.status == NotificationStatus.loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.status == NotificationStatus.idle) {
              return isNotEmpty == true
                  ? NotificationDetailFull(
                      data: state.notification,
                    )
                  : StoreAppPageEmpty(
                      text: "You haven’t gotten any\nnotifications yet!",
                      bio: "We’ll alert you when something\ncool happens.",
                      icon: Icons.notifications_none,
                    );
            } else {
              return Center(
                child: Text("Xato Chiqdi"),
              );
            }
          },
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
