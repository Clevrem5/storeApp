import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Data/models/home_page_model.dart';
import 'package:store_app/Features/Common_Widgets/store_tex.dart';
import 'package:store_app/Features/home_page/manager/home_page_bloc.dart';
import 'package:store_app/Features/home_page/manager/home_page_state.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/features/home_page/page/home_page_text_form_field.dart';

import '../../../core/navigation/routes.dart';
import '../../Common_Widgets/icon_button_like.dart';
import '../../Common_Widgets/store_bottom_navigation_bar.dart';
import '../../Common_Widgets/store_icons.dart';

class HomePageGridDetail extends StatelessWidget {
  const HomePageGridDetail({
    super.key, required this.store,
  });
  final ProductsModel store;

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
                  store.image,
                  width: 161.w,
                  height: 174.h,
                  // fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  width: 34.w,
                  height: 34.h,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: LikeButton(),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          store.title,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          store.price.toString(),
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
