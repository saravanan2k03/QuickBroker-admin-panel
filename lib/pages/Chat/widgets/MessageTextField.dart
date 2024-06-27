import 'package:flutter/material.dart';

import '../../../Helper/app_setting.dart';

class MessageTextField extends StatelessWidget {
  const MessageTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context, 0.08),
      width: width(context, 0.53),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: height(context, 0.07),
            width: width(context, 0.40),
            decoration: BoxDecoration(
              color: const Color(0xffD7D7D7),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 05),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: "Type your message here..",
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: SizedBox(
              height: height(context, 0.05),
              width: width(context, 0.11),
              // color: Colors.red,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Send Message",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  Icon(
                    Icons.send_sharp,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
