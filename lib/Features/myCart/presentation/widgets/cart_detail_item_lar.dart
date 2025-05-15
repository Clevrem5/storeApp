import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/data/models/mycart/my_cart_model.dart';

import '../../../Common_Widgets/store_tex.dart';

class CartDetailItemLar extends StatelessWidget {
  const CartDetailItemLar({
    super.key,
    required this.myCart,
  });

  final MyCartModel myCart;

  @override
  Widget build(BuildContext context) {
    // final url="192.168.11.200";
    return SizedBox(
      width: double.infinity,
      height: 355.h,
      child: ListView.separated(
        itemBuilder: (context, index) {
          final item = myCart.items[index];
          return Container(
            width: 342.w,
            height: 107.h,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: Colors.grey.withValues(
                    alpha: 0.50,
                  ),
                  width: 0.8),
            ),
            child: Row(
              spacing: 10,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ //!!!
                CachedNetworkImage(
                  imageUrl: item.image,
                  // imageUrl: "http://$url:8888/uploads${item.image}",
                  width: 83.w,
                  height: 79.h,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(child: LinearProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      spacing: 70,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StoreText(
                              text: item.title,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                            StoreText(
                              text: "Size ${item.size}",
                              color: Colors.black.withValues(alpha: 0.30),
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.delete_forever_outlined,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 100,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StoreText(
                          text: "\$ ${item.price}",
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                        Row(
                          spacing: 5,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 24.w,
                                height: 22.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.withValues(alpha: 0.50),
                                    width: 0.8,
                                  ),
                                ),
                                child: Icon(
                                  Icons.remove,
                                  size: 20,
                                ),
                              ),
                            ),
                            StoreText(
                              text: "${item.quantity}",
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 24.w,
                                height: 22.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.withValues(alpha: 0.50),
                                    width: 0.8,
                                  ),
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) =>
            SizedBox(
              height: 15.h,
            ),
        itemCount: myCart.items.length,
      ),
    );
  }
}

