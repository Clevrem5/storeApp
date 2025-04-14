import 'package:flutter/material.dart';

class StoreAppPageEmpty extends StatelessWidget {
  const StoreAppPageEmpty({
    super.key,
    required this.text,
    required this.bio,
    required this.icon,
  });

  final String text, bio;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade200,
            ),
            child: Icon(
              icon,
              // Icons.add_shopping_cart,
              size: 50,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 20),
          Text(
            text,
            // "Your Cart is empty!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            bio,
            // "When you added product they'll\n "
            // "appear here.",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
