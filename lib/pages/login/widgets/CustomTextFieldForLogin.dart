import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';

class CustomTextFieldForLogin extends StatelessWidget {
  final String hinttext;
  final Icon textIcon;
  const CustomTextFieldForLogin({
    super.key,
    required this.hinttext,
    required this.textIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context, 0.08),
      width: width(context, 0.20),
      decoration: BoxDecoration(
        color: const Color(0xffEEEEEE),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: textIcon,
              prefixIconColor: Colors.grey,
              hintText: hinttext,
              hintStyle: const TextStyle(
                color: Colors.black,
              ),
              // labelText: "Email",
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
