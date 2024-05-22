import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import 'package:quik_broker_admin/pages/HouseManagement/widgets/HouseManagementContainer.dart';
import 'package:quik_broker_admin/pages/constant/widgets/CustomAppbar.dart';
import 'package:quik_broker_admin/pages/constant/widgets/components.dart';

import '../controller/HouseManagementPropertyAddController.dart';

class Housemanagementview extends StatelessWidget {
  const Housemanagementview({super.key});

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
                      "House management / Details",
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
              color: Color(0xffE0DFDF),
              child: Row(
                children: [
                  Container(
                    width: width(context, 0.40),
                    child: const LeftContainer(),
                  ),
                  Container(
                    width: width(context, 0.40),
                    height: height(context, 0.99),
                    color: Colors.yellow,
                  )
                ],
              ),
            ),
            SizedBox(
              height: height(context, 0.05),
            ),
          ],
        ),
      ),
    );
  }
}

class LeftContainer extends StatelessWidget {
  const LeftContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Housemanagementpropertyaddcontroller productController =
        Get.put(Housemanagementpropertyaddcontroller());
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
                  color: Color(0xff23234B),
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
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
              color: Color(0xffA3A3A8),
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
                    minHeight: height(context, 0.05),
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
          SizedBox(
            height: height(context, 0.02),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 05),
            child: Container(
              // height: height(context, 0.40),
              width: width(context, 0.35),
              child: Column(
                children: [
                  CustomTextRow(
                    title: "Facing",
                    productController: productController,
                    label: '',
                  ),
                  CustomTextRow(
                    title: "Overlooking",
                    productController: productController,
                    label: '',
                  ),
                  CustomTextRow(
                    title: "Units availability",
                    productController: productController,
                    label: '',
                  ),
                  CustomTextRow(
                    title: "Furnishing",
                    productController: productController,
                    label: '',
                  ),
                  CustomTextRow(
                    title: "Landmark",
                    productController: productController,
                    label: '',
                  ),
                  CustomTextRow(
                    title: "Water availability",
                    productController: productController,
                    label: '',
                  ),
                  CustomTextRow(
                    title: "Status of Electicity",
                    productController: productController,
                    label: '',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextRow extends StatelessWidget {
  final String title;
  final String label;
  const CustomTextRow({
    super.key,
    required this.productController,
    required this.title,
    required this.label,
  });

  final Housemanagementpropertyaddcontroller productController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: width(context, 0.09),
            // color: Colors.blue,
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xff707070),
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(
            width: width(context, 0.15),
            child: customTextFieldUsingInitialValue(
              context,
              label,
              productController.Facing.value,
              (value) {
                productController.Facing.value = value;
              },
            ),
          )
        ],
      ),
    );
  }
}
