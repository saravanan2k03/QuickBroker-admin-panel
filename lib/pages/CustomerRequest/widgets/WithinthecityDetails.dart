import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';

class withinthecityaddress extends StatelessWidget {
  const withinthecityaddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.red,
      height: height(context, 0.03),
      width: MediaQuery.of(context).size.width,
      child: const Row(
        children: [
          Text(
            "Relocation From:",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            width: 05,
          ),
          Text(
            "30/A ,  Adyor, 3 rd street",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            width: 25,
          ),
          Text(
            "Relocation To:",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            width: 05,
          ),
          Text(
            "A/c  ,  Adyor, 3 rd street Ambathur, 5 th street",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
