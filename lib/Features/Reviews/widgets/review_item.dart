import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewItem extends StatelessWidget {
  final String name;
  final String date;
  final int stars;
  final String comment;

  const ReviewItem({
    super.key,
    required this.name,
    required this.date,
    required this.stars,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: List.generate(
              stars,
              (_) => Icon(Icons.star, color: Colors.orange, size: 16.sp),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            comment,
            style: TextStyle(fontSize: 14.sp),
          ),
          SizedBox(height: 4.h),
          Text(
            "$name • $date",
            style: TextStyle(fontSize: 12.sp, color: Colors.grey),
          ),
          Divider(height: 20.h, thickness: 0.5),
        ],
      ),
    );
  }
}
