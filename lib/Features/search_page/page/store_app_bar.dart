import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Features/Common_Widgets/store_svg_button.dart';
import 'package:store_app/core/utils/app_colors.dart';

import '../../../core/navigation/routes.dart';

class StoreAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StoreAppBar({super.key, required this.text, this.actions});

  final String text;
  final List<Widget>? actions;

  @override
  Size get preferredSize => Size(double.infinity, 60);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            context.push(Routes.home);
          },
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.arrow_back,
            size: 25,
          ),
        ),
        centerTitle: true,
        title: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: actions ??
            [
              StoreSvgButton(
                svg: "assets/icons/notification.svg",
                callback: () => context.push(Routes.notification),
              )
            ],
      ),
    );
  }
}
