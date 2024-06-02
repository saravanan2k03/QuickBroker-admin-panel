import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';

import 'CustomTextButton.dart';
import 'UserDetailsContainer.dart';

class RightContainerForLandView extends StatelessWidget {
  const RightContainerForLandView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              "Description",
              style: TextStyle(
                color: Color(0xff23234B),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: height(context, 0.03),
        ),
        const Text(
          "The information contained herein is generic in nature and is meant for educational purposes only. Nothing here is to be construed as an investment or financial or taxation advice nor to be considered as an invitation or solicitation or advertisement for any financial product. Readers are advised .",
          style: TextStyle(
            color: Color(0xff23234B),
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: height(context, 0.03),
        ),
        const Row(
          children: [
            Text(
              "Land Details",
              style: TextStyle(
                color: Color(0xff23234B),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: height(context, 0.03),
        ),
        Row(
          children: [
            Container(
              height: height(context, 0.06),
              constraints: BoxConstraints(
                minWidth: width(context, 0.20),
              ),
              decoration: BoxDecoration(
                color: const Color(0xff2D2D2D),
                borderRadius: BorderRadius.circular(05),
              ),
              child: const Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Center(
                    child: Text(
                      "Star Sun Hotel & Apartment",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 05),
          child: Row(
            children: [
              Container(
                height: height(context, 0.06),
                constraints: BoxConstraints(
                  minWidth: width(context, 0.15),
                ),
                decoration: BoxDecoration(
                  color: const Color(0xff2D2D2D),
                  borderRadius: BorderRadius.circular(05),
                ),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 03),
                      child: Icon(
                        Icons.location_on,
                        size: 17,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 05,
                    ),
                    Center(
                      child: Text(
                        "chennai",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height(context, 0.03),
        ),
        const UserDetailsContainer(),
        SizedBox(
          height: height(context, 0.03),
        ),
        const CustomButtons(
          enabled: false,
        ),
        SizedBox(
          height: height(context, 0.03),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xff475BE8), width: 1),
                backgroundColor: Colors.white,
                minimumSize: const Size(170, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Cancel",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
            ),
            SizedBox(
              width: width(context, 0.02),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 05),
              child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.save_outlined,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff475BE8),
                    minimumSize: const Size(170, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  label: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            SizedBox(
              width: width(context, 0.02),
            ),
          ],
        ),
      ],
    );
  }
}
