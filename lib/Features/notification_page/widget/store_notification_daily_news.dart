import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../Common_Widgets/store_tex.dart';

class StoreNotificationDailyNews extends StatelessWidget {
  const StoreNotificationDailyNews({
    super.key,
    required this.type,
    required this.meaning,
    required this.icons,
    required this.typeColor,
    required this.meaningColor,
    required this.iconsColor,
    this.iconHeight = 25.0,
    this.iconWidth = 25.0,
    this.typeFontSize = 15.0,
    this.meaningFontSize = 15.0,
    this.typeWeight = FontWeight.w500,
    this.meaningWeight = FontWeight.w500,
  });

  final String type, meaning, icons;
  final Color typeColor, meaningColor, iconsColor;
  final double iconWidth, iconHeight, typeFontSize, meaningFontSize;
  final FontWeight typeWeight, meaningWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.network(
          icons,
          width: iconWidth,
          height: iconHeight,
          colorFilter: ColorFilter.mode(
            iconsColor,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(width: 13.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StoreText(
              text: type,
              color: typeColor,
              fontSize: typeFontSize.sp,
              fontWeight: typeWeight,
            ),
            StoreText(
              text: meaning,
              color: meaningColor,
              fontSize: meaningFontSize.sp,
              fontWeight: meaningWeight,
            ),
          ],
        )
      ],
    );
  }
}
