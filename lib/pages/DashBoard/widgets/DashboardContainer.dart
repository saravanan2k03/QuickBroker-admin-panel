import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';

class DashboarCustomContainer extends StatelessWidget {
  final Image image;
  final String title;
  final String data;
  final double imageheight;
  final double imagewidth;
  const DashboarCustomContainer({
    super.key,
    required this.image,
    required this.title,
    required this.data,
    required this.imageheight,
    required this.imagewidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context, 0.15),
      width: width(context, 0.21),
      decoration: BoxDecoration(
          color: cardcolor, borderRadius: BorderRadius.circular(05)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      // color: Colors.red,
                      width: width(context, 0.19),
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  // color: Colors.yellow,
                  width: width(context, 0.19),
                  height: height(context, 0.06),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        // color: Colors.blue,
                        height: imageheight,
                        width: imagewidth,
                        child: image,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
