import 'package:flutter/material.dart';
import '../home_page/widgets/bottom_navigaiton_icon_button.dart';

class StoreBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const StoreBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 86,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavigationIconButton(
              callback: () => onTap(0),
              svg: "assets/icons/home.svg",
              iconColor: selectedIndex == 0 ? Colors.black : Colors.grey,
              title: "Home",
              titleColor: selectedIndex == 0 ? Colors.black : Colors.grey,
            ),
            BottomNavigationIconButton(
              callback: () => onTap(1),
              svg: "assets/icons/search.svg",
              iconColor: selectedIndex == 1 ? Colors.black : Colors.grey,
              title: "Search",
              titleColor: selectedIndex == 1 ? Colors.black : Colors.grey,
            ),
            BottomNavigationIconButton(
              callback: () => onTap(2),
              svg: "assets/icons/saved.svg",
              iconColor: selectedIndex == 2 ? Colors.black : Colors.grey,
              title: "Saved",
              titleColor: selectedIndex == 2 ? Colors.black : Colors.grey,
            ),
            BottomNavigationIconButton(
              callback: () => onTap(3),
              svg: "assets/icons/cart.svg",
              iconColor: selectedIndex == 3 ? Colors.black : Colors.grey,
              title: "Cart",
              titleColor: selectedIndex == 3 ? Colors.black : Colors.grey,
            ),
            BottomNavigationIconButton(
              callback: () => onTap(4),
              svg: "assets/icons/account.svg",
              iconColor: selectedIndex == 4 ? Colors.black : Colors.grey,
              title: "Account",
              titleColor: selectedIndex == 4 ? Colors.black : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
