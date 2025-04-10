import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/Core/utils/app_colors.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  String selectedSize = "S";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text("Details", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 24, left: 24),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/image.png',
                          width: double.infinity.w,
                          height: 368.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        right: 16,
                        top: 16,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.favorite_border),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Regular Fit Slogan",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.orange, size: 16),
                            SizedBox(width: 4),
                            Text("4.0/5 (45 reviews)", style: TextStyle(fontSize: 14)),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          "The name says it all, the right size slightly snugs the body leaving enough room for comfort in the sleeves and waist.",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 16),
                        Text("Choose size", style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: ["S", "M", "L"].map((size) {
                        final isSelected = selectedSize == size;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            label: Text(size),
                            selected: isSelected,
                            onSelected: (_) {
                              setState(() {
                                selectedSize = size;
                              });
                            },
                            selectedColor: Colors.black,
                            labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Price", style: TextStyle(fontSize: 14, color: Colors.grey)),
                  const Text("\$1,190", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.shopping_bag),
                label: const Text("Add to Cart"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
