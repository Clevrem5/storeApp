import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/Features/saved_page/manager/saved_bloc.dart';
import 'package:store_app/Features/saved_page/manager/saved_event.dart';

import '../../data/models/home_page_model.dart';
import '../home_page/manager/home_bloc.dart';

class LikeButton extends StatelessWidget {
  final ProductsModel product;

  const  LikeButton({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final isLiked = product.isLiked;

        return GestureDetector(
          onTap: () {
            if (isLiked) {
              context.read<HomeBloc>().add(LikeUnSaveEvent(unLikeId: product.id));
              context.read<SavedBloc>().add(SavedLoad());
            } else {
              context.read<HomeBloc>().add(LikeSaveEvent(likeId: product.id));
              context.read<SavedBloc>().add(SavedLoad());

            }
          },
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            transitionBuilder: (child, animation) => ScaleTransition(
              scale: animation,
              child: child,
            ),
            child: isLiked
                ? SvgPicture.asset(
                    "assets/icons/heart_filled.svg",
                    key: ValueKey('liked_${product.id}'),
                    width: 18,
                    height: 18,
                    colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
                  )
                : SvgPicture.asset(
                    "assets/icons/heart.svg",
                    key: ValueKey('unliked_${product.id}'),
                    width: 18,
                    height: 18,
              colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  ),
          ),
        );
      },
    );
  }
}
