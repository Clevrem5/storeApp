import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Features/Common_Widgets/store_tex.dart';
import 'package:store_app/Features/home_page/manager/home_bloc.dart';
import 'package:store_app/Features/home_page/widgets/products_item.dart';
import 'package:store_app/core/utils/app_colors.dart';
import '../../../core/navigation/routes.dart';
import '../../Common_Widgets/store_bottom_navigation_bar.dart';
import '../../Common_Widgets/store_icons.dart';
import '../widgets/home_page_text_form_field.dart';

class HomePageDetail extends StatelessWidget {
  HomePageDetail({super.key});

  final texlar = [
    "All",
    "Tshirts",
    "Jeans",
    "Shoes",
    "Hoodie",
  ];
  final TextEditingController cont = TextEditingController();
  final ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.white,
        leadingWidth: 200,
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
            padding: const EdgeInsets.symmetric(horizontal: 25),
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
                HomePageTextFormField(
                  controller: cont,
                ),
                SizedBox(width: 8.h),
                SizedBox(
                  width: 52.w,
                  height: 52.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          width: double.infinity.w,
                          height: 389.h,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30, right: 24, left: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: StoreText(
                                        text: "Filters",
                                        color: AppColors.black,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    StoreIcons(
                                      icons: "assets/icons/cancel.svg",
                                      color: AppColors.black,
                                      callback: () {
                                        context.pop();
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 14.h),
                                Divider(
                                  color: AppColors.buttonBorder,
                                  height: 1.3,
                                ),
                                SizedBox(height: 14.h),
                                StoreText(
                                  text: "Sort By",
                                  color: AppColors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
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
                                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
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
                                                  color: isSelected ? AppColors.white : AppColors.black,
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
                                SizedBox(
                                  height: 20.h,
                                ),
                                Divider(
                                  color: AppColors.buttonBorder,
                                  height: 1.3,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Center(
                      child: SizedBox(
                        width: double.infinity,
                        height: 25,
                        child: SvgPicture.asset(
                          // alignment: Alignment.center,
                          "assets/icons/back.svg",
                          color: AppColors.white,
                          width: 24.w,
                          height: 24.h,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
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
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
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
                              color: isSelected ? AppColors.white : AppColors.black,
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
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      return switch (state.status) {
                        HomeStatus.loading => Center(
                            child: CircularProgressIndicator(),
                          ),
                        HomeStatus.error => StoreText(
                            text: "Xato chiqdi",
                            color: Colors.red,
                          ),
                        HomeStatus.idle => GridView.builder(
                            itemCount: state.products!.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 19,
                              mainAxisSpacing: 20,
                            ),
                            itemBuilder: (context, index) => ProductsItem(
                              product: state.products![index],
                            ),
                          ),
                      };
                    },
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
