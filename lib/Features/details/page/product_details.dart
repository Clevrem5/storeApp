import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/Core/utils/app_colors.dart';
import 'package:store_app/Features/Common_Widgets/storeAppBar.dart';
import 'package:store_app/Features/Common_Widgets/store_tex.dart';
import 'package:store_app/Features/details/manager/details_bloc.dart';
import 'package:store_app/Features/details/manager/details_state.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      extendBody: true,
      appBar: StoreAppBar(title: "Details"),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 24, right: 24),
        child: BlocBuilder<DetailsBloc, DetailsState>(builder: (context, state) {
          if (state.status == DetailsStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == DetailsStatus.error) {
            return const StoreText(text: "xato Balam", color: AppColors.black);
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                state.details!.productImages[1].image,
              ),
              // ListView.builder(
              //   itemCount: state.details?.productImages.length ?? 0,
              //   itemBuilder: (context, index) =>
              // )
            ],
          );
        }),
      ),
    );
  }
}
