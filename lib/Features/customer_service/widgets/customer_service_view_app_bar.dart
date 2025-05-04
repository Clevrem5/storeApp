import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomerServiceViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomerServiceViewAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Customer Service"),
      centerTitle: true,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.phone),
          onPressed: () {},
        ),
      ],
    );
  }
}
