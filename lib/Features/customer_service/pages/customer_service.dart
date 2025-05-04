import 'package:flutter/material.dart';
import 'package:store_app/Features/customer_service/widgets/customer_service_view_app_bar.dart';
import 'package:store_app/Features/customer_service/widgets/customer_service_view_body.dart';

class CustomerServiceView extends StatelessWidget {
  const CustomerServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomerServiceViewAppBar(),
      body: CustomerServiceViewBody(),
    );
  }
}
