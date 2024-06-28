// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import 'package:quik_broker_admin/pages/Chat/widgets/ChatCards.dart';
import 'package:quik_broker_admin/pages/Chat/widgets/MessageTextField.dart';

class ChatSection extends StatelessWidget {
  ChatSection({
    super.key,
  });

  List<dynamic> chatdata = [
    true,
    false,
    true,
    true,
    false,
    true,
    true,
    false,
    true,
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context, 0.70),
      width: width(context, 0.53),
      decoration: BoxDecoration(
        color: const Color(0xffD7D7D7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: height(context, 0.60),
            width: width(context, 0.53),
            // child: ListView.builder(
            //     shrinkWrap: true,
            //     itemCount: chatdata.length,
            //     itemBuilder: (context, index) {
            //       return ChatCards(
            //         isSender: chatdata[index],
            //       );
            //     }),
            child: ListView.builder(
              itemCount: 02,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 05),
                  child: Column(
                    children: [
                      Container(
                        height: height(context, 0.04),
                        width: width(context, 0.07),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Center(
                            child: Text(
                              "Yesterday",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: chatdata.length,
                            itemBuilder: (context, index) {
                              return ChatCards(
                                isSender: chatdata[index],
                              );
                            }),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 05, left: 05, right: 05),
            child: MessageTextField(),
          ),
        ],
      ),
    );
  }
}
