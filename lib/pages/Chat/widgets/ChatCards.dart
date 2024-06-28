import 'package:flutter/material.dart';

import '../../../Helper/app_setting.dart';

class ChatCards extends StatelessWidget {
  final bool isSender;
  const ChatCards({super.key, required this.isSender});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              color: isSender ? Colors.white : const Color(0xffC2CAF0),
              borderRadius: isSender
                  ? const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )
                  : const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
            ),
            child: Column(
              crossAxisAlignment:
                  isSender ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    constraints: BoxConstraints(
                      minWidth: width(context, 0.15),
                      maxWidth: width(context, 0.25),
                    ),
                    // color: Colors.red,
                    child: const Text(
                      "Hello! Have you seen my backpack anywhere in office?",
                      // textDirection: TextDirection.ltr,
                      // textAlign: TextAlign.left,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 05),
                  child: Text("3:45 AM"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
