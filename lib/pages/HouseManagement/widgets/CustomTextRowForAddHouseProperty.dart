import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import 'package:quik_broker_admin/pages/constant/widgets/components.dart';

class CustomTextRowForAddHouseProperty extends StatelessWidget {
  final String textvalue;
  final String title;
  const CustomTextRowForAddHouseProperty(
      {super.key, required this.textvalue, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: width(context, 0.15),
            // color: Colors.blue,
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xff707070),
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(
            height: height(context, 0.06),
            width: width(context, 0.15),
            // color: Colors.red,
            child: customTextFieldUsingInitialValue(
                context, title, textvalue, (value) {}),
          ),
        ],
      ),
    );
  }
}
