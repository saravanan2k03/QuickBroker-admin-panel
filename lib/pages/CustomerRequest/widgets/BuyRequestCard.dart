import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import 'package:quik_broker_admin/pages/constant/const.dart';

class BuyRequestContainer extends StatelessWidget {
  const BuyRequestContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context, 0.25),
      width: width(context, 0.80),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: height(context, 0.50),
              width: width(context, 0.20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue)),
              child: Image.asset(
                "images/House.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: width(context, 0.13),
            // color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      "Property name",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: buyrequestfontcolor),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      "\$35000",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: buyrequestfontcolor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: width(context, 0.15),
            // color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      "Buyer",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: buyrequestfontcolor),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width(context, 0.05),
                        child: Text(
                          "Name:",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: buyrequestfontcolor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width(context, 0.09),
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          "M.saravanan",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: buyrequestfontcolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width(context, 0.05),
                        child: Text(
                          "Number:",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: buyrequestfontcolor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width(context, 0.09),
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          "+917010036889",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: buyrequestfontcolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width(context, 0.05),
                        child: Text(
                          "UID:",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: buyrequestfontcolor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width(context, 0.09),
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          "1235638056",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: buyrequestfontcolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height(context, 0.20),
            child: const VerticalDivider(
              color: Color(0xff383854),
              width: 0.1,
            ),
          ),
          SizedBox(
            width: width(context, 0.009),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: width(context, 0.15),
            // color: Colors.yellow,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      "Seller",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: buyrequestfontcolor),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width(context, 0.05),
                        child: Text(
                          "Name:",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: buyrequestfontcolor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width(context, 0.09),
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          "M.saravanan",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: buyrequestfontcolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width(context, 0.05),
                        child: Text(
                          "Number:",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: buyrequestfontcolor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width(context, 0.09),
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          "+917010036889",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: buyrequestfontcolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width(context, 0.05),
                        child: Text(
                          "UID:",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: buyrequestfontcolor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width(context, 0.09),
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          "1235638056",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: buyrequestfontcolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: width(context, 0.15),
            // color: Colors.green,
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
                      "Sold",
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
                      "Delete",
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
