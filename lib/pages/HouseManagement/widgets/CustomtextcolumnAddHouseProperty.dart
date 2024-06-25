import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import 'package:quik_broker_admin/Helper/constant/widgets/components.dart';

class CustomtextcolumnAddHouseProperty extends StatelessWidget {
  final String title;
  final String textvalue;
  const CustomtextcolumnAddHouseProperty(
      {super.key, required this.title, required this.textvalue});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: width(context, 0.15),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 05),
                child: Container(
                  height: height(context, 0.06),
                  width: width(context, 0.15),
                  // color: Colors.red,
                  child: customTextFieldUsingInitialValue(
                      context, "", textvalue, (value) {}),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
