import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../Common_Widgets/storeAppBar.dart';
import '../../Common_Widgets/store_tex.dart';
import '../manager/review_bloc.dart';
import '../manager/review_state.dart';
import '../widgets/review_item.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productId = int.parse(GoRouterState
        .of(context)
        .pathParameters['productId']!);

    return BlocListener<ReviewBloc, ReviewState>(
      listener: (context, state) {
        if (state.status == ReviewStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to load reviews')),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: StoreAppBar(title: "Reviews"),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRatingSummary(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StoreText(color: Colors.black, text: "Reviews", fontWeight: FontWeight.bold),
                  DropdownButton<String>(
                    value: "Most Relevant",
                    items: ["Most Relevant", "Newest", "Highest", "Lowest"].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                    onChanged: (value) {},
                    underline: const SizedBox(),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: BlocBuilder<ReviewBloc, ReviewState>(
                  builder: (context, state) {
                    if (state.status == ReviewStatus.loading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state.reviews.isEmpty) {
                      return const Center(child: Text("No reviews found."));
                    }

                    return ListView.builder(
                      itemCount: state.reviews.length,
                      itemBuilder: (context, index) {
                        final review = state.reviews[index];
                        return ReviewItem(
                          name: review.userFullName,
                          date: "${review.created.day}/${review.created.month}/${review.created.year}",
                          stars: review.rating.toInt(),
                          comment: review.comment,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRatingSummary() {
    return SizedBox(
      height: 250.h,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StoreText(
                text: "4.0",
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
                          (index) =>
                          Padding(
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
                    text: "1034 Ratings",
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
              double percent = [0.7, 0.4, 0.2, 0.1, 0.05][index];
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
