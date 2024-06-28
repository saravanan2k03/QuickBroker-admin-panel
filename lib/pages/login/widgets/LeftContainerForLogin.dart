import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../Helper/app_setting.dart';

class LeftContainer extends StatelessWidget {
  const LeftContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: width(context, 0.60),
          color: const Color(0xff455A64),
          child: Image.asset(
            "images/bgcutimage.png",
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Row(
            children: [
              SizedBox(
                width: width(context, 0.10),
              ),
              Container(
                height: height(context, 0.55),
                width: width(context, 0.30),
                // color: Colors.red,
                child: SvgPicture.asset(
                  "images/pana.svg",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
