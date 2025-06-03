
// // Card model
// // class CardModel {
// //   final String number;
// //   final String expiryDate;
// //   final String securityCode;
// //   final String cardType; // VISA, MasterCard, etc.
// //   final bool isDefault;
// //
// //   CardModel({
// //     required this.number,
// //     required this.expiryDate,
// //     required this.securityCode,
// //     required this.cardType,
// //     this.isDefault = false,
// //   });
// //
// //   String get maskedNumber => '•••• •••• •••• ${number.substring(number.length - 4)}';
// //
// //   // Create a copy with modified fields
// //   CardModel copyWith({
// //     String? number,
// //     String? expiryDate,
// //     String? securityCode,
// //     String? cardType,
// //     bool? isDefault,
// //   }) {
// //     return CardModel(
// //       number: number ?? this.number,
// //       expiryDate: expiryDate ?? this.expiryDate,
// //       securityCode: securityCode ?? this.securityCode,
// //       cardType: cardType ?? this.cardType,
// //       isDefault: isDefault ?? this.isDefault,
// //     );
// //   }
// // }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Features/payment_methods/manager/card_event.dart';

import '../../../Core/navigation/routes.dart';
import '../../../Core/utils/app_colors.dart';
import '../../../data/models/cardModels/card_model.dart';
import '../../Common_Widgets/storeAppBar.dart';
import '../../Common_Widgets/store_tex.dart';
import '../manager/card_bloc.dart';
import '../manager/card_state.dart';

class PaymentMethodsDetail extends StatefulWidget {
  final String source;

  const PaymentMethodsDetail({super.key, required this.source});

  @override
  State<PaymentMethodsDetail> createState() => _PaymentMethodsDetailState();
}

class _PaymentMethodsDetailState extends State<PaymentMethodsDetail> {
  int? selectedCardIndex;

  @override
  Widget build(BuildContext context) {
    // final extra=CardCreateModel(id: selectedCardIndex!, cardNumber: '');
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white,
      extendBody: true,
      appBar: StoreAppBar(
        title: "Payment Methods",
        callback: () async {
          if (widget.source == 'checkout') {
              context.go(Routes.checkout );
              // final state = context.read<CardBloc>().state;
              // final cards = state.cards;
              //
              // if (selectedCardIndex != null && selectedCardIndex! < cards.length) {
              //   final selectedCard = cards[selectedCardIndex!];
              //   context.pop(selectedCard);
              //   } else {
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       const SnackBar(content: Text("Iltimos, karta tanlang")),
              //     );
              //   }
            } else if (widget.source == 'account') {
              context.go(Routes.account);
            }
          }),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StoreText(
              text: "Saved Cards",
              color: AppColors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 14.h),
            Expanded(
              child: BlocBuilder<CardBloc, CardState>(
                builder: (context, state) {
                  if (state.status == CardStatus.loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state.status == CardStatus.idle) {
                    final cards = state.cards;
                    return ListView.builder(
                      itemCount: cards.length + 1,
                      itemBuilder: (context, index) {
                        if (index < cards.length) {
                          final card = cards[index];
                          return _buildCardItem(card, index);
                        } else {
                          return _buildContinueButton(cards);
                        }
                      },
                    );
                  } else {
                    return const Center(child: Text("Xato"));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardItem(CardCreateModel card , int index) {
    final String maskedNumber =
        '•••• •••• •••• ${card.cardNumber.substring(card.cardNumber.length - 4)}';
    return GestureDetector(
      onLongPress: () {
        context.read<CardBloc>().add(CardDeleteEvent(id: card.id));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.buttonBorder),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              'assets/icons/visa.svg',
              width: 32.w,
            ),
            StoreText(
              text: maskedNumber,
              color: AppColors.black,
              fontSize: 14.sp,
            ),
            Radio<int>(
              value: index,
              groupValue: selectedCardIndex,
              onChanged: (value) {
                setState(() {
                  selectedCardIndex = value;
                });
              },
              activeColor: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContinueButton(List<CardCreateModel> cards) {
    return OutlinedButton(
      onPressed: () {
        context.push(Routes.newCard);
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppColors.buttonBorder),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(vertical: 16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add, color: AppColors.black),
          SizedBox(width: 8.w),
          StoreText(
            text: "Add New Card",
            color: AppColors.black,
            fontSize: 14.sp,
          ),
        ],
      ),
    );
    // return GestureDetector(
    //   onTap: () {
    //     if (selectedCardIndex != null) {
    //       final selectedCard = cards[selectedCardIndex!];
    //       context.go(Routes.checkout, extra: selectedCard); // yoki account sahifasi
    //     } else {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         const SnackBar(content: Text("Iltimos, karta tanlang")),
    //       );
    //     }
    //   },
    //   child: Container(
    //     margin: EdgeInsets.only(top: 16.h),
    //     padding: const EdgeInsets.all(16),
    //     decoration: BoxDecoration(
    //       color: Colors.black,
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     alignment: Alignment.center,
    //     child: StoreText(
    //       text: "Continue with selected card",
    //       color: AppColors.white,
    //       fontSize: 14.sp,
    //       fontWeight: FontWeight.w600,
    //     ),
    //   ),
    // );
  }
}
