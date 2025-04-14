import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Features/Auth/store_onboarding/page/store_app_elevated_button.dart';
import 'package:store_app/Features/Common_Widgets/store_app_bar.dart';
import 'package:store_app/Features/Common_Widgets/store_tex.dart';

import '../../../../Core/navigation/routes.dart';
import '../../../../data/models/adress_model.dart';

class AddressView extends StatefulWidget {
  const AddressView({super.key});

  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  int? isSelected;
  List<Address> address = [];

  @override
  void initState() {
    super.initState();
    address = [
      Address(title: "Tashkent", bio: "Chilonzordagi Najot Ta'limga hush kelibsiz!!!"),
      Address(title: "Andijon", bio: "Bobur yurti"),
      Address(title: "Namangan", bio: "Gullar shahri "),
      Address(title: "Samarqand", bio: "BMT ning qadimiy shaharlaridan biri"),
      Address(title: "Xiva", bio: "Juda ko'p tarixiy binolari bilan mashxur"),
      Address(title: "Qoraqalpog'iston", bio: "Avtonom Respublika asosan Qoraqalpoqlar yashaydi!"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: StoreAppBarTwo(
        text: "Address",
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StoreText(
              text: "Saved address",
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
            SizedBox(height: 15.h),
            SizedBox(
              width: double.infinity,
              height: 360.h,
              child: ListView.separated(
                itemCount: address.length,
                itemBuilder: (context, index) {
                  final addresses = address[index];
                  return Container(
                    width: 341.w,
                    height: 76.h,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey.withValues(alpha: 0.45),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/map_pin.svg",
                          width: 18.w,
                          height: 22.h,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              StoreText(
                                text: addresses.title,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                              ),
                              StoreText(
                                line: 1,
                                text: addresses.bio,
                                color: Colors.black.withValues(alpha: 0.35),
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                              ),
                            ],
                          ),
                        ),
                        Radio<int>(
                          value: index,
                          groupValue: isSelected,
                          onChanged: (value) {
                            setState(() {
                              isSelected = value!;
                            });
                          },
                          activeColor: Colors.black,
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
              ),
            ),
            StoreAppElevatedButton(
              text: "+ Add New Address",
              callback: () {
                setState(() {
                  final index=address.length+1;
                  address.add(
                    Address(
                      title: "yangi adres $index",
                      bio: 'zor',
                    ),
                  );
                });
              },
              backRoundColor: Colors.white,
              radius: 15,
            ),
          ],
        ),
      ),
      bottomNavigationBar: StoreAppElevatedButton(
        text: "Apply",
        callback: () {
          context.push(Routes.newAddress);
          // if (isSelected != null) {
          //   setState(() {
          //     address.removeAt(isSelected!);
          //     isSelected = null; // tanlangan holatni tiklash
          //   });
          //
          //   ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(
          //       content: Text("Manzil o'chirildi"),
          //     ),
          //   );
          // } else {
          //   ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(
          //       content: Text("Iltimos, manzildan birini tanlang"),
          //     ),
          //   );
          // }
        },
        radius: 10,
      ),
    );
  }
}
