import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import 'package:quik_broker_admin/pages/HouseManagement/widgets/CustomTextRowForAddHouseProperty.dart';
import 'package:quik_broker_admin/Helper/constant/widgets/components.dart';

class LeftContainerForAddHouseProperty extends StatelessWidget {
  const LeftContainerForAddHouseProperty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: height(context, 0.03),
        ),
        Container(
          height: height(context, 0.35),
          width: width(context, 0.35),
          color: Colors.white,
        ),
        SizedBox(
          height: height(context, 0.02),
        ),
        Row(
          children: [
            SizedBox(
              width: width(context, 0.02),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 05),
              child: Text(
                "Property Pricing",
                style: TextStyle(
                  color: Color(0xff23234B),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 05,
        ),
        Row(
          children: [
            SizedBox(
              width: width(context, 0.02),
            ),
            SizedBox(
              height: height(context, 0.06),
              width: width(context, 0.15),
              child: customTextFieldUsingInitialValue(
                  context, "Price", "textvalue", (value) {}),
            )
          ],
        ),
        SizedBox(
          height: height(context, 0.02),
        ),
        Row(
          children: [
            SizedBox(
              width: width(context, 0.02),
            ),
            const Text(
              "Address",
              style: TextStyle(
                color: Color(0xff11142D),
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(
          height: height(context, 0.02),
        ),
        Row(
          children: [
            SizedBox(
              width: width(context, 0.02),
            ),
            Container(
              constraints: BoxConstraints(
                maxHeight: height(context, 0.25),
              ),
              width: width(context, 0.35),
              child: customTextAreaUsingInitialvalue(
                  context, "Address", "", (value) {}),
            ),
          ],
        ),
        SizedBox(
          height: height(context, 0.05),
        ),
        Row(
          children: [
            SizedBox(
              width: width(context, 0.02),
            ),
            SizedBox(
              // color: Colors.blueAccent,
              width: width(context, 0.35),
              child: const Column(
                children: [
                  CustomTextRowForAddHouseProperty(
                    title: "Facing",
                    textvalue: "Facing",
                  ),
                  CustomTextRowForAddHouseProperty(
                    title: "Overlooking",
                    textvalue: "Facing",
                  ),
                  CustomTextRowForAddHouseProperty(
                    title: "Units availability",
                    textvalue: "Facing",
                  ),
                  CustomTextRowForAddHouseProperty(
                    title: "Furnishing",
                    textvalue: "Facing",
                  ),
                  CustomTextRowForAddHouseProperty(
                    title: "Landmark",
                    textvalue: "Facing",
                  ),
                  CustomTextRowForAddHouseProperty(
                    title: "Water availability",
                    textvalue: "Facing",
                  ),
                  CustomTextRowForAddHouseProperty(
                    title: "Status of Electicity",
                    textvalue: "Facing",
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
