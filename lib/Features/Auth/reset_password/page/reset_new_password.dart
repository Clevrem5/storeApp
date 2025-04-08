import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Core/navigation/routes.dart';
import 'package:store_app/Core/utils/app_colors.dart';
import 'package:store_app/Features/Common_Widgets/store_app_bar.dart';

import '../../../search_page/page/store_app_bar.dart';

class ResetNewPassword extends StatelessWidget {
  const ResetNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      extendBody: true,
      appBar:  StoreAppBar(
      text: "",
      actions: [],
    ),
    );
  }
}
