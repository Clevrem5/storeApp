import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../Core/navigation/routes.dart';
import '../../Common_Widgets/store_bottom_navigation_bar.dart';

class AccountDetail extends StatelessWidget {
  const AccountDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Account', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.notifications_none),
          )
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.inventory_2_outlined),
            title: const Text('My Orders'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => context.push(Routes.myOrders),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('My Details'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => context.push('/details'),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Address Book'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => context.push('/address'),
          ),
          ListTile(
            leading: const Icon(Icons.credit_card_outlined),
            title: const Text('Payment Methods'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => context.push(Routes.checkout),
          ),
          ListTile(
            leading: const Icon(Icons.notifications_none),
            title: const Text('Notifications'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => context.push(Routes.notificationPermision),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('FAQs'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => context.push(Routes.home),
          ),
          ListTile(
            leading: const Icon(Icons.headset_mic_outlined),
            title: const Text('Help Center'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => context.push(Routes.helpCenter),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout', style: TextStyle(color: Colors.red)),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Confirm Logout'),
                  content: const Text('Are you sure you want to logout?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.push(Routes.login);
                        // Logout logikasi shu yerda bo'ladi
                      },
                      child: const Text('Logout'),
                    ),
                  ],
                ),
              );
            },
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
    );
  }
}
