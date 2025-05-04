import 'package:flutter/material.dart';

import '../../../Core/utils/app_colors.dart';

class CustomerServiceViewBody extends StatelessWidget {
  const CustomerServiceViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Colors.grey,
          thickness: 1,
          indent: 24,
          endIndent: 24,
        ),
        const SizedBox(height: 6),
        Container(
          alignment: Alignment.center,
          width: 58,
          height: 25,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Text(
            "Today",
            style: TextStyle(color: AppColors.white),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 24),
            width: 171,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6),
                topRight: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
            ),
            child: const Text(
              "Hello, good morning.",
              style: TextStyle(color: AppColors.bottomBorder),
            ),
          ),
        ),
        SizedBox(height: 12),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 24),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6),
                topRight: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
            ),
            child: const Text(
              "I am a Customer Service, is there anything I can help you with?.",
              style: TextStyle(color: AppColors.bottomBorder),
              softWrap: true,
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              "10:41 pm",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 24),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6),
                topRight: Radius.circular(6),
                bottomLeft: Radius.circular(6),
              ),
            ),
            child: const Text(
              "Hi, I'm having problems with my order & payment.",
              style: TextStyle(color: AppColors.white),
              softWrap: true,
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: EdgeInsets.only(right: 24),
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6),
                topRight: Radius.circular(6),
                bottomLeft: Radius.circular(6),
              ),
            ),
            child: const Text(
              "Can you help me?",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 14,
              ),
              textAlign: TextAlign.left,
              softWrap: true,
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 24),
            child: Text(
              "10:50 pm",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.only(left: 24),
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6),
                topRight: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
            ),
            child: const Text(
              "of course...",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 14,
              ),
              textAlign: TextAlign.right,
              softWrap: true,
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 24),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6),
                topRight: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
            ),
            child: const Text(
              "Can you tell me the problem you are having? so I can help solve it.",
              style: TextStyle(color: AppColors.bottomBorder),
              softWrap: true,
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              "10:51 pm",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
        SizedBox(
          height: 27,
        ),
        Expanded(
          child: Column(
            children: [
              Expanded(child: Container()),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: "Write your message...",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.mic, color: Colors.white),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
