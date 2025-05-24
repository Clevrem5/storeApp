import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Features/Common_Widgets/storeAppBar.dart';
import 'package:store_app/Features/myCart/manager/my_cart_bloc.dart';
import 'package:store_app/Features/myCart/manager/my_cart_state.dart';
import 'package:store_app/Features/myCart/presentation/page/card_items.dart';
import 'package:store_app/Features/myCart/presentation/page/cart_detail_calculate.dart';
import 'package:store_app/Features/myCart/presentation/page/store_new_navigation_bar.dart';
import 'package:store_app/core/utils/app_colors.dart';

import 'cart_detail_empty.dart';

class CartDetail extends StatefulWidget {
  const CartDetail({super.key});

  @override
  State<CartDetail> createState() => _CartDetailState();
}

class _CartDetailState extends State<CartDetail> {
  bool isNotEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: StoreAppBar(
        title: "My Cart",
        callback: () => context.pop(),
      ),
      backgroundColor: AppColors.white,
      body: BlocBuilder<MyCartBloc, MyCartState>(builder: (context, state) {
        final myCart = state.data;
        if (state.status == MyCartStatus.loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.status == MyCartStatus.idle) {
          return isNotEmpty == true
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 10,
                  ),
                  child: Column(
                    spacing: 10,
                    children: [
                      // CartDetailItemLar(myCart: state.data!),
                      SizedBox(
                        width: double.infinity,
                        height: 355.h,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            height: 15.h,
                          ),
                          itemCount: state.data!.items.length,
                          itemBuilder: (context, index) {
                            final item = state.data!.items[index];
                            return CardItems(item: item);
                          },
                        ),
                      ),
                      CartDetailCalculate(myCart: myCart!),
                    ],
                  ),
                )
              : StoreAppPageEmpty(
                  text: "Your Cart is empty!",
                  bio: "When you added product they'll\n "
                      "appear here.",
                  icon: Icons.shopping_cart,
                );
        } else {
          return Center(child: Text("Xato chiqdi!!!"));
        }
      }),
      bottomNavigationBar: StoreNewNavigationBar(
        index: 3,
      ),
    );
  }
}
