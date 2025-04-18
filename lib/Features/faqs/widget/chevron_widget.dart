import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Core/utils/app_colors.dart';
import '../../Common_Widgets/store_tex.dart';

class CustomExpansionTile extends StatefulWidget {
  final String title;
  final String description;

  const CustomExpansionTile({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: AppColors.buttonBorder, width: 1.5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ExpansionTile(
          tilePadding: EdgeInsets.symmetric(horizontal: 20),
          childrenPadding: EdgeInsets.fromLTRB(20, 9, 20, 14),
          trailing: SvgPicture.asset(
            _isExpanded
                ? "assets/icons/chevron_on.svg"
                : "assets/icons/chevron_off.svg",
          ),
          onExpansionChanged: (expanded) {
            setState(() {
              _isExpanded = expanded;
            });
          },
          backgroundColor: AppColors.white,
          collapsedBackgroundColor: AppColors.white,
          title: StoreText(
            text: widget.title,
            color: AppColors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          children: [
            StoreText(
              text: widget.description,
              color: AppColors.hintText,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
