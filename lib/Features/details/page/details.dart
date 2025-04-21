import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/Core/utils/app_colors.dart';
import 'package:store_app/Features/Common_Widgets/storeAppBar.dart';
import 'package:store_app/Features/Common_Widgets/store_tex.dart';
import 'package:store_app/Features/details/manager/details_bloc.dart';
import 'package:store_app/Features/details/manager/details_state.dart';

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
          DetailsStatus.idle => Column(
              children: [
                Center(
                  child: StoreText(
                    text: state.details!.description,
                    color: Colors.black,
                  ),
                ),
              ],
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
