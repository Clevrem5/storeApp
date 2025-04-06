import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/features/common/store_icons.dart';

import '../../core/navigation/routes.dart';

class StoreAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StoreAppBar({
    super.key,
    required this.title,
    required this.actions,
    required this.leading,
    required this.leadingCallBack,
    required this.actionsCallBack,
  });

  final String title, actions, leading;
  final VoidCallback leadingCallBack, actionsCallBack;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 24, right: 24),
      child: AppBar(
        toolbarHeight: 29,
        leadingWidth: 28,
        backgroundColor: AppColors.white,
        leading: StoreIcons(
          icons: leading,
          color: AppColors.black,
          callback: leadingCallBack,
        ),
        title: Center(
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: [
          StoreIcons(
            callback: actionsCallBack,
            icons: actions,
            color: AppColors.black,
            width: 28,
            height: 28,
          ),
        ],
      ),
    );
  }
}
