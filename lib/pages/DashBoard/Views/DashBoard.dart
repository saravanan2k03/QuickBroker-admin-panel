import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import 'package:quik_broker_admin/pages/DashBoard/widgets/DashboardContainer.dart';
import 'package:quik_broker_admin/Helper/constant/widgets/CustomAppbar.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

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
                  CustomAppbar()
                ],
              ),
            ),
            SizedBox(
              height: height(context, 0.07),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DashboarCustomContainer(
                  title: "Total Users",
                  image: Image.asset(
                    "images/usericon.png",
                  ),
                  data: "20",
                  imageheight: 45,
                  imagewidth: 45,
                ),
                SizedBox(
                  width: width(context, 0.03),
                ),
                DashboarCustomContainer(
                  title: "Total House",
                  image: Image.asset(
                    "images/houseicon.png",
                    fit: BoxFit.cover,
                  ),
                  data: "10",
                  imageheight: 55,
                  imagewidth: 55,
                ),
                SizedBox(
                  width: width(context, 0.03),
                ),
                DashboarCustomContainer(
                  title: "Total House Request",
                  image: Image.asset("images/totalhouserequest.png"),
                  data: "40",
                  imageheight: 45,
                  imagewidth: 45,
                ),
              ],
            ),
            SizedBox(
              height: height(context, 0.07),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DashboarCustomContainer(
                  title: "Total Packer Request",
                  image: Image.asset("images/totalhouserequest.png"),
                  data: "33",
                  imageheight: 45,
                  imagewidth: 45,
                ),
                SizedBox(
                  width: width(context, 0.03),
                ),
                DashboarCustomContainer(
                  title: "Current Running Offer",
                  data: "5",
                  image: Image.asset("images/customruningoffer.png"),
                  imageheight: 45,
                  imagewidth: 45,
                ),
                SizedBox(
                  width: width(context, 0.03),
                ),
                DashboarCustomContainer(
                  title: "Total  Total House Sold",
                  image: Image.asset("images/soldpropertyimage.png"),
                  imageheight: 45,
                  imagewidth: 45,
                  data: "5",
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
