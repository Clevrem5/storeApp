import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../Core/navigation/routes.dart';
import '../../../Common_Widgets/store_bottom_navigation_bar.dart';

class StoreNewNavigationBar extends StatelessWidget {
  const StoreNewNavigationBar({
    super.key, required this.index,
  });
final int index;
  @override
  Widget build(BuildContext context) {
    return StoreBottomNavigationBar(
      selectedIndex: index, // Dynamically set index
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
    );
  }
}
