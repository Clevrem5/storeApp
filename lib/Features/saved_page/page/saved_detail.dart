import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Features/myCart/presentation/page/cart_detail_empty.dart';

import '../../../Core/navigation/routes.dart';
import '../../../Core/utils/app_colors.dart';
import '../../Common_Widgets/storeAppBar.dart';
import '../../Common_Widgets/store_bottom_navigation_bar.dart';

class SavedDetail extends StatelessWidget {
  const SavedDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.white,
      appBar: StoreAppBar(
        title: "Saved",
      ),
      body: Center(
        child: StoreAppPageEmpty(
          text: "No Saved Items!",
          bio: "You don’t have any saved items.\nGo to home and add some.",
          icon: Icons.favorite_border,
        ),
      ),
      bottomNavigationBar: StoreBottomNavigationBar(
        selectedIndex: 2, // Dynamically set index
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
