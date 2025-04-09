import 'package:flutter/material.dart';
import 'package:store_app/Features/Auth/store_onboarding/page/store_app_elevated_button.dart';
import 'package:store_app/Features/search_page/page/store_app_bar.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBarTwo(text: "Checkout"),
      body: StoreAppElevatedButton(
        text: "text",
        callback: () {},
      ),
    );
  }
}
