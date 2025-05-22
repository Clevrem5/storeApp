// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:go_router/go_router.dart';
//
// import '../../../Core/navigation/routes.dart';
// import '../../../Core/utils/app_colors.dart';
// import '../../../data/models/cardModels/card_model.dart';
// import '../../Common_Widgets/storeAppBar.dart';
// import '../../Common_Widgets/store_tex.dart';
// import '../manager/card_bloc.dart';
// import '../manager/card_state.dart';
//
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
//
// Payment Methods Detail page to display saved cards
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../Core/navigation/routes.dart';
import '../../../Core/utils/app_colors.dart';
import '../../../data/models/cardModels/card_model.dart';
import '../../Common_Widgets/storeAppBar.dart';
import '../../Common_Widgets/store_tex.dart';
import '../manager/card_bloc.dart';
import '../manager/card_state.dart';

class PaymentMethodsDetail extends StatefulWidget {
  final CardCreateModel? card;

  const PaymentMethodsDetail({super.key, this.card});

  @override
  State<PaymentMethodsDetail> createState() => _PaymentMethodsDetailState();
}
class _PaymentMethodsDetailState extends State<PaymentMethodsDetail> {
//
//   @override
//   void initState() {
//     super.initState();
//     _loadCards();
//   }
//
//   void _loadCards() {
//     if (cards.isEmpty) {
//       cards = [
//         CardModel(
//           // number: '4242424242422512',
//           // expiryDate: '12/25',
//           // securityCode: '123',
//           // cardType: 'VISA',
//           // isDefault: true,
//           id: 1,
//           cardNumber: '4242424242422512',
//         ),
//         // CardModel(
//         //   number: '5555555555555421',
//         //   expiryDate: '10/26',
//         //   securityCode: '321',
//         //   cardType: 'MasterCard',
//         //   isDefault: false,
//         // ),
//       ];
//     }
//
//     setState(() {});
//   }
//
// final List<CardModel>cards= [];
//   void _setDefaultCard(int index) {
//     setState(() {
//       for (int i = 0; i < cards.length; i++) {
//         cards[i] = cards[i].copyWith(id:i);
//       }
//     });

//
//   void _goToAddCardPage() async {
//     final CardModel? newCard = await context.push<CardModel>(Routes.newCard);
//
//     if (newCard != null) {
//       String cardType = 'VISA';
//       final firstDigit = newCard.cardNumber[0];
//       if (firstDigit == '5') {
//         cardType = 'MasterCard';
//       } else if (firstDigit == '3') {
//         cardType = 'AmEx';
//       }
//
//       final updatedCard = newCard.copyWith(
//         cardType: cardType,
//         isDefault: cards.isEmpty,
//       );
//
//       setState(() {
//         cards.add(updatedCard);
//       });
//     }
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white,
      extendBody: true,
      appBar: StoreAppBar(
        title: "Payment Methods",
        callback: () => context.go(Routes.checkout),
      ),
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
              child: BlocBuilder<CardBloc, CardState>(builder: (context, state) {
                if (state.status == CardStatus.loading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state.status == CardStatus.idle) {
                  final cards = state.cards;
                  return ListView.builder(
                    itemCount: cards.length + 1,
                    itemBuilder: (context, index) {
                      if (index < cards.length) {
                        final card = cards[index];
                        return _buildCardItem(card, index);
                      } else {
                        return _buildAddNewCardButton();
                      }
                    },
                  );
                } else {
                  return Center(
                    child: Text("xato"),
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardItem(CardCreateModel card, int index) {
    final String maskedNumber = '•••• •••• •••• ${card.cardNumber.substring(card.cardNumber.length-4)}';
    return Container(
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
          InkWell(
            onTap: () {},
            child: Radio(
              value: true,
              groupValue: true,
              onChanged: (value) => index,
              activeColor: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }

/*
ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: SvgPicture.asset(
          'assets/icons/visa.svg',
          width: 32.w,
        ),
        title: StoreText(
          text: maskedNumber,
          color: AppColors.black,
          fontSize: 14.sp,
        ),
        subtitle: Text("zor") == Text("d")//isdefault!!!
            // card.isDefault
            ? StoreText(
          text: "Default",
          color: AppColors.hintText,
          fontSize: 12.sp,
        )
            : null,
        // trailing: Radio(
        //   value: true,
        //   groupValue: true,
        //   onChanged: (_) => _setDefaultCard(index),
        //   activeColor: AppColors.black,
        // ),
        // onTap: () => _setDefaultCard(index),
      )
      */
  Widget _buildAddNewCardButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      child: OutlinedButton(
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
      ),
    );
  }
}