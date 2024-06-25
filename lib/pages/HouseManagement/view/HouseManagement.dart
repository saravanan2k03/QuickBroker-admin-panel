import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import 'package:quik_broker_admin/pages/HouseManagement/widgets/HouseManagementContainer.dart';
import 'package:quik_broker_admin/Helper/constant/widgets/CustomAppbar.dart';

class HouseManagement extends StatelessWidget {
  const HouseManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
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
                    "House Mangement",
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
            height: height(context, 0.73),
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
          SizedBox(
            height: height(context, 0.10),
            width: MediaQuery.of(context).size.width,
            // color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    height: height(context, 0.07),
                    width: width(context, 0.12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_box),
                        SizedBox(
                          width: 05,
                        ),
                        Text(
                          "Add Property",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
