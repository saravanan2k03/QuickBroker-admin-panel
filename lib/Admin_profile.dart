import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';

class Admin_profile extends StatefulWidget {
  const Admin_profile({super.key});

  @override
  State<Admin_profile> createState() => _Admin_profileState();
}

class _Admin_profileState extends State<Admin_profile> {
  Future<DocumentSnapshot> getdata() async {
    return FirebaseFirestore.instance.collection('admin').doc('admin').get();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: getdata(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        final docData = snapshot.data!.data() as Map<String, dynamic>?;
        return Container(
          width: width(context, 0.12),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Expanded(
                child: Image.asset('images/Ellipse 1.png'),
              ),
              Column(
                children: [
                  SizedBox(
                    width: width(context, 0.065),
                    child: Text(
                      textAlign: TextAlign.center,
                      '${docData?['name']}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width(context, 0.065),
                    child: Text(
                      textAlign: TextAlign.center,
                      '${docData?['email']}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

class Screen_title extends StatefulWidget {
  const Screen_title({super.key, required this.title});
  final String title;
  @override
  State<Screen_title> createState() => _Screen_titleState();
}

class _Screen_titleState extends State<Screen_title> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
