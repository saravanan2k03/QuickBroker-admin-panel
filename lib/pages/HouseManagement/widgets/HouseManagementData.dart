import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';

class HousemanagementData extends StatelessWidget {
  const HousemanagementData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context, 0.30),
      width: width(context, 0.30),
      // color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            // padding: EdgeInsets.all(05),
            // color: Colors.red,
            // height: height(context, 0.03),
            width: width(context, 25),
            child: const Text(
              overflow: TextOverflow.ellipsis,
              "Star Sun Hotel & Apartment",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(05),
            // color: Colors.red,
            // height: height(context, 0.03),
            width: width(context, 25),
            child: const Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 17,
                  color: Colors.black,
                ),
                Text(
                  "North Carolina, USA",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(05),
            // color: Colors.red,
            // height: height(context, 0.03),
            width: width(context, 25),
            child: const Row(
              children: [
                Text(
                  "Name:",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 05),
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    "Manoj",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(05),
            // color: Colors.red,
            // height: height(context, 0.03),
            width: width(context, 25),
            child: const Row(
              children: [
                Text(
                  "Number:",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 05),
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    "9163572657",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(05),
            // color: Colors.red,
            // height: height(context, 0.03),
            width: width(context, 25),
            child: const Row(
              children: [
                Text(
                  "UID:",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 05),
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    "1253648749",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(05),
            // color: Colors.red,
            // height: height(context, 0.03),
            width: width(context, 25),
            child: const Row(
              children: [
                Text(
                  overflow: TextOverflow.ellipsis,
                  "\$35,000",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
