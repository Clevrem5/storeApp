import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Features/Common_Widgets/storeAppBar.dart';

import '../../../Core/navigation/routes.dart';
import '../../Common_Widgets/store_bottom_navigation_bar.dart';
import 'my_orders_app_bar_bottom.dart';

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
          bottom:  MyOrdersAppBarBottom(),
        ),
        body: TabBarView(
          children: [
            OngoingOrders(),
            CompletedOrders(),
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
    return ListView.separated(
      itemCount: 5,
      separatorBuilder: (context, index) => SizedBox(
        height: 10,
      ),
      padding: EdgeInsets.all(12),
      itemBuilder: (context, index) => Column(
        children: [
          OrderItem(
            imageUrl: 'assets/images/image.png',
            title: 'Regular Fit Slogan',
            size: 'M',
            price: '1,190',
            status: 'In Transit',
          ),
        ],
      ),
    );
  }
}

class CompletedOrders extends StatelessWidget {
  const CompletedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        CompletedOrderItem(
          imageUrl: 'assets/images/image.png',
          title: 'Regular Fit Slogan',
          size: 'M',
          price: '1,190',
          isRated: false,
        ),
        CompletedOrderItem(
          imageUrl: 'assets/images/image.png',
          title: 'Regular Fit Polo',
          size: 'L',
          price: '1,100',
          isRated: true,
          rating: 4.5,
        ),
        CompletedOrderItem(
          imageUrl: 'assets/images/image.png',
          title: 'Regular Fit Black',
          size: 'L',
          price: '1,690',
          isRated: false,
        ),
        CompletedOrderItem(
          imageUrl: 'assets/images/image.png',
          title: 'Regular Fit V-Neck',
          size: 'S',
          price: '1,290',
          isRated: false,
        ),
        CompletedOrderItem(
          imageUrl: 'assets/images/image.png',
          title: 'Regular Fit Pink',
          size: 'M',
          price: '1,341',
          isRated: true,
          rating: 3.5,
        ),
      ],
    );
  }
}

class OrderItem extends StatelessWidget {
  final String imageUrl, title, size, price, status;

  const OrderItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.size,
    required this.price,
    required this.status,
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
          Image(image: AssetImage(imageUrl)),
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
                onPressed: () {},
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

  const CompletedOrderItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.size,
    required this.price,
    required this.isRated,
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
          Image.asset(imageUrl, width: 60, height: 60),
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
                      onPressed: () {},
                      child: Text('Leave Review'),
                    ),
            ],
          )
        ],
      ),
    );
  }
}
