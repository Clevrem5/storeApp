import 'package:flutter/material.dart';
import '../widgets/help_center_tile.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HelpCenterTile(
                iconPath: 'assets/icons/customer_service.png',
                title: 'Customer Service',
              ),
              SizedBox(height: 12),
              HelpCenterTile(
                iconPath: 'assets/icons/whatsapp.svg',
                title: 'Whatsapp',
              ),
              SizedBox(height: 12),
              HelpCenterTile(
                iconPath: 'assets/icons/website.svg',
                title: 'Website',
              ),
              SizedBox(height: 12),
              HelpCenterTile(
                iconPath: 'assets/icons/facebook.svg',
                title: 'Facebook',
              ),
              SizedBox(height: 12),
              HelpCenterTile(
                iconPath: 'assets/icons/twitter.svg',
                title: 'Twitter',
              ),
              SizedBox(height: 12),
              HelpCenterTile(
                iconPath: 'assets/icons/instagram.svg',
                title: 'Instagram',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
