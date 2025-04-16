import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../Core/navigation/routes.dart';
import '../../Common_Widgets/store_bottom_navigation_bar.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {},
          ),
          centerTitle: true,
          title: Text(
            'My Orders',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications_none, color: Colors.black),
              onPressed: () {},
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(text: 'Ongoing'),
                  Tab(text: 'Completed'),
                ],
              ),
            ),
          ),
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
    return ListView(
      padding: EdgeInsets.all(12),
      children: [
        OrderItem(
          imageUrl: 'https://via.placeholder.com/60',
          title: 'Regular Fit Slogan',
          size: 'M',
          price: '1,190',
          status: 'In Transit',
        ),
        OrderItem(
          imageUrl: 'https://via.placeholder.com/60',
          title: 'Regular Fit Polo',
          size: 'L',
          price: '1,100',
          status: 'Picked',
        ),
        OrderItem(
          imageUrl: 'https://via.placeholder.com/60',
          title: 'Regular Fit Black',
          size: 'L',
          price: '1,690',
          status: 'In Transit',
        ),
        OrderItem(
          imageUrl: 'https://via.placeholder.com/60',
          title: 'Regular Fit V-Neck',
          size: 'S',
          price: '1,290',
          status: 'Packing',
        ),
        OrderItem(
          imageUrl: 'https://via.placeholder.com/60',
          title: 'Regular Fit Pink',
          size: 'M',
          price: '1,341',
          status: 'Picked',
        ),
      ],
    );
  }
}

class CompletedOrders extends StatelessWidget {
  const CompletedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(12),
      children: [
        CompletedOrderItem(
          imageUrl: 'https://via.placeholder.com/60',
          title: 'Regular Fit Slogan',
          size: 'M',
          price: '1,190',
          isRated: false,
        ),
        CompletedOrderItem(
          imageUrl: 'https://via.placeholder.com/60',
          title: 'Regular Fit Polo',
          size: 'L',
          price: '1,100',
          isRated: true,
          rating: 4.5,
        ),
        CompletedOrderItem(
          imageUrl: 'https://via.placeholder.com/60',
          title: 'Regular Fit Black',
          size: 'L',
          price: '1,690',
          isRated: false,
        ),
        CompletedOrderItem(
          imageUrl: 'https://via.placeholder.com/60',
          title: 'Regular Fit V-Neck',
          size: 'S',
          price: '1,290',
          isRated: false,
        ),
        CompletedOrderItem(
          imageUrl: 'https://via.placeholder.com/60',
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
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
