import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Admin_profile.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';

class Nav_bar extends StatefulWidget {
  final String title;

  const Nav_bar({Key? key, required this.title}) : super(key: key);

  @override
  State<Nav_bar> createState() => _Nav_barState();
}
class _Nav_barState extends State<Nav_bar> {
  Future<DocumentSnapshot> getdata() async {
    return FirebaseFirestore.instance.collection('admin').doc('admin').get();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Screen_title(title: widget.title,),
              Container(
                width: width(context, 0.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Container(
                    //   height: 45,
                    //   width: width(context, 0.22),
                    //   child: TextField(
                    //     decoration: InputDecoration(
                    //       prefixIcon: Icon(
                    //         Icons.search_outlined,
                    //         color: Colors.black,
                    //       ),
                    //       hintStyle: TextStyle(color: Colors.black),
                    //       hintText: 'Search',
                    //       fillColor: Colors.white,
                    //       filled: true,
                    //       border: OutlineInputBorder(
                    //         borderSide: BorderSide.none,
                    //         borderRadius: BorderRadius.circular(5.0),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Admin_profile(),
                    // IconButton(
                    //   icon: Icon(
                    //     Icons.notifications,
                    //     color: Colors.white,
                    //     size: 35,
                    //   ),
                    //   onPressed: () {
                    //     // Handle notification button press
                    //   },
                    // ),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
