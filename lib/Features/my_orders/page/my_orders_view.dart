import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Features/Common_Widgets/storeAppBar.dart';

import '../../../Core/navigation/routes.dart';
import '../../Common_Widgets/store_bottom_navigation_bar.dart';
import '../manager/my_orders_bloc.dart';
import '../manager/my_orders_state.dart';
import '../widgets/my_orders_app_bar_bottom.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: StoreAppBar(
          title: "My Orders",
          callback: () => context.go(Routes.account),
          bottom: MyOrdersAppBarBottom(),
        ),
        body: TabBarView(
          children: [
            BlocProvider.value(
              value: BlocProvider.of<MyOrdersBloc>(context)..add(FetchOngoingOrders()),
              child: const OngoingOrders(),
            ),
            BlocProvider.value(
              value: BlocProvider.of<MyOrdersBloc>(context)..add(FetchCompletedOrders()),
              child: const CompletedOrders(),
            ),
          ],
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
        ),
      ),
    );
  }
}

class OngoingOrders extends StatelessWidget {
  const OngoingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrdersBloc, MyOrdersState>(
      builder: (context, state) {
        if (state.status == MyOrdersStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.status == MyOrdersStatus.error) {
          return const Center(child: Text('Error loading ongoing orders.'));
        } else if (state.orders.isEmpty) {
          return const Center(child: Text('No ongoing orders.'));
        }

        return ListView.separated(
          itemCount: state.orders.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          padding: const EdgeInsets.all(12),
          itemBuilder: (context, index) {
            final order = state.orders[index];
            return OrderItem(
              imageUrl: order.image,
              // You can replace with actual imageUrl from model
              title: order.title ?? 'Product',
              size: order.size ?? 'M',
              price: order.price.toString(),
              status: order.status ?? 'In Transit',
              callback: () {
                // Example: navigate to track page
              },
            );
          },
        );
      },
    );
  }
}

class CompletedOrders extends StatelessWidget {
  const CompletedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrdersBloc, MyOrdersState>(
      builder: (context, state) {
        if (state.status == MyOrdersStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.status == MyOrdersStatus.error) {
          return const Center(child: Text('Error loading completed orders.'));
        } else if (state.orders.isEmpty) {
          return const Center(child: Text('No completed orders.'));
        }

        return ListView.separated(
          padding: const EdgeInsets.all(20),
          itemCount: state.orders.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final order = state.orders[index];
            return CompletedOrderItem(
              rating: null,
              isRated: false,
              imageUrl: order.image,
              title: order.title ?? 'Product',
              size: order.size ?? 'M',
              price: order.price.toString(),
              callback: () {
                // Navigate to review
              },
            );
          },
        );
      },
    );
  }
}

class OrderItem extends StatelessWidget {
  final String imageUrl, title, size, price, status;
  final VoidCallback callback;

  const OrderItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.size,
    required this.price,
    required this.status,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342.w,
      height: 107.h,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Image(image: NetworkImage(imageUrl)),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    height: 1,
                  ),
                ),
                Text('Size $size'),
                Text('\$ $price', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  status,
                  style: TextStyle(fontSize: 12),
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: callback,
                child: Text('Track Order'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CompletedOrderItem extends StatelessWidget {
  final String imageUrl, title, size, price;
  final bool isRated;
  final double? rating;
  final VoidCallback callback;

  const CompletedOrderItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.size,
    required this.price,
    required this.isRated,
    required this.callback,
    this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Image.network(imageUrl, width: 60, height: 60),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text('Size $size'),
                Text('\$ $price', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Completed',
                  style: TextStyle(fontSize: 12, color: Colors.green),
                ),
              ),
              SizedBox(height: 8),
              isRated
                  ? Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star, size: 16, color: Colors.orange),
                          SizedBox(width: 4),
                          Text('${rating!.toStringAsFixed(1)}/5'),
                        ],
                      ),
                    )
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: callback,
                      child: Text('Leave Review'),
                    ),
            ],
          )
        ],
      ),
    );
  }
}
