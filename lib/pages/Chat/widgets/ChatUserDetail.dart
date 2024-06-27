import 'package:flutter/material.dart';

import '../../../Helper/app_setting.dart';

class ChatUserDetail extends StatelessWidget {
  const ChatUserDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context, 0.10),
      width: width(context, 0.53),
      decoration: BoxDecoration(
        color: const Color(0xffD7D7D7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Row(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 25,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 13),
            child: Text(
              "Travis Barker",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
