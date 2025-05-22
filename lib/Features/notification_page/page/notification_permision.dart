import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Core/utils/app_colors.dart';
import 'package:store_app/Features/Common_Widgets/storeAppBar.dart';

import '../../../Core/navigation/routes.dart';
import '../../Common_Widgets/store_bottom_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // int _currentIndex = 4;
  Map<String, bool> switches = {
    "General Notifications": true,
    "Sound": true,
    "Vibrate": false,
    "Special Offers": true,
    "Promo & Discounts": false,
    "Payments": false,
    "Cahback": true,
    "App Updates": false,
    "New Service Available": true,
    "New Tips Available": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: StoreAppBar(
        title: "Notification",
        callback: () => context.go(Routes.account),
      ),
      body: ListView(
        children: switches.entries.map((entry) {
          return Column(
            children: [
              SwitchListTile(
                activeColor: Colors.black,
                title: Text(
                  entry.key,
                  style: TextStyle(color: AppColors.black, fontSize: 16, fontWeight: FontWeight.w500),
                ),
                value: entry.value,
                onChanged: (bool value) {
                  setState(() {
                    switches[entry.key] = value;
                  });
                },
              ),
              const Divider(height: 1),
            ],
          );
        }).toList(),
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
