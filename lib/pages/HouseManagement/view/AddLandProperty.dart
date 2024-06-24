import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import '../../constant/widgets/CustomAppbar.dart';
import '../../constant/widgets/components.dart';
import '../widgets/CustomTextButton.dart';
import '../widgets/LeftContainerForAddLand.dart';

class AddLandProperty extends StatelessWidget {
  const AddLandProperty({super.key});

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
                      "House management / Add Land Property",
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
              decoration: BoxDecoration(
                color: const Color(0xffE0DFDF),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: width(context, 0.40),
                    child: const LeftContainerForAddLandProperty(),
                  ),
                  const Expanded(
                    child: RightContainerForAddLandProperty(),
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

class RightContainerForAddLandProperty extends StatelessWidget {
  const RightContainerForAddLandProperty({super.key});

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
          height: height(context, 0.02),
        ),
        Row(
          children: [
            Container(
              constraints: BoxConstraints(
                maxHeight: height(context, 0.25),
              ),
              width: width(context, 0.35),
              child: customTextAreaUsingInitialvalue(
                  context,
                  "Description",
                  "The information contained herein is generic in nature and is meant for educational purposes only. Nothing here is to be construed as an investment or financial or taxation advice nor to be considered as an invitation or solicitation or advertisement for any financial product. Readers are advised .",
                  (value) {}),
            ),
          ],
        ),
        SizedBox(
          height: height(context, 0.02),
        ),
        const Row(
          children: [
            Text(
              "House Details",
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
            SizedBox(
              height: height(context, 0.06),
              width: width(context, 0.20),
              child: customTextFieldUsingInitialValue(
                  context, "Adtitle", "Star Sun Hotel & Apartment", (value) {}),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
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
        Row(
          children: [
            Container(
              height: height(context, 0.05),
              width: width(context, 0.15),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(05)),
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 05),
                    child: Icon(
                      Icons.person_2_outlined,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 05, left: 05),
                    child: Text(
                      "Select User",
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
        SizedBox(
          height: height(context, 0.02),
        ),
        const CustomButtons(
          enabled: false,
        ),
        SizedBox(
          height: height(context, 0.35),
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
                ),
              ),
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
