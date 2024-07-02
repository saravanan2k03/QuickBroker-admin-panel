import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import 'package:quik_broker_admin/pages/DashBoard/Controller/DashboardController.dart';
import 'package:quik_broker_admin/pages/DashBoard/widgets/DashboardContainer.dart';
import 'package:quik_broker_admin/Helper/constant/widgets/CustomAppbar.dart';

class DashBoard extends StatelessWidget {
  DashBoard({super.key});

  final DashBoardController _dashBoardController =
      Get.put(DashBoardController());

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
                      "Dashboard",
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
              height: height(context, 0.07),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => DashboarCustomContainer(
                    title: "Total Users",
                    image: Image.asset(
                      "images/usericon.png",
                    ),
                    data: _dashBoardController.userCount.value.toString(),
                    imageheight: 45,
                    imagewidth: 45,
                  ),
                ),
                SizedBox(
                  width: width(context, 0.03),
                ),
                Obx(
                  () => DashboarCustomContainer(
                    title: "Total Property",
                    image: Image.asset(
                      "images/houseicon.png",
                      fit: BoxFit.cover,
                    ),
                    data: _dashBoardController.totalProperty.value.toString(),
                    imageheight: 55,
                    imagewidth: 55,
                  ),
                ),
                SizedBox(
                  width: width(context, 0.03),
                ),
                Obx(
                  () => DashboarCustomContainer(
                    title: "Total Property Request",
                    image: Image.asset("images/totalhouserequest.png"),
                    data: _dashBoardController.totalPropertyRequest.value
                        .toString(),
                    imageheight: 45,
                    imagewidth: 45,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height(context, 0.07),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => DashboarCustomContainer(
                    title: "Total Packer Request",
                    image: Image.asset("images/totalhouserequest.png"),
                    data: _dashBoardController.totalPackerRequest.value
                        .toString(),
                    imageheight: 45,
                    imagewidth: 45,
                  ),
                ),
                SizedBox(
                  width: width(context, 0.03),
                ),
                Obx(
                  () => DashboarCustomContainer(
                    title: "Current Running Offer",
                    data: _dashBoardController.offers.value.toString(),
                    image: Image.asset("images/customruningoffer.png"),
                    imageheight: 45,
                    imagewidth: 45,
                  ),
                ),
                SizedBox(
                  width: width(context, 0.03),
                ),
                Obx(
                  () => DashboarCustomContainer(
                    title: "Total Property Sold",
                    image: Image.asset("images/soldpropertyimage.png"),
                    imageheight: 45,
                    imagewidth: 45,
                    data:
                        _dashBoardController.totalSoldProperty.value.toString(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height(context, 0.07),
            ),
            Container(
              height: height(context, 0.60),
              width: width(context, 0.71),
              decoration: BoxDecoration(
                  color: cardcolor, borderRadius: BorderRadius.circular(10)),
            ),
            SizedBox(
              height: height(context, 0.07),
            ),
          ],
        ),
      ),
    );
  }
}
