import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/Features/Common_Widgets/store_tex.dart';

class StoreAppTextFieldString extends StatelessWidget {
  const StoreAppTextFieldString({
    super.key,
    required this.controller,
    required this.validator,
    this.text='',
    this.hintText,
  });

  final TextEditingController controller;
  final String? Function(String? value) validator;
  final String text;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StoreText(
          text: text,
          color: Colors.black,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          line: 1,
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
