import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Features/Reviews/pages/review_summary.dart';

import '../../Common_Widgets/storeAppBar.dart';
import '../../Common_Widgets/store_tex.dart';
import '../manager/review_bloc.dart';
import '../manager/review_state.dart';
import '../widgets/review_item.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productId = int.parse(GoRouterState.of(context).pathParameters['productId']!);

    return BlocProvider(
      create: (context) => ReviewBloc(repo: context.read())..add(ReviewLoad(productId: productId)),
      child: BlocListener<ReviewBloc, ReviewState>(
        listener: (context, state) {
          if (state.status == ReviewStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Failed to load reviews')),
            );
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: StoreAppBar(
            title: "Reviews",
            callback: () => context.pop(),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            child: BlocBuilder<ReviewBloc, ReviewState>(
              builder: (context, state) {
                if (state.status == ReviewStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.reviews.isEmpty) {
                  return const Center(child: Text("No reviews found."));
                }

                final reviews = state.reviews;
                final total = reviews.length;
                final average = _calculateAverageRating(reviews);
                final breakdown = _calculateRatingBreakdown(reviews);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReviewSummary(
                      averageRating: average,
                      totalRatings: total,
                      ratingBreakdown: breakdown,
                    ),
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
                      child: ListView.builder(
                        itemCount: reviews.length,
                        itemBuilder: (context, index) {
                          final review = reviews[index];
                          return ReviewItem(
                            name: review.userFullName,
                            date: "${review.created.day}/${review.created.month}/${review.created.year}",
                            stars: review.rating.toInt(),
                            comment: review.comment,
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  double _calculateAverageRating(List reviews) {
    if (reviews.isEmpty) return 0.0;
    final total = reviews.fold<num>(0, (sum, r) => sum + r.rating);
    return total / reviews.length;
  }

  Map<int, int> _calculateRatingBreakdown(List reviews) {
    final Map<int, int> breakdown = {1: 0, 2: 0, 3: 0, 4: 0, 5: 0};
    for (var r in reviews) {
      breakdown[r.rating.toInt()] = breakdown[r.rating.toInt()]! + 1;
    }
    return breakdown;
  }
}
