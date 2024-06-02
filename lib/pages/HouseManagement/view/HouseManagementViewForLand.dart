// ignore: file_names
import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import 'package:quik_broker_admin/pages/HouseManagement/widgets/LeftContainerForLandView.dart';
import 'package:quik_broker_admin/pages/constant/widgets/CustomAppbar.dart';

import '../widgets/RightContainerForLandView.dart';

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
              // height: height(context, 0.75),
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
                  const Expanded(
                    child: RightContainerForLandView(),
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
