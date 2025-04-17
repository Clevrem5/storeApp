import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Features/Common_Widgets/storeAppBar.dart';
import 'package:store_app/Features/myCart/presentation/page/cart_detail_empty.dart';
import 'package:store_app/core/utils/app_colors.dart';
import '../../../../Core/navigation/routes.dart';
import '../../../Common_Widgets/store_bottom_navigation_bar.dart';
import '../widgets/cart_detail_items.dart';

class CartDetail extends StatelessWidget {
  CartDetail({super.key});

  bool isNotEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: StoreAppBar(title: "My Cart"),
      backgroundColor: AppColors.white,
      body: isNotEmpty == true
          ? CartDetailItems()
          : StoreAppPageEmpty(
              text: "Your Cart is empty!",
              bio: "When you added product they'll\n "
                  "appear here.",
              icon: Icons.shopping_cart,
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
