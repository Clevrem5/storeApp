import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Features/payment_methods/page/payment_methods_detail.dart';

import '../../../Core/navigation/routes.dart';
import '../../../Core/utils/app_colors.dart';
import '../../Common_Widgets/storeAppBar.dart';
import '../../Common_Widgets/store_tex.dart';

// Card model
class CardModel {
  final String number;
  final String expiryDate;
  final String securityCode;
  final String cardType; // VISA, MasterCard, etc.
  final bool isDefault;

  CardModel({
    required this.number,
    required this.expiryDate,
    required this.securityCode,
    required this.cardType,
    this.isDefault = false,
  });

  String get maskedNumber => '•••• •••• •••• ${number.substring(number.length - 4)}';

  // Create a copy with modified fields
  CardModel copyWith({
    String? number,
    String? expiryDate,
    String? securityCode,
    String? cardType,
    bool? isDefault,
  }) {
    return CardModel(
      number: number ?? this.number,
      expiryDate: expiryDate ?? this.expiryDate,
      securityCode: securityCode ?? this.securityCode,
      cardType: cardType ?? this.cardType,
      isDefault: isDefault ?? this.isDefault,
    );
  }
}

// Payment Methods Detail page to display saved cards
class PaymentMethodsDetail extends StatefulWidget {
  const PaymentMethodsDetail({Key? key}) : super(key: key);

  @override
  State<PaymentMethodsDetail> createState() => _PaymentMethodsDetailState();
}
class _PaymentMethodsDetailState extends State<PaymentMethodsDetail> {
  List<CardModel> _cards = [];

  @override
  void initState() {
    super.initState();
    _loadCards();
  }

  void _loadCards() {
    if (_cards.isEmpty) {
      _cards = [
        CardModel(
          number: '4242424242422512',
          expiryDate: '12/25',
          securityCode: '123',
          cardType: 'VISA',
          isDefault: true,
        ),
        CardModel(
          number: '5555555555555421',
          expiryDate: '10/26',
          securityCode: '321',
          cardType: 'MasterCard',
          isDefault: false,
        ),
      ];
    }

    setState(() {});
  }

  void _setDefaultCard(int index) {
    setState(() {
      for (int i = 0; i < _cards.length; i++) {
        _cards[i] = _cards[i].copyWith(isDefault: i == index);
      }
    });
  }

  void _goToAddCardPage() async {
    final CardModel? newCard = await context.push<CardModel>(Routes.newCard);

    if (newCard != null) {
      String cardType = 'VISA';
      final firstDigit = newCard.number[0];
      if (firstDigit == '5') {
        cardType = 'MasterCard';
      } else if (firstDigit == '3') {
        cardType = 'AmEx';
      }

      final updatedCard = newCard.copyWith(
        cardType: cardType,
        isDefault: _cards.isEmpty,
      );

      setState(() {
        _cards.add(updatedCard);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white,
      extendBody: true,
      appBar: StoreAppBar(title: "Payment Methods"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StoreText(
              text: "Cards",
              color: AppColors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.builder(
                itemCount: _cards.length + 1,
                itemBuilder: (context, index) {
                  if (index < _cards.length) {
                    final card = _cards[index];
                    return _buildCardItem(card, index);
                  } else {
                    return _buildAddNewCardButton();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardItem(CardModel card, int index) {
    Widget cardIcon = SvgPicture.asset(
      card.cardType == 'MasterCard'
          ? "assets/icons/mastercard.svg"
          : "assets/icons/visa.svg",
      width: 32.w,
    );

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.buttonBorder),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: cardIcon,
        title: StoreText(
          text: card.maskedNumber,
          color: AppColors.black,
          fontSize: 14.sp,
        ),
        subtitle: card.isDefault
            ? StoreText(
          text: "Default",
          color: AppColors.hintText,
          fontSize: 12.sp,
        )
            : null,
        trailing: Radio(
          value: true,
          groupValue: card.isDefault,
          onChanged: (_) => _setDefaultCard(index),
          activeColor: AppColors.black,
        ),
        onTap: () => _setDefaultCard(index),
      ),
    );
  }

  Widget _buildAddNewCardButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      child: OutlinedButton(
        onPressed: _goToAddCardPage,
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