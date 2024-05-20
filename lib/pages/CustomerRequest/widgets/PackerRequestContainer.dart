import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import 'package:quik_broker_admin/pages/CustomerRequest/widgets/BetweenthecityDetails.dart';
import 'package:quik_broker_admin/pages/CustomerRequest/widgets/PackerRequestUserDetails.dart';
import 'package:quik_broker_admin/pages/CustomerRequest/widgets/WithinthecityDetails.dart';

class PackerRequestContainer extends StatelessWidget {
  const PackerRequestContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context, 0.20),
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
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: width(context, 0.65),
            // color: Colors.blueAccent,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Within the Cities",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    // color: Colors.red,
                    height: height(context, 0.04),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        const Text(
                          "City:",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.30,
                          child: const Text(
                            "Chennai",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Visibility(
                    visible: false,
                    replacement: Betweenthecitydetails(),
                    child: withinthecityaddress(),
                  ),
                  const SizedBox(
                    height: 04,
                  ),
                  const PackerRequestUserDetails()
                ],
              ),
            ),
          ),
          SizedBox(
            width: width(context, 0.02),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: width(context, 0.13),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width(context, 0.10),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff064663),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "Accept",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height(context, 0.02),
                ),
                SizedBox(
                  width: width(context, 0.10),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff6E6E71),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "Reject",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
