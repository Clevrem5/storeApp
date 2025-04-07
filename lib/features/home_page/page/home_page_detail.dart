import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/features/home_page/page/home_page_text_form_field.dart';
import '../../../core/navigation/routes.dart';
import '../../Common_Widgets/icon_button_like.dart';
import '../../Common_Widgets/store_bottom_navigation_bar.dart';
import '../../Common_Widgets/store_icons.dart';

class HomePageDetail extends StatelessWidget {
  HomePageDetail({super.key});

  final texlar = [
    "All",
    "Tshirts",
    "Jeans",
    "Shoes",
    "Hoodie",
  ];

  final ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.white,
        leadingWidth: 150,
        leading: Center(
          child: Text(
            "Discover",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 32.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: StoreIcons(
              icons: "assets/icons/notification.svg",
              color: AppColors.black,
              callback: () => context.push(Routes.notification),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, right: 24, left: 24),
        child: Column(
          children: [
            Row(
              children: [
                HomePageTextFormField(),
                SizedBox(width: 8.h),
                Container(
                  width: 52.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/icons/filters.svg",
                      color: AppColors.white,
                      width: 24.w,
                      height: 24.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            SizedBox(
              height: 36,
              width: double.infinity,
              child: ValueListenableBuilder<int>(
                valueListenable: selectedIndexNotifier,
                builder: (context, selectedIndex, _) {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: texlar.length,
                    separatorBuilder: (context, index) => SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      final isSelected = selectedIndex == index;
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 6),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.black : AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.buttonBorder),
                        ),
                        child: TextButton(
                          onPressed: () {
                            selectedIndexNotifier.value = index;
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            texlar[index],
                            style: TextStyle(
                              color: isSelected
                                  ? AppColors.white
                                  : AppColors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 24.h),
            Expanded(
              child: ListView(
                children: [
                  GridView.builder(
                    itemCount: 8,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 19,
                        mainAxisSpacing: 20),
                    itemBuilder: (context, index) => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  "assets/images/image.png",
                                  width: 161,
                                  height: 174.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 12,
                                right: 12,
                                child: Container(
                                  width: 34.w,
                                  height: 34.h,
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(
                                    child: LikeButton(),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Regular Fit Slogan",
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "1,190",
                          style: TextStyle(
                            color: AppColors.hintText,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: StoreBottomNavigationBar(
        selectedIndex: 0, // Dynamically set index
        onTap: (index) {
          switch (index) {
            case 0:
              context.push(Routes.home);
              break;
            case 1:
              context.push(Routes.search);
              break;
            case 2:
              context.push(Routes.saved);
              break;
            case 3:
              context.push(Routes.cart);
              break;
            case 4:
              context.push(Routes.account);
              break;
            default:
              break;
          }
        },
      ),
    );
  }
}
