import 'package:birth_picker/birth_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/Core/utils/app_colors.dart';


class MyDetailsDateBirth extends StatelessWidget {
  const MyDetailsDateBirth({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color:AppColors.black,
            fontSize: 16.r,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 3.h,),
        BirthPicker(
          locale: "Date of Birth",
          textStyle: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          iconColor: AppColors.black,
          minimumDate: DateTime(1900),
          maximumDate: DateTime.now(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.black, width: 1),
          ),
          onChanged: (dateTime) {
            if (dateTime != null) {}
          },
        ),
      ],
    );
  }
}