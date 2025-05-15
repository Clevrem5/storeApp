import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../Common_Widgets/store_tex.dart';

class ReviewSummary extends StatelessWidget {
  final double averageRating;
  final int totalRatings;
  final Map<int, int> ratingBreakdown;

  const ReviewSummary({
    super.key,
    required this.averageRating,
    required this.totalRatings,
    required this.ratingBreakdown,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StoreText(
                text: averageRating.toStringAsFixed(1),
                color: Colors.black,
                fontSize: 64.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(
                      5,
                      (index) => Padding(
                        padding: EdgeInsets.only(right: 4.w),
                        child: SvgPicture.asset(
                          "assets/icons/star_filled.svg",
                          width: 20.w,
                          height: 20.h,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  StoreText(
                    text: "$totalRatings Ratings",
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Column(
            children: List.generate(5, (index) {
              int star = 5 - index;
              int count = ratingBreakdown[star]!;
              double percent = totalRatings == 0 ? 0 : count / totalRatings;
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: Row(
                  children: [
                    Row(
                      children: List.generate(
                        star,
                        (_) => Icon(Icons.star, color: Colors.orange, size: 14.sp),
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Expanded(
                      child: LinearProgressIndicator(
                        value: percent,
                        color: Colors.black,
                        backgroundColor: Colors.grey.shade200,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
