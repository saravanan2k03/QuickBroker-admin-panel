import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import 'package:quik_broker_admin/Helper/constant/widgets/CustomAppbar.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

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
                      "Setting",
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
              height: height(context, 0.15),
            ),
            Container(
              width: width(context, 0.40),
              height: height(context, 0.60),
              decoration: BoxDecoration(
                color: const Color(0xffE0DFDF),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Container(
                    height: height(context, 0.25),
                    width: width(context, 0.30),
                    color: Colors.red,
                  ),
                  Container(
                    height: height(context, 0.25),
                    width: width(context, 0.30),
                    color: Colors.green,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
