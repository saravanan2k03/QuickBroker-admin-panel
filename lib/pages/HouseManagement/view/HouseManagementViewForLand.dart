// ignore: file_names
import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import 'package:quik_broker_admin/pages/constant/widgets/CustomAppbar.dart';

class HouseManagementViewForLand extends StatelessWidget {
  const HouseManagementViewForLand({super.key});

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
                      "House management / LandProperty View",
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
              height: height(context, 0.75),
              width: width(context, 0.80),
              decoration: BoxDecoration(
                color: const Color(0xffE0DFDF),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: width(context, 0.40),
                    child: const LeftContainerForLandView(),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LeftContainerForLandView extends StatelessWidget {
  const LeftContainerForLandView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          height: height(context, 0.03),
        ),
        Container(
          height: height(context, 0.35),
          width: width(context, 0.35),
          color: Colors.white,
        ),
        SizedBox(
          height: height(context, 0.02),
        ),
        Row(
          children: [
            SizedBox(
              width: width(context, 0.02),
            ),
            const Text(
              "Property Name",
              style: TextStyle(
                color: Color(0xff23234B),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 05,
        ),
        Row(
          children: [
            SizedBox(
              width: width(context, 0.02),
            ),
            const Text(
              "\$346,000",
              style: TextStyle(
                color: Color(0xff23234B),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(
          height: height(context, 0.02),
        ),
        Row(
          children: [
            SizedBox(
              width: width(context, 0.02),
            ),
            const Text(
              "Address",
              style: TextStyle(
                color: Color(0xff11142D),
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(
          height: height(context, 0.02),
        ),
        Container(
          constraints: BoxConstraints(
            minHeight: height(context, 0.10),
          ),
          width: width(context, 0.35),
          decoration: BoxDecoration(
            color: const Color(0xffA3A3A8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              SizedBox(
                height: height(context, 0.01),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 05),
                child: Row(
                  children: [
                    Text(
                      "Name:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 05,
                    ),
                    Text(
                      "Saravanan",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  minHeight: height(context, 0.10),
                ),
                width: width(context, 0.34),
                // color: Colors.red,
                child: const Column(
                  children: [
                    Text(
                      "No.28, 1st Floor, Akemps Building, Near Sony Signal, Ashwini Layout, 1st Cross, Intermediate Ring Road, 3rd Main Road, Ejipura-560047.",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
