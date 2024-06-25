import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/constant/widgets/CustomAppbar.dart';
import '../../../Helper/app_setting.dart';
import '../widgets/ContactList.dart';

class Chatpage extends StatelessWidget {
  const Chatpage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height(context, 0.04),
            ),
            SizedBox(
              // color: Colors.red,
              height: height(context, 0.08),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    // color: Colors.yellow,
                    width: width(context, 0.20),
                    child: const Text(
                      "Chat",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const CustomAppbar()
                ],
              ),
            ),
            SizedBox(
              height: height(context, 0.02),
            ),
            Container(
              width: width(context, 0.80),
              height: height(context, 0.85),
              decoration: BoxDecoration(
                color: const Color(0xffC3CAF0),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const ContactList(),
                  Padding(
                    padding: const EdgeInsets.only(left: 05),
                    child: VerticalDivider(
                      width: width(context, 0.02),
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          height: height(context, 0.10),
                          width: width(context, 0.53),
                          decoration: BoxDecoration(
                            color: const Color(0xffD7D7D7),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width(context, 0.53),
                        child: const Divider(
                          color: Colors.white,
                          thickness: 1,
                          // height: height(context, 0.02),
                        ),
                      ),
                      Container(
                        height: height(context, 0.70),
                        width: width(context, 0.53),
                        decoration: BoxDecoration(
                          color: const Color(0xffD7D7D7),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              width: width(context, 0.53),
                              height: height(context, 0.62),
                              // color: Colors.red,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 05),
                              child: Container(
                                height: height(context, 0.07),
                                width: width(context, 0.53),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
