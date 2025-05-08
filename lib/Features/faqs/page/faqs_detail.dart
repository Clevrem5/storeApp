import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Core/utils/app_colors.dart';
import 'package:store_app/Features/Common_Widgets/storeAppBar.dart';
import '../../../Core/navigation/routes.dart';
import '../../Common_Widgets/store_bottom_navigation_bar.dart';
import '../../home_page/widgets/home_page_text_form_field.dart';
import '../widget/chevron_widget.dart';

class FaqsDetail extends StatelessWidget {
  final texlar = ["General", "Account", "Service", "Payment"];
  final ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);
  final TextEditingController _controller = TextEditingController();

  FaqsDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        extendBody: true,
        appBar: StoreAppBar(title: "FAQs"),
        body: Padding(
          padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
          child: Column(
            children: [
              Divider(
                color: AppColors.buttonBorder,
                height: 1.5.h,
              ),
              SizedBox(
                height: 24.h,
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
                              minimumSize: const Size(0, 0),
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
                height: 26.h,
              ),
              HomePageTextFormField(
                width: double.infinity,
                controller: _controller,
                // onChanged: (val) => setState(() => query = val),
              ),
              SizedBox(
                height: 16.h,
              ),
              Expanded(
                child: ListView(
                  children: [
                    CustomExpansionTile(
                      title: "How do I make a purchase",
                      description: 'When you find a product you want to purchase, tap on it to view the product details. '
                          'Check the price, description, and available options (if applicable), and then tap the '
                          '"Add to Cart" button. Follow the on-screen instructions to complete the purchase, including '
                          'providing shipping details and payment information.',
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    CustomExpansionTile(
                      title: "What payment methods are accepted?",
                      description: 'When you find a product you want to purchase, tap on it to view the product details. '
                          'Check the price, description, and available options (if applicable), and then tap the '
                          '"Add to Cart" button. Follow the on-screen instructions to complete the purchase, including '
                          'providing shipping details and payment information.',
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    CustomExpansionTile(
                      title: "Can I cancel or return an order?",
                      description: 'When you find a product you want to purchase, tap on it to view the product details. '
                          'Check the price, description, and available options (if applicable), and then tap the '
                          '"Add to Cart" button. Follow the on-screen instructions to complete the purchase, including '
                          'providing shipping details and payment information.',
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    CustomExpansionTile(
                      title: "How can I contact customer support for assistance?",
                      description: 'When you find a product you want to purchase, tap on it to view the product details. '
                          'Check the price, description, and available options (if applicable), and then tap the '
                          '"Add to Cart" button. Follow the on-screen instructions to complete the purchase, including '
                          'providing shipping details and payment information.',
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    CustomExpansionTile(
                      title: "What payment methods are accepted?",
                      description:
                      'When you find a product you want to purchase, tap on it to view the product details. '
                          'Check the price, description, and available options (if applicable), and then tap the '
                          '"Add to Cart" button. Follow the on-screen instructions to complete the purchase, including '
                          'providing shipping details and payment information.',
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    CustomExpansionTile(
                      title: "How do I track my orders?",
                      description:
                      'When you find a product you want to purchase, tap on it to view the product details. '
                          'Check the price, description, and available options (if applicable), and then tap the '
                          '"Add to Cart" button. Follow the on-screen instructions to complete the purchase, including '
                          'providing shipping details and payment information.',
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    CustomExpansionTile(
                      title: "How do I create an account?",
                      description:
                      'When you find a product you want to purchase, tap on it to view the product details. '
                          'Check the price, description, and available options (if applicable), and then tap the '
                          '"Add to Cart" button. Follow the on-screen instructions to complete the purchase, including '
                          'providing shipping details and payment information.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: StoreBottomNavigationBar(
          selectedIndex: 4,
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
        ));
  }
}
