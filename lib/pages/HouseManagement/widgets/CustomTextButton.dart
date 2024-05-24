import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';

class CustomButtons extends StatelessWidget {
  final bool enabled;
  const CustomButtons({
    super.key,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: height(context, 0.06),
          width: width(context, 0.08),
          decoration: BoxDecoration(
            color: enabled ? Colors.transparent : Colors.black,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(width: 1.0, color: Colors.black),
          ),
          child: Center(
            child: Text(
              "Rent",
              style: TextStyle(
                color: enabled ? Colors.black : Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        SizedBox(
          width: width(context, 0.02),
        ),
        Container(
          height: height(context, 0.06),
          width: width(context, 0.08),
          decoration: BoxDecoration(
            color: !enabled ? Colors.transparent : Colors.black,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(width: 1.0, color: Colors.black),
          ),
          child: Center(
            child: Text(
              "Buy",
              style: TextStyle(
                color: !enabled ? Colors.black : Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
