import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Features/home_page/widgets/products_item.dart';
import 'package:store_app/Features/myCart/presentation/page/cart_detail_empty.dart';

import '../../../Core/navigation/routes.dart';
import '../../../Core/utils/app_colors.dart';
import '../../Common_Widgets/storeAppBar.dart';
import '../../Common_Widgets/store_bottom_navigation_bar.dart';
import '../../home_page/manager/home_bloc.dart';
class SavedDetail extends StatelessWidget {
  const SavedDetail({super.key});

  // bool isLoad = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.white,
      appBar: StoreAppBar(
        title: "Saved",
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.status == HomeStatus.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == HomeStatus.idle) {
            if (state.saved.isEmpty) {
              return Center(
                child: StoreAppPageEmpty(
                  text: "No Saved Items!",
                  bio: "You don’t have any saved items.\nGo to home and add some.",
                  icon: Icons.favorite_border,
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                child: GridView.builder(
                  itemCount: state.saved.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 19,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) => ProductsItem(
                    product: state.saved[index],
                  ),
                ),
              );
            }
          } else {
            return Center(
              child: Text("xato"),
            );
          }
        },
      ),
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
