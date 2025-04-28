import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/data/models/home_models/home_page_model.dart';

import '../../../Core/navigation/routes.dart';
import '../../Common_Widgets/icon_button_like.dart';
import '../../saved_page/manager/saved_bloc.dart';
import '../../saved_page/manager/saved_event.dart';
import '../manager/home_bloc.dart';

class ProductsItem extends StatelessWidget {
  const ProductsItem({
    super.key,
    required this.product,
  });

  final ProductsModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.image,
                  // "assets/images/image.png",
                  width: 161,
                  height: 174.h,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  width: 34.w,
                  height: 34.h,
                  decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: LikeButton<ProductsModel>(
                      item: product,
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
              )
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        InkWell(
          onTap: () {
            context.push(Routes.get(product.id));
          },
          child: Text(
            product.title,
            // "Regular Fit Slogan",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Text(
          '\$${product.price.toString()}',
          // "1,190",
          style: TextStyle(
            color: AppColors.hintText,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
