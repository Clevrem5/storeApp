import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Core/utils/app_colors.dart';
import 'package:store_app/Features/Common_Widgets/storeAppBar.dart';

import '../../../Core/navigation/routes.dart';
import '../../Common_Widgets/store_bottom_navigation_bar.dart';
import '../widgets/help_center_tile.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: StoreAppBar(
        title: "Help Center",
        callback: () => context.go(Routes.account),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                context.push(Routes.customerService);
              },
              child: HelpCenterTile(
                iconPath: 'assets/icons/headphones.svg',
                title: 'Customer Service',
              ),
            ),
            SizedBox(height: 12),
            HelpCenterTile(
              iconPath: 'assets/icons/whatsapp.svg',
              title: 'Whatsapp',
            ),
            SizedBox(height: 12),
            HelpCenterTile(
              iconPath: 'assets/icons/website.svg',
              title: 'Website',
            ),
            SizedBox(height: 12),
            HelpCenterTile(
              iconPath: 'assets/icons/facebook.svg',
              title: 'Facebook',
            ),
            SizedBox(height: 12),
            HelpCenterTile(
              iconPath: 'assets/icons/twitter.svg',
              title: 'Twitter',
            ),
            SizedBox(height: 12),
            HelpCenterTile(
              iconPath: 'assets/icons/instagram.svg',
              title: 'Instagram',
            ),
          ],
        ),
      ),
      bottomNavigationBar: StoreBottomNavigationBar(
        selectedIndex: 4,
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
          }
        },
      ),
    );
  }
}
