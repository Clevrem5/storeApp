import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/app_colors.dart';

import '../../../core/navigation/routes.dart';
import '../../home_page/page/store_bottom_navigation_bar.dart';
class SearchDetail extends StatelessWidget {
  const SearchDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.white,
      body: Text(
        "search", style: TextStyle(color: AppColors.black, fontSize: 50),),
      bottomNavigationBar: StoreBottomNavigationBar(
        selectedIndex: 1, // Dynamically set index
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