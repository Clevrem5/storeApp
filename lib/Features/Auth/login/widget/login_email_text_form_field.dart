import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';


class LoginEmailTextForm extends StatelessWidget {
   LoginEmailTextForm({
    super.key,
    required this.label,
    required this.hint,
    required this.validator,
    required this.controller,
  });

  final String label, hint;
  final String? Function(String? value) validator;
  final TextEditingController controller;

   final TextEditingController _controller = TextEditingController();
   final FocusNode _focusNode = FocusNode();
   final ValueNotifier<bool> _isValid = ValueNotifier(false);
   final ValueNotifier<bool> _wasTouched = ValueNotifier(false);

   void _validate(String value) {
     _isValid.value = value.endsWith('@gmail.com');
   }

  @override
  Widget build(BuildContext context) {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _wasTouched.value = true;
      }
    });
    return ValueListenableBuilder<bool>(
      valueListenable: _wasTouched,
      builder: (context, touched, _) {
        return ValueListenableBuilder(
          valueListenable: _isValid,
          builder: (context, isValid, _) {
            return TextFormField(
              validator: validator,
              controller: _controller,
              focusNode: _focusNode,
              onChanged: (value) => _validate(value),
              keyboardType: TextInputType.emailAddress,
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(
                color: AppColors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                suffixIcon: touched
                    ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    isValid
                        ? 'assets/success.svg'
                        : 'assets/about.svg',
                    width: 24,
                    height: 24,
                  ),
                )
                    : null,
                enabledBorder: touched
                    ? OutlineInputBorder(
                  borderSide: BorderSide(
                    color: isValid ? Colors.green : Colors.red,
                    width: 2,
                  ),
                )
                    : OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.hintText,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: touched
                    ? OutlineInputBorder(
                  borderSide: BorderSide(
                    color: isValid ? Colors.green : Colors.red,
                    width: 2,
                  ),
                )
                    : OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.hintText,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: AppColors.white,
                hintText: hint,
                hintStyle: TextStyle(
                  height: 1,
                  fontSize: 14,
                  color: AppColors.hintText,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 36.sp),
                // errorText: "Banzai!",
              ),
            );
          },
        );
      },
    );
  }
}