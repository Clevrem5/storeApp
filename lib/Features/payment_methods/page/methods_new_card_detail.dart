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
import 'package:store_app/Features/payment_methods/page/payment_methods_detail_button.dart';

import '../../../Core/navigation/routes.dart';
import '../../../Core/utils/app_colors.dart';
import '../../../data/models/cardModels/card_model.dart';
import '../../Common_Widgets/storeAppBar.dart';
import '../../Common_Widgets/store_tex.dart';
import '../manager/card_bloc.dart';
import '../manager/card_state.dart';

class PaymentMethodsDetail extends StatelessWidget {
  final String source;

  const PaymentMethodsDetail({super.key, required this.source});

//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white,
      extendBody: true,
      appBar: StoreAppBar(
        title: "Payment Methods",
        callback: () async {
          if (source == 'checkout') {
            context.go(Routes.checkout);
          } else if (source == 'account') {
            context.go(Routes.account);
          }
        },
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
              child:
                  BlocBuilder<CardBloc, CardState>(builder: (context, state) {
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
    final String maskedNumber =
        '•••• •••• •••• ${card.cardNumber.substring(card.cardNumber.length - 4)}';
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
      child: PaymentMethodsDetailButton(),
    );
  }
}
