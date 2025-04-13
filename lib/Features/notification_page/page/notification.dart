import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../Core/navigation/routes.dart';
import '../../Common_Widgets/storeAppBar.dart';
import '../../Common_Widgets/store_bottom_navigation_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(
        actionsCallBack: () {},
        leadingCallBack: () => context.pop(Routes.home),
        leading: "assets/icons/back.svg",
        actions: "",
        title: "Notifications",
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade200,
              ),
              child: Icon(
                Icons.notifications_none,
                size: 50,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "You haven’t gotten any\nnotifications yet!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              "We’ll alert you when something\ncool happens.",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
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
