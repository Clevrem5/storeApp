import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Features/Common_Widgets/store_tex.dart';
import 'package:store_app/Features/home_page/widgets/products_item.dart';
import 'package:store_app/Features/myCart/presentation/page/cart_detail_empty.dart';
import 'package:store_app/Features/saved_page/manager/saved_bloc.dart';
import 'package:store_app/Features/saved_page/manager/saved_state.dart';

import '../../../Core/navigation/routes.dart';
import '../../../Core/utils/app_colors.dart';
import '../../Common_Widgets/storeAppBar.dart';
import '../../Common_Widgets/store_bottom_navigation_bar.dart';

class SavedDetail extends StatelessWidget {
  const SavedDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.white,
      appBar: StoreAppBar(
        title: "Saved",
        callback: () => context.pop(),
      ),
      body: BlocBuilder<SavedBloc, SavedState>(builder: (context, state) {
        if (state.status == SavedStatus.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.status == SavedStatus.idle) {
          if (state.saved.isEmpty) {
            return Center(
              child: StoreAppPageEmpty(
                text: "No Saved Items!",
                bio: "You don't have any saved items.\n"
                    "Go to home and some.",
                icon: Icons.heart_broken,
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: GridView.builder(
                itemCount: state.saved.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 19,
                  mainAxisSpacing: 24.h,
                  mainAxisExtent: 172.h,
                  childAspectRatio: 161 / 172,
                ),
                itemBuilder: (context, index) => ProductsItem(
                  product: state.saved[index],
                ),
              ),
            );
          }
        } else {
          return Center(
            child: StoreText(text: "xato bor", color: Colors.black),
          );
        }
      }),
      bottomNavigationBar: StoreBottomNavigationBar(
        selectedIndex: 2, // Dynamically set index
        onTap: (index) {
          switch (index) {
            case 0:
              context.push(Routes.home);
              break;
            case 1:
              context.push(Routes.search);
              break;
            case 2:
              context.push(Routes.saved);
              break;
            case 3:
              context.push(Routes.cart);
              break;
            case 4:
              context.push(Routes.account);
              break;
            default:
              break;
          }
        },
      ),
    );
  }
}

/*
*  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: GridView.builder(
                itemCount: state.saved.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 19,
                  mainAxisSpacing: 24.h,
                  mainAxisExtent: 172.h,
                  childAspectRatio: 161 / 172,
                ),
                itemBuilder: (context, index) => ProductsItem(
                  product: state.saved[index],
                ),
              ),
            ),*/
