import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Core/utils/app_colors.dart';
import 'package:store_app/Features/Common_Widgets/storeAppBar.dart';
import 'package:store_app/Features/Common_Widgets/store_icons.dart';
import 'package:store_app/Features/Common_Widgets/store_tex.dart';
import 'package:store_app/Features/details/manager/details_bloc.dart';
import 'package:store_app/Features/details/manager/details_state.dart';

import '../../../Core/navigation/routes.dart';
import '../../../data/models/details model/details_model.dart';
import '../../Common_Widgets/icon_button_like.dart';
import '../../home_page/manager/home_bloc.dart';
import '../../saved_page/manager/saved_bloc.dart';
import '../../saved_page/manager/saved_event.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({super.key});

  final List salom = ["M", "S", "L"];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsBloc, DetailsState>(
      builder: (context, state) {
        if (state.status == DetailsStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.status == DetailsStatus.error) {
          return const StoreText(text: "xato Balam", color: AppColors.black);
        }
        return Scaffold(
          backgroundColor: AppColors.white,
          extendBody: true,
          appBar: StoreAppBar(title: "Details"),
          body: Padding(
            padding: const EdgeInsets.only(top: 20, left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 368.h,
                  child: Stack(
                    children: [
                      PageView(
                        children: List.generate(
                          state.details!.productImages.length,
                          (index) => ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: state.details!.productImages[index].image,
                              width: double.infinity.w,
                              height: 368.h,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                            // child: Image.network(
                            //   state.details!.productImages[index].image,
                            //   width: double.infinity.w,
                            //   height: 368.h,
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 7,
                        right: 10,
                        child: Container(
                          width: 48.w,
                          height: 48.h,
                          decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(10)),
                          child: LikeButton<DetailsModel>(
                            item: state.details!,
                            isLiked: (item) => item.isLiked,
                            getId: (item) => item.id,
                            onLike: (item) {
                              context.read<HomeBloc>().add(LikeSaveEvent(likeId: item.id));
                              context.read<SavedBloc>().add(SavedLoad());
                            },
                            onUnlike: (item) {
                              context.read<HomeBloc>().add(LikeUnSaveEvent(unLikeId: item.id));
                              context.read<SavedBloc>().add(SavedLoad());
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                StoreText(
                  text: state.details!.title,
                  color: AppColors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: 13.h,
                ),
                GestureDetector(
                  onTap: () {
                    context.push(Routes.getReview(state.details!.id));
                  },
                  child: Row(
                    children: [
                      StoreIcons(
                        icons: "assets/icons/star_filled.svg",
                        color: Colors.amber,
                        callback: () {},
                      ),
                      SizedBox(width: 2.w),
                      StoreText(
                        text: state.details!.rating.toStringAsFixed(1),
                        color: AppColors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(width: 3.h),
                      StoreText(
                        text: '(${state.details!.reviewsCount.toString()} reviews)',
                        color: AppColors.hintText,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 13.h),
                StoreText(
                  text: state.details!.description,
                  color: AppColors.hintText,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: 12.h,
                ),
                StoreText(
                  text: "Choose size",
                  color: AppColors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  spacing: 5.sp,
                  children: List.generate(
                    salom.length,
                    (index) => Container(
                      width: 50.w,
                      height: 47.h,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.buttonBorder, width: 1)),
                      child: Center(
                        child: StoreText(
                          text: salom[index],
                          color: AppColors.black,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: Container(
            width: double.infinity.w,
            height: 95.h,
            decoration: BoxDecoration(color: AppColors.white, border: Border(top: BorderSide(color: AppColors.bottomBorder, width: 1.5))),
            child: Padding(
              padding: const EdgeInsets.only(top: 22, left: 24, right: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      StoreText(
                        text: "Price",
                        color: AppColors.hintText,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      StoreText(
                        text: "\$ ${state.details!.price.toString()}",
                        color: AppColors.black,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  SizedBox(
                    width: 240.w,
                    height: 54.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          StoreIcons(
                            icons: "assets/icons/bag.svg",
                            color: AppColors.white,
                            callback: () {},
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          StoreText(
                            text: "Add to Cart",
                            color: AppColors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
