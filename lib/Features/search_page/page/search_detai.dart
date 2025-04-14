import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Features/myCart/presentation/page/cart_detail_empty.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/features/home_page/page/home_page_text_form_field.dart';
import '../../../core/navigation/routes.dart';
import '../../Common_Widgets/storeAppBar.dart';
import '../../Common_Widgets/store_bottom_navigation_bar.dart';

class SearchDetail extends StatefulWidget {
  const SearchDetail({super.key});

  @override
  State<SearchDetail> createState() => _SearchDetailState();
}

class _SearchDetailState extends State<SearchDetail> {
  final TextEditingController _controller = TextEditingController();
  String query = '';
  List<String> recent = ["Jeans", "Casual clothes", "Hoodie", "Nike shoes black", "V-neck tshirt", "Winter clothes"];
  List<String> products = [
    "Regular Fit Slogan",
    "Regular Fit Polo",
    "Regular Fit Black",
    "Regular Fit V-Neck",
  ];

  @override
  Widget build(BuildContext context) {
    final results = products.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();

    return Scaffold(
      backgroundColor: AppColors.white,
      extendBody: true,
      appBar: StoreAppBar(title: "Search"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 12),
            HomePageTextFormField(
              width: double.infinity,
              controller: _controller,
              onChanged: (val) => setState(() => query = val),
            ),
            if (query.isEmpty) _buildRecentSearches() else Expanded(child: _buildSearchResults(results)),
          ],
        ),
      ),
      bottomNavigationBar: StoreBottomNavigationBar(
        selectedIndex: 1,
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

  Widget _buildRecentSearches() {
    return Expanded(
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Recent Searches', style: TextStyle(fontWeight: FontWeight.bold)),
              TextButton(
                onPressed: () => setState(() => recent.clear()),
                child: const Text(
                  'Clear all',
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          ...recent.map(
            (item) => ListTile(
              title: Text(item),
              trailing: IconButton(
                icon: const Icon(Icons.delete_forever_outlined, size: 16),
                onPressed: () {
                  setState(() => recent.remove(item));
                },
              ),
              onTap: () {
                _controller.text = item;
                setState(() => query = item);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults(List<String> results) {
    if (results.isEmpty) {
      return StoreAppPageEmpty(
        text: 'No Results Found!',
        bio: "Try similar word or Something\n"
            "more general.",
        icon: Icons.search,
      );
    }
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            width: 60,
            height: 60,
            color: Colors.black,
            child: const Icon(Icons.image_not_supported_sharp),
          ),
          title: Text(results[index]),
          subtitle: Text('\$${index + 2}${index + 3}.00 - 6${index + 4}%'),
        );
      },
    );
  }
}
