import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import 'package:quik_broker_admin/pages/HouseManagement/widgets/HouseManagementContainer.dart';
import 'package:quik_broker_admin/pages/constant/widgets/CustomAppbar.dart';

class HouseManagement extends StatelessWidget {
  const HouseManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          SingleChildScrollView(
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
                          "Customer Request /Packer Request ",
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
                SizedBox(
                  height: height(context, 0.85),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 05,
                      itemBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.all(10),
                          child: HouseManagementContainer(),
                        );
                      }),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 1,
            right: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: height(context, 0.10),
                width: width(context, 0.15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color:
                          const Color.fromARGB(61, 23, 24, 25).withOpacity(0.3),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.add_box_outlined),
                    Text(
                      "Add  Property",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
