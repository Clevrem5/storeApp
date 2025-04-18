import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrdersAppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  const MyOrdersAppBarBottom({super.key});

  @override
  Size get preferredSize => Size(double.infinity, 65.h);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 54.h,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: TabBar(
          dividerColor: Colors.transparent,
          indicator: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          labelColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelColor: Colors.grey,
          splashFactory: NoSplash.splashFactory,
          tabAlignment: TabAlignment.fill,
          indicatorPadding: EdgeInsets.zero,
          labelStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 14.sp,
            fontFamily: "GeneralSans",
            fontWeight: FontWeight.w600,
          ),
          tabs: const [
            Tab(text: 'Ongoing'),
            Tab(text: 'Completed'),
          ],
        ),
      ),
    );
  }
}
