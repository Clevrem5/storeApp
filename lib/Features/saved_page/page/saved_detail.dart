import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Features/home_page/widgets/products_item.dart';
import 'package:store_app/Features/saved_page/manager/saved_bloc.dart';
import 'package:store_app/Features/saved_page/manager/saved_state.dart';

import '../../../Core/navigation/routes.dart';
import '../../../Core/utils/app_colors.dart';
import '../../Common_Widgets/storeAppBar.dart';
import '../../Common_Widgets/store_bottom_navigation_bar.dart';
import '../../Common_Widgets/store_tex.dart';

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
      body: BlocBuilder<SavedBloc, SavedState>(builder: (context, state) {
        return switch (state.status) {
          null => throw UnimplementedError(),
          SavedStatus.idle => GridView.builder(
              itemCount: state.saved.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 19,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) => ProductsItem(
                product: state.saved[index],
              ),
            ),
          SavedStatus.error => StoreText(
              text: "xato",
              color: Colors.black,
            ),
          SavedStatus.loading => Center(
              child: CircularProgressIndicator(),
            ),
        };
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
