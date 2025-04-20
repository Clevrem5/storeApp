import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Features/Auth/login/widget/value_listenable_builder.dart';
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

  final TextEditingController cont = TextEditingController();

  final texlar = ["All", "Tshirts", "Jeans", "Shoes", "Hoodie"];
  final ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);
  final ValueNotifier<RangeValues> selectedPriceRangeNotifier = ValueNotifier(const RangeValues(0, 4000));
  final ValueNotifier<RangeValues> appliedPriceRangeNotifier = ValueNotifier(const RangeValues(0, 4000));
  final ValueNotifier<int?> selectedSizeIdNotifier = ValueNotifier(null);

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
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.status == HomeStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status == HomeStatus.error) {
              return const StoreText(text: "Xato chiqdi", color: Colors.red);
            }

            return ValueListenableBuilder2<int, RangeValues>(
              first: selectedIndexNotifier,
              second: appliedPriceRangeNotifier,
              builder: (context, selectedIndex, appliedPriceRange, _) {
                return Column(
                  children: [
                    Row(
                      children: [
                        HomePageTextFormField(controller: cont),
                        SizedBox(width: 8.h),
                        SizedBox(
                          width: 52.w,
                          height: 52.h,
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => ValueListenableBuilder<RangeValues>(
                                  valueListenable: selectedPriceRangeNotifier,
                                  builder: (context, rangeValues, _) {
                                    return Container(
                                      width: double.infinity,
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
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                StoreIcons(
                                                  icons: "assets/icons/cancel.svg",
                                                  color: AppColors.black,
                                                  callback: () => context.pop(),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 14),
                                            Divider(color: AppColors.buttonBorder, height: 1.3),
                                            SizedBox(height: 14),
                                            StoreText(
                                              text: "Price",
                                              color: AppColors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            SizedBox(height: 10),
                                            RangeSlider(
                                              values: rangeValues,
                                              min: 0,
                                              max: 4000,
                                              divisions: 4000,
                                              labels: RangeLabels(
                                                '\$${rangeValues.start.round()}',
                                                '\$${rangeValues.end.round()}',
                                              ),
                                              onChanged: (values) {
                                                selectedPriceRangeNotifier.value = values;
                                              },
                                              activeColor: AppColors.black,
                                              inactiveColor: AppColors.buttonBorder,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("\$${rangeValues.start.round()}"),
                                                Text("\$${rangeValues.end.round()}"),
                                              ],
                                            ),
                                            SizedBox(height: 20),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: AppColors.black,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(12),
                                                ),
                                                padding: const EdgeInsets.symmetric(vertical: 16),
                                              ),
                                              onPressed: () {
                                                appliedPriceRangeNotifier.value = selectedPriceRangeNotifier.value;
                                                context.pop();
                                              },
                                              child: StoreText(
                                                text: "Apply Filters",
                                                color: AppColors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                  'Size',
                                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                                ),
                                                const Spacer(),
                                                ValueListenableBuilder<int?>(
                                                  valueListenable: selectedSizeIdNotifier,
                                                  builder: (context, selectedSizeId, _) {
                                                    return DropdownButtonHideUnderline(
                                                      child: DropdownButton<int>(
                                                        value: selectedSizeId,
                                                        items: state.sizes!
                                                            .map((size) => DropdownMenuItem<int>(
                                                                  value: size.id,
                                                                  child: Text(size.title),
                                                                ))
                                                            .toList(),
                                                        onChanged: (value) {
                                                          selectedSizeIdNotifier.value = value;
                                                        },
                                                        hint: Row(
                                                          children: const [
                                                            Text("Select", style: TextStyle(fontSize: 18)),
                                                            SizedBox(width: 5),
                                                            Icon(Icons.arrow_drop_down),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  "assets/icons/filters.svg",
                                  color: AppColors.white,
                                  width: 26.w,
                                  height: 26.h,
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
                            itemCount: state.categories!.length,
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
                                    minimumSize: const Size(0, 0),
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: Text(
                                    state.categories![index].title,
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
                      child: ValueListenableBuilder2<RangeValues, int?>(
                        first: appliedPriceRangeNotifier,
                        second: selectedSizeIdNotifier,
                        builder: (context, appliedPriceRange, selectedSizeId, _) {
                          final filtered = state.products!.where(
                            (product) {
                              final price = product.price.toDouble();
                              final priceMatch = price >= appliedPriceRange.start && price <= appliedPriceRange.end;
                              final sizeMatch = selectedSizeId == null || product.id == selectedSizeId;
                              return priceMatch && sizeMatch;
                            },
                          ).toList();
                          if (filtered.isEmpty) {
                            return const Center(
                              child: StoreText(
                                text: "Mahsulot topilmadi",
                                color: AppColors.black,
                              ),
                            );
                          }

                          return GridView.builder(
                            itemCount: filtered.length,
                            padding: EdgeInsets.zero,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 19,
                              mainAxisSpacing: 20,
                            ),
                            itemBuilder: (context, index) => ProductsItem(product: filtered[index]),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: StoreBottomNavigationBar(
        selectedIndex: 0,
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
          }
        },
      ),
    );
  }
}
