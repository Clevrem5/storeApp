import 'package:birth_picker/birth_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/Core/utils/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/Features/my_details/manager/my_details_bloc.dart';

class MyDetailsDateBirth extends StatelessWidget {
  const MyDetailsDateBirth({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MyDetailsBloc>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 3.h),
        BirthPicker(
          locale: "en", // "Date of Birth" emas, bu yerda locale kerak (masalan "en", "ru", "uz" va h.k.)
          textStyle: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
          iconColor: AppColors.black,
          minimumDate: DateTime(1900),
          maximumDate: DateTime.now(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: AppColors.black, width: 1),
          ),
          onChanged: (dateTime) {
            if (dateTime != null) {
              bloc.birthContr.text = dateTime.toIso8601String().split("T").first;
            }
          },
        ),
      ],
    );
  }
}
