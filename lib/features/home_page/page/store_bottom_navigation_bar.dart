import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/features/home_page/page/bottom_navigaiton_icon_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            BottomNavigaitonIconButton(
              callback: () => onTap(0),
              svg: "assets/icons/home.svg",
              iconColor: selectedIndex == 0
                  ? Colors.black
                  : Colors.grey,
              title: "Home",
              titleColor: selectedIndex == 0
                  ? Colors.black
                  : Colors.grey,
            ),
            BottomNavigaitonIconButton(
              callback: () => onTap(1),
              svg: "assets/icons/search.svg",
              iconColor: selectedIndex == 1
                  ? Colors.black
                  : Colors.grey,
              title: "Search",
              titleColor: selectedIndex == 1
                  ? Colors.black
                  : Colors.grey,
            ),
            BottomNavigaitonIconButton(
              callback: () => onTap(2),
              svg: "assets/icons/saved.svg",
              iconColor: selectedIndex == 2
                  ? Colors.black
                  : Colors.grey,
              title: "Saved",
              titleColor: selectedIndex == 2
                  ? Colors.black
                  : Colors.grey,
            ),
            BottomNavigaitonIconButton(
              callback: () => onTap(3),
              svg: "assets/icons/cart.svg",
              iconColor: selectedIndex == 3
                  ? Colors.black
                  : Colors.grey,
              title: "Cart",
              titleColor: selectedIndex == 3
                  ? Colors.black
                  : Colors.grey,
            ),
            BottomNavigaitonIconButton(
              callback: () => onTap(4),
              svg: "assets/icons/account.svg",
              iconColor: selectedIndex == 4
                  ? Colors.black
                  : Colors.grey,
              title: "Account",
              titleColor: selectedIndex == 4
                  ? Colors.black
                  : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
