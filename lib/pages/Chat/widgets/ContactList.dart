import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../Helper/app_setting.dart';
import 'ContactListCard.dart';

class ContactList extends StatelessWidget {
  const ContactList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: height(context, 0.85),
        width: width(context, 0.23),
        // color: Colors.red,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Messages",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Row(
              children: [
                SizedBox(
                  width: 22,
                ),
                Text(
                  "Sort by",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Newest",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ContactListCard(
                          indexs: index,
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
