import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';

class PackerRequestUserDetails extends StatelessWidget {
  const PackerRequestUserDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context, 0.03),
      width: MediaQuery.of(context).size.width,
      // color: Colors.red,
      child: const Row(
        children: [
          Text(
            "UID:",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            width: 05,
          ),
          Text(
            "2365632968",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            width: 25,
          ),
          Text(
            "Name:",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            width: 05,
          ),
          Text(
            "Elonmusk",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            width: 25,
          ),
          Text(
            "Mobile No:",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            width: 05,
          ),
          Text(
            "2762346097",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            width: 25,
          ),
          Text(
            "Email:",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            width: 05,
          ),
          Text(
            "elon@gmail.com",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
