import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        // color: Colors.blue,
        height: MediaQuery.of(context).size.height,
        width: width(context, 0.55),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(05),
              ),
              width: width(context, 0.27),
              child: TextField(
                decoration: InputDecoration(
                  label: const Text("Search"),
                  labelStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(05),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: width(context, 0.08),
              height: height(context, 0.10),
              // color: Colors.blueGrey,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    size: 35,
                    color: Colors.white,
                  )),
            ),
            Container(
              height: height(context, 0.05),
              // width: width(context, 0.17),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 05),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    // padding: EdgeInsets.only(right: 10),
                    margin: const EdgeInsets.only(right: 25),
                    constraints: BoxConstraints(
                        maxWidth: width(context, 0.15),
                        minWidth: width(context, 0.10)),

                    // color: Colors.red,
                    // width: width(context, 0.10),
                    child: const Text(
                      "Saravanan",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
