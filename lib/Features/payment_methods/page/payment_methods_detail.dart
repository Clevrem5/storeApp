import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Core/utils/app_colors.dart';
import 'package:store_app/Features/Common_Widgets/storeAppBar.dart';
import 'package:store_app/Features/Common_Widgets/store_tex.dart';
import 'package:store_app/core/navigation/routes.dart';

import 'methods_new_card_detail.dart';


class MethodsNewCardDetail extends StatefulWidget {
  const MethodsNewCardDetail({super.key});

  @override
  State<MethodsNewCardDetail> createState() => _MethodsNewCardDetailState();
}

class _MethodsNewCardDetailState extends State<MethodsNewCardDetail> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _securityCodeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isFormValid() {
    return _cardNumberController.text.replaceAll(' ', '').length == 16 &&
        _expiryDateController.text.length == 5 &&
        _securityCodeController.text.length == 3;
  }

  void _updateButtonState() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _cardNumberController.addListener(_updateButtonState);
    _expiryDateController.addListener(_updateButtonState);
    _securityCodeController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _securityCodeController.dispose();
    super.dispose();
  }

  void _saveCardAndNavigate() {
    if (_formKey.currentState!.validate()) {
      final card = CardModel(
        number: _cardNumberController.text.replaceAll(' ', ''),
        expiryDate: _expiryDateController.text,
        securityCode: _securityCodeController.text,
        cardType: 'VISA', // yoki aniqlang
      );

      // Faqat yangi sahifaga yo'naltiramiz:
      context.push(Routes.paymentMethods, extra: card);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white,
      extendBody: true,
      appBar: StoreAppBar(title: "New Card"),
      body: Padding(
        padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(color: AppColors.buttonBorder, height: 1.5),
              SizedBox(height: 20.h),
              StoreText(
                text: "Add Debit or Credit Card",
                color: AppColors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 16.h),
              StoreText(text: "Card Number", color: AppColors.black),
              SizedBox(height: 4.h),
              SizedBox(
                height: 52.h,
                child: TextFormField(
                  controller: _cardNumberController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(16),
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      final text = newValue.text.replaceAll(' ', '');
                      if (text.length > 16) return oldValue;
                      final buffer = StringBuffer();
                      for (int i = 0; i < text.length; i++) {
                        buffer.write(text[i]);
                        if ((i + 1) % 4 == 0 && i != text.length - 1) {
                          buffer.write(' ');
                        }
                      }
                      return TextEditingValue(
                        text: buffer.toString(),
                        selection: TextSelection.collapsed(offset: buffer.length),
                      );
                    }),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Karta raqamini kiriting';
                    }
                    if (value.replaceAll(' ', '').length != 16) {
                      return '16 ta raqam kiriting';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.buttonBorder, width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.buttonBorder, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: _cardNumberController.text.replaceAll(' ', '').length == 16
                            ? AppColors.black
                            : AppColors.buttonBorder,
                        width: 1.5,
                      ),
                    ),
                    hintText: "Enter your card number",
                    hintStyle: TextStyle(
                      color: AppColors.hintText,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StoreText(
                          text: "Expiry Date",
                          color: AppColors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 4.h),
                        SizedBox(
                          height: 52.h,
                          child: TextFormField(
                            controller: _expiryDateController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4),
                              TextInputFormatter.withFunction((oldValue, newValue) {
                                final text = newValue.text.replaceAll('/', '');
                                if (text.length > 4) return oldValue;

                                final buffer = StringBuffer();
                                for (int i = 0; i < text.length; i++) {
                                  buffer.write(text[i]);
                                  if (i == 1 && i != text.length - 1) {
                                    buffer.write('/');
                                  }
                                }
                                return TextEditingValue(
                                  text: buffer.toString(),
                                  selection: TextSelection.collapsed(offset: buffer.length),
                                );
                              }),
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Muddat kiriting';
                              }
                              if (!RegExp(r'^(0[1-9]|1[0-2])\/([0-9]{2})$').hasMatch(value)) {
                                return 'MM/YY formatida';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: AppColors.buttonBorder, width: 1.5),
                              ),
                              hintText: "MM/YY",
                              hintStyle: TextStyle(
                                color: AppColors.hintText,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 11.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StoreText(
                          text: "Security Code",
                          color: AppColors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 4.h),
                        SizedBox(
                          height: 52.h,
                          child: TextFormField(
                            controller: _securityCodeController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(3),
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'CVC kod kiriting';
                              }
                              if (value.length != 3) {
                                return '3 ta raqam kiriting';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: AppColors.buttonBorder, width: 1.5),
                              ),
                              hintText: "CVC",
                              hintStyle: TextStyle(
                                color: AppColors.hintText,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 8.0, top: 14, bottom: 14),
                                child: SvgPicture.asset("assets/icons/question_mark.svg"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          left: 24,
          right: 24,
        ),
        child: SizedBox(
          height: 54.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: _isFormValid() ? AppColors.black : AppColors.buttonBorder,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: _isFormValid() ? _saveCardAndNavigate : null,
            child: Center(
              child: StoreText(
                text: "Add Card",
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
