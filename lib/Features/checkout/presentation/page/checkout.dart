import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Core/utils/app_colors.dart';
import 'package:store_app/Features/Common_Widgets/storeAppBar.dart';
import 'package:store_app/core/navigation/routes.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String selectedPayment = 'Cash';
  bool select = false;
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  bool tanlangan = false;

  bool tanla(bool t) {
    setState(() {
      select = t;
    });
    return select;
  }

  @override
  Widget build(BuildContext context) {
    final String cardNumber="1212454515412525";
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: StoreAppBar(
        title: "Checkout",
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, right: 24, left: 24, top: 10),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Delivery Address", style: TextStyle(fontWeight: FontWeight.bold)),
                GestureDetector(
                  onTap: () {
                    context.push(Routes.address);
                  },
                  child: const Text("Change", style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ListTile(
              onTap: () {
                setState(() {
                  select == !select;
                });
              },
               textColor: Colors.black,
              selected: select,
              selectedColor: Colors.blue,
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.location_on),
              title: const Text(
                "Home",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: const Text("925 S Chugach St #APT 10, Alaska 99645"),
            ),
            const Divider(),
            const SizedBox(height: 8),
            const Text("Payment Method", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildPaymentButton("Card", Icons.credit_card),
                const SizedBox(width: 8),
                _buildPaymentButton("Cash", Icons.money),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 16),
            if (selectedPayment == 'Card') ...[
              TextField(
                controller: cardNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Card Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: expiryDateController,
                      decoration: InputDecoration(
                        labelText: "Expiry Date",
                        hintText: "MM/YY",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: cvvController,
                      decoration: InputDecoration(
                        labelText: "CVV",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      obscureText: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ] else ...[
              
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 15),
                    Text(
                      // "VISA **** **** **** 1234",
                      "Visa **** **** **** ${cardNumber.substring(cardNumber.length-4)}",
                      style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        context.push(Routes.paymentMethods);
                      },
                      icon: Icon(Icons.edit),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
            const Text("Order Summary", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _summaryRow("Sub-total", "\$5,870"),
            _summaryRow("VAT (%)", "\$0.00"),
            _summaryRow("Shipping fee", "\$80"),
            const Divider(),
            _summaryRow("Total", "\$5,950", isBold: true),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Enter promo code",
                      prefixIcon: const Icon(Icons.local_offer),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 84.w,
                  height: 52.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.black,
                    ),
                    child: const Text(
                      "Add",
                      style: TextStyle(color: AppColors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, right: 24, left: 24),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: () {},
          child: const Text("Place Order", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  Widget _buildPaymentButton(String type, IconData icon) {
    final bool isSelected = selectedPayment == type;
    return Expanded(
      child: ElevatedButton.icon(
        onPressed: () {
          setState(() {
            selectedPayment = type;
          });
        },
        icon: Icon(icon, color: isSelected ? Colors.white : Colors.black),
        label: Text(
          type,
          style: TextStyle(color: isSelected ? Colors.white : Colors.black),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.black : Colors.grey.shade200,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  Widget _summaryRow(String title, String amount, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: isBold ? const TextStyle(fontWeight: FontWeight.bold) : null),
          Text(amount, style: isBold ? const TextStyle(fontWeight: FontWeight.bold) : null),
        ],
      ),
    );
  }
}

class AddressSelectionPage extends StatelessWidget {
  const AddressSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text("Address", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text("Saved Address", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 16),
          _addressTile("Home", "925 S Chugach St #APT 10, Alaska 99645", true),
          _addressTile("Office", "2438 6th Ave, Ketchikan, Alaska 99901", false),
          _addressTile("Apartment", "2551 Vista Dr #B301, Juneau, Alaska 99801", false),
          _addressTile("Parent’s House", "4821 Ridge Top Cir, Anchorage, Alaska 99507", false),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text("Add New Address"),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              minimumSize: const Size.fromHeight(50),
            ),
            child: const Text("Apply", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _addressTile(String title, String subtitle, bool selected) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: const Icon(Icons.location_on),
        title: Row(
          children: [
            Text(title),
            const SizedBox(width: 6),
            if (title == "Home")
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text("Default", style: TextStyle(fontSize: 10)),
              ),
          ],
        ),
        subtitle: Text(subtitle),
        trailing: Radio<bool>(
          value: true,
          groupValue: selected,
          onChanged: (_) {},
        ),
      ),
    );
  }
}
