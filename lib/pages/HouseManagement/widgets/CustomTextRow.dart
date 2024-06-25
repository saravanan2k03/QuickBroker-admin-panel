import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import 'package:quik_broker_admin/Helper/constant/widgets/components.dart';

class CustomTextRow extends StatelessWidget {
  final String textvalue;
  final String title;
  final bool editable;
  const CustomTextRow({
    super.key,
    required this.title,
    required this.textvalue,
    required this.editable,
  });

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
          Visibility(
            visible: !editable,
            replacement: Container(
              height: height(context, 0.06),
              width: width(context, 0.15),
              // color: Colors.red,
              child: customTextFieldUsingInitialValue(
                  context, title, textvalue, (value) {}),
            ),
            child: Container(
              height: height(context, 0.05),
              width: width(context, 0.15),
              decoration: BoxDecoration(
                  // color: Colors.red,
                  borderRadius: BorderRadius.circular(05),
                  border: Border.all(width: 1.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: width(context, 0.12),
                    // color: Colors.blue,
                    child: Center(
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        textvalue,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.edit,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
