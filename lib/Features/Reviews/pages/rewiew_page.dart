import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/Features/Common_Widgets/storeAppBar.dart';
import 'package:store_app/Features/Common_Widgets/store_tex.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: StoreAppBar(title: "Reviews"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 250.h,
              child: Column(
                spacing: 10.h,
                children: [
                  Row(
                    spacing: 10.h,
                    children: [
                      StoreText(
                        text: "4.0",
                        color: Colors.black,
                        fontSize: 64.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      Column(spacing: 5,
                        children: [
                          Row(spacing: 5,
                            mainAxisAlignment:MainAxisAlignment.start,
                            children: List.generate(
                              5,
                                  (index) =>
                                  SvgPicture.asset(
                                    "assets/icons/star_filled.svg",
                                    width: 23.w,
                                    height: 21.6.h,
                                  ),
                            ),
                          ),
                          StoreText(text: "1034 Ratings", color: Colors.grey,),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
