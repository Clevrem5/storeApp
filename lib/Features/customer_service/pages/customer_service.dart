import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:store_app/Features/Common_Widgets/storeAppBar.dart';

import '../managers/customer_service_bloc.dart';
import '../managers/customer_service_state.dart';

class CustomerServicePage extends StatefulWidget {
  const CustomerServicePage({super.key});

  @override
  State<CustomerServicePage> createState() => _CustomerServicePageState();
}

class _CustomerServicePageState extends State<CustomerServicePage> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerServiceBloc, CustomerServiceState>(
      builder: (context, state) => Scaffold(
        appBar: StoreAppBar(title: "Customer Service", callback: () {}),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 15),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.only(left: 10),
                  itemCount: state.messages.length,
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemBuilder: (context, index) => Align(
                    alignment: state.messages[index]["direction"] == "to" ? Alignment.centerLeft : Alignment.centerRight,
                    child: Container(
                      width: 200,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: state.messages[index]["direction"] == "to" ? Colors.grey.withValues(alpha: 0.8) : Colors.black.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.messages[index]["message"],
                            textAlign: TextAlign.justify,
                            style: TextStyle(color: Colors.white),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              DateFormat("HH:mm").format(
                                DateTime.parse(state.messages[index]["date"]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(child: TextField(controller: controller)),
                    ElevatedButton(
                      onPressed: () {
                        context.read<CustomerServiceBloc>().add(
                              CustomerServiceMessageSend(message: controller.text),
                            );
                        controller.text = "";
                      },
                      child: Icon(Icons.send),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
