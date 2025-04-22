import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/Core/utils/app_colors.dart';
import 'package:store_app/Features/Common_Widgets/icon_button_like.dart';
import 'package:store_app/Features/Common_Widgets/storeAppBar.dart';
import 'package:store_app/Features/Common_Widgets/store_tex.dart';
import 'package:store_app/Features/details/manager/details_bloc.dart';
import 'package:store_app/Features/details/manager/details_state.dart';
import 'package:store_app/data/models/detaisl_model.dart';

import '../../home_page/manager/home_bloc.dart';
import '../../saved_page/manager/saved_bloc.dart';
import '../../saved_page/manager/saved_event.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  String selectedSize = "S";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: StoreAppBar(title: "Details"),
      body: BlocBuilder<DetailsBloc, DetailsState>(
        builder: (context, state) => switch (state.status) {
          DetailsStatus.idle => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 10),
            child: Column(
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      SizedBox(
                        height: 368.53.h,
                        width: double.infinity,
                        child: PageView(
                          children: List.generate(
                            state.details?.productImages.length ?? 0,
                            (index) => ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                state.details!.productImages[index].image,
                                width: 341.w,
                                height: 368.53.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 7,
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
                    ],
                  ),
                ],
              ),
          ),
          DetailsStatus.error => Center(
                child: StoreText(
              text: "Xato chiqdi",
              color: Colors.black,
            )),
          DetailsStatus.loading => Center(
              child: CircularProgressIndicator(),
            ),
        },
      ),
    );
  }
}
