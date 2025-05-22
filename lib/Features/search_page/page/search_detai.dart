import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:store_app/Features/search_page/bloc/search_bloc.dart';
import 'package:store_app/Features/search_page/bloc/search_event.dart';
import 'package:store_app/Features/search_page/bloc/search_state.dart';
import 'package:store_app/core/navigation/routes.dart';
import 'package:store_app/core/utils/app_colors.dart';

import '../../Common_Widgets/storeAppBar.dart';
import '../../Common_Widgets/store_bottom_navigation_bar.dart';
import '../../home_page/widgets/home_page_text_form_field.dart';
import '../../myCart/presentation/page/cart_detail_empty.dart';

class SearchDetail extends StatefulWidget {
  const SearchDetail({super.key});

  @override
  State<SearchDetail> createState() => _SearchDetailState();
}

class _SearchDetailState extends State<SearchDetail> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<SearchBloc>().add(SearchLoading(title: null));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      extendBody: true,
      appBar: StoreAppBar(title: "Search",
          callback: () => context.pop(),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 12),
            HomePageTextFormField(
              width: double.infinity,
              controller: _controller,
              onChanged: (val) {
                context.read<SearchBloc>().add(SearchLoading(title: val));
              },
            ),
            const SizedBox(height: 12),
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state.status == SearchStatus.loading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (_controller.text.isEmpty) {
                    return _buildRecentSearches(state.recently);
                  }

                  if (state.product.isEmpty) {
                    return const StoreAppPageEmpty(
                      text: 'No Results Found!',
                      bio: "Try similar word or something more general.",
                      icon: Icons.search,
                    );
                  }

                  return _buildSearchResults(state);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: StoreBottomNavigationBar(
        selectedIndex: 1,
        onTap: (index) {
          final routes = [
            Routes.home,
            Routes.search,
            Routes.saved,
            Routes.cart,
            Routes.account,
          ];
          context.push(routes[index]);
        },
      ),
    );
  }

  Widget _buildRecentSearches(List<String> recent) {
    if (recent.isEmpty) {
      return const Center(child: Text("No recent searches."));
    }
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Recent Searches', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            TextButton(
              onPressed: () {
                context.read<SearchBloc>().add(SearchClearHistory());
              },
              child: const Text(
                'Clear all',
                style: TextStyle(color: Colors.black54),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ...recent.map(
              (item) => ListTile(
            leading: const Icon(Icons.history, size: 20),
            title: Text(item),
            trailing: IconButton(
              icon: const Icon(Icons.close, size: 16),
              onPressed: () {
                final box=Hive.box<String>("searchHistory");
                box.delete(item);setState(() {

                });
                // context.read<SearchBloc>().add(SearchDeleteItem(item));  // O'chirish
              },
            ),
            onTap: () {
              _controller.text = item;
              context.read<SearchBloc>().add(SearchLoading(title: item));  // So'zni qidirish
            },
          ),
        ),
      ],
    );
  }


  Widget _buildSearchResults(SearchState state) {
    return ListView.builder(
      itemCount: state.product.length,
      itemBuilder: (context, index) {
        final product = state.product[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: product.image,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator(strokeWidth: 2)),
              errorWidget: (context, url, error) =>
              const Icon(Icons.image_not_supported_outlined),
            ),
          ),
          title: InkWell(
            onTap: () {
              final box=Hive.box<String>("searchHistory");
              box.put(_controller.text.trim(), _controller.text.trim());
              context.push(Routes.get(product.id));
            },
            child: Text(
              product.title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          subtitle: Text('\$${product.price} - ${product.discount}%'),
        );
      },
    );
  }
}
