import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import 'package:quik_broker_admin/pages/CustomerRequest/widgets/PackerRequestContainer.dart';
import 'package:quik_broker_admin/Helper/constant/widgets/CustomAppbar.dart';

class PackerRequest extends StatelessWidget {
  const PackerRequest({super.key});

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
                      child: PackerRequestContainer(),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
