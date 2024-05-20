import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import 'package:quik_broker_admin/pages/HouseManagement/widgets/HouseManagementButton.dart';
import 'package:quik_broker_admin/pages/HouseManagement/widgets/HouseManagementData.dart';

class HouseManagementContainer extends StatelessWidget {
  const HouseManagementContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context, 0.35),
      // width: width(context, 0.80),
      decoration: BoxDecoration(
        color: const Color(0xffE0DFDF),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(61, 23, 24, 25).withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: height(context, 0.30),
            width: width(context, 0.25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              // border: Border.all(color: Colors.blue),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                "images/House.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          const HousemanagementData(),
          const HousemanagementButton(),
        ],
      ),
    );
  }
}
