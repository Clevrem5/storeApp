import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Core/utils/app_colors.dart';
import 'package:store_app/Features/Common_Widgets/store_app_bar.dart';

class ResetEmailPage extends StatelessWidget {
  const ResetEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: StoreAppBar(
        title: "",
        actions: "",
        leading: "assets/icons/back.svg",
        leadingCallBack: () => context.pop,
        actionsCallBack: () {},
      ),

    );
  }
}
