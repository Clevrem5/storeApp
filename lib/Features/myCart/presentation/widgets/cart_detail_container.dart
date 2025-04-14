import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/Features/Common_Widgets/store_tex.dart';

class CartDetailContainer extends StatelessWidget {
  const CartDetailContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
        children: [
          Image.asset(
            "assets/images/image.png",
            width: 83.w,
            height: 79.h,
            fit: BoxFit.cover,
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
                        text: "Regular fit Slogan",
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                      StoreText(
                        text: "Size L",
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
                    text: "\$ 1.190",
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
                        text: "2",
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
  }
}
