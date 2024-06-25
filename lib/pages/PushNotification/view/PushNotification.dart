import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import '../../../Helper/constant/widgets/CustomAppbar.dart';
import '../widgets/NotificationCard.dart';

class Pushnotification extends StatelessWidget {
  const Pushnotification({super.key});

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
                      "Push Notification",
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
              height: height(context, 0.05),
            ),
            Container(
              width: width(context, 0.80),
              height: height(context, 0.75),
              decoration: BoxDecoration(
                color: const Color(0xffE0DFDF),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 03,
                itemBuilder: (context, index) {
                  return const NotificationCard();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffE0DFDF),
                      minimumSize: const Size(170, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: const Icon(
                      Icons.send_outlined,
                      color: Colors.black,
                    ),
                    iconAlignment: IconAlignment.end,
                    label: const Text(
                      "Send Message",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width(context, 0.02),
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
