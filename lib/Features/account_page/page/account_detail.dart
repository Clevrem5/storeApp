// ... importlar
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Data/client.dart';
import 'package:store_app/Data/repository/Auth_repository.dart';
import 'package:store_app/Features/Common_Widgets/storeAppBar.dart';

import '../../../Core/navigation/routes.dart';
import '../../Common_Widgets/store_bottom_navigation_bar.dart';

class AccountDetail extends StatelessWidget {
  AccountDetail({super.key});

  final AuthRepository repo = AuthRepository(client: ApiClient());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: StoreAppBar(title: "Account",),
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
            onTap: () => context.push(Routes.myDetails),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Address Book'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => context.push(Routes.address),
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
            onTap: () => context.push(Routes.notificationPermission),
            // onTap: () => context.push(Routes.notification),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('FAQs'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            // onTap: () => context.push('/faqs'),
            onTap: () => context.push(Routes.faqs),
          ),
          ListTile(
            leading: const Icon(Icons.headset_mic_outlined),
            title: const Text('Help Center'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
 
            // onTap: () => context.push('/help'),

            onTap: () => context.push(Routes.helpCenter),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: () {
                showLogoutDialog(context, () {
                  Navigator.pop(context); // Dialogni yopish
                  repo.logOut();
                  context.go(Routes.login); // yoki pushReplacement
                });
              }),
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

void showLogoutDialog(BuildContext context, VoidCallback onLogout) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 60 ),
              const SizedBox(height: 16),
              const Text(
                'Logout?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                'Are you sure you want to logout?',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: onLogout,
                  child: const Text('Yes, Logout'),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: const BorderSide(color: Colors.grey),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('No, Cancel'),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
