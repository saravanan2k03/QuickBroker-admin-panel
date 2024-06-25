import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';

class ContactListCard extends StatelessWidget {
  final int indexs;
  const ContactListCard({
    super.key,
    required this.indexs,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 50,
      // color: Colors.red,
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("images/fakeperson.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 05,
                  ),
                  child: SizedBox(
                    height: height(context, 0.03),
                    width: width(context, 0.13),
                    // color: Colors.blue,
                    child: const Text(
                      "Saravanan",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 05,
                  ),
                  child: SizedBox(
                    height: height(context, 0.03),
                    width: width(context, 0.13),
                    // color: Colors.blue,
                    child: const Text(
                      "hi how are you?",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 05, left: 05),
                child: Text(
                  "5:00 AM",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: CircleAvatar(
                      radius: 08,
                      backgroundColor: Colors.green,
                      child: Center(
                        child: Text(
                          indexs.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
