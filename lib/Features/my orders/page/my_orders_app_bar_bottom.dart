import 'package:flutter/material.dart';

class MyOrdersAppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  const MyOrdersAppBarBottom({
    super.key,
  });
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 60,);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: TabBar(
          indicator: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
          ),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          tabs: [
            Tab(text: 'Ongoing'),
            Tab(text: 'Completed'),
          ],
        ),
      ),
    );
  }
}
