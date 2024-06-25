import 'package:flutter/material.dart';

import '../../../Helper/app_setting.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height(context, 0.20),
        width: width(context, 0.80),
        decoration: BoxDecoration(
          color: const Color(0xff455A64),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              SizedBox(
                width: width(context, 0.02),
              ),
              SizedBox(
                height: height(context, 0.20),
                // color: Colors.red,
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: CircleAvatar(
                        radius: 25,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: width(context, 0.02),
              ),
              SizedBox(
                height: height(context, 0.20),
                width: width(context, 0.60),
                // color: Colors.amber,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Jessica Moore Random Federation 115302, Moscow ul. Varshavskaya, 15-2-178 Jessica Moore Random Federation 115302, Moscow ul. Varshavskaya, 15-2-178 Resad yuderfaed trendindgan torender pendewar vdaoidbd suagva asvbsg ugao lodenuig iuwkhssql hander oubanfersdom",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffE0DFDF),
                        minimumSize: const Size(145, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        "Delete",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff475BE8),
                        minimumSize: const Size(145, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        "Edit",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
