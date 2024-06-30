import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import 'package:quik_broker_admin/Helper/constant/widgets/CustomAppbar.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned(
            bottom: 10,
            right: 25,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.drive_folder_upload_outlined,
                color: Colors.white,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff475BE8),
                minimumSize: const Size(170, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              label: const Text(
                "Update",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Column(
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
                width: width(context, 0.33),
                // height: height(context, 0.60),
                decoration: BoxDecoration(
                  color: const Color(0xffE0DFDF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      CustomTextFieldForSettings(
                        label: 'Name',
                      ),
                      CustomTextFieldForSettings(
                        label: 'Email',
                      ),
                      CustomTextFieldForSettings(
                        label: 'Password',
                      ),
                      CustomTextFieldForSettings(
                        label: 'Privacy  Policy',
                      ),
                      CustomTextFieldForSettings(
                        label: 'Terms & Condition',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomTextFieldForSettings extends StatelessWidget {
  final String label;
  const CustomTextFieldForSettings({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context, 0.08),
      width: Get.width,
      // color: Colors.redAccent,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 05),
            child: SizedBox(
              width: width(context, 0.15),
              // color: Colors.brown,
              child: Text(
                overflow: TextOverflow.ellipsis,
                label,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: Get.width * 0.15,
              // height: Get.height * 0.15,
              decoration: BoxDecoration(
                color: const Color(0xff455A64),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsetsDirectional.only(start: 05),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
