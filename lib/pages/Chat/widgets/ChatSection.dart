// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import 'package:quik_broker_admin/pages/Chat/widgets/MessageTextField.dart';

class ChatSection extends StatelessWidget {
  const ChatSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: height(context, 0.70),
      // width: width(context, 0.53),
      decoration: BoxDecoration(
        color: const Color(0xffD7D7D7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: 01,
              itemBuilder: (context, index) {
                return ChatCards(
                  isSender: true,
                );
              }),
          const Padding(
            padding: EdgeInsets.only(top: 05, left: 05, right: 05),
            child: MessageTextField(),
          ),
        ],
      ),
    );
  }
}

class ChatCards extends StatelessWidget {
  final bool isSender;
  const ChatCards({super.key, required this.isSender});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        // width: width(context, 0.),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: (isSender ? Colors.grey.shade200 : Colors.blue[200]),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 05),
              child: Text(
                "saravanan",
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 05, right: 10),
              child: Text(
                "15:42",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
