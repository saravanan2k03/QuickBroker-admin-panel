// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

double height(context, double hgt) {
  return MediaQuery.of(context).size.height * hgt;
}

double width(context, double wdt) {
  return MediaQuery.of(context).size.width * wdt;
}

Widget divider(context, double hgt) {
  return Divider(
    height: hgt,
    color: Colors.transparent,
  );
}

String app_name = "Quikbroker";
Color app_bar_color = const Color(0xffd8232a);
// ignore: use_full_hex_values_for_flutter_colors
Color cardcolor = const Color(0xffd455a64);
Widget custom_app_bar() {
  return SliverAppBar(
    floating: true,
    pinned: true,
    snap: false,
    centerTitle: false,
    title: const Text('Kindacode.com'),
    actions: [
      IconButton(
        icon: const Icon(Icons.shopping_cart),
        onPressed: () {},
      ),
    ],
    bottom: AppBar(
      title: Container(
        width: double.infinity,
        height: 40,
        color: Colors.white,
        child: const Center(
          child: TextField(
            decoration: InputDecoration(
                hintText: 'Search for something',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.camera_alt)),
          ),
        ),
      ),
    ),
  );
}
