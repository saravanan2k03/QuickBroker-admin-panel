import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import 'package:quik_broker_admin/pages/constant/widgets/components.dart';

class Customtextcolumn extends StatelessWidget {
  final bool editable;
  final String title;
  final String textvalue;
  const Customtextcolumn({
    super.key,
    required this.editable,
    required this.title,
    required this.textvalue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          // height: height(context, 0.08),
          width: width(context, 0.15),
          // color: Colors.red,
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
              Visibility(
                visible: !editable,
                replacement: Container(
                    height: height(context, 0.06),
                    width: width(context, 0.15),
                    // color: Colors.red,
                    child: customTextFieldUsingInitialValue(
                        context, title, textvalue, (value) {})),
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
        ),
      ],
    );
  }
}
