import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import 'package:quik_broker_admin/Main_page.dart';
import 'package:quik_broker_admin/Offer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email_controller = TextEditingController();
  TextEditingController name_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  late Future<DocumentSnapshot> data;

  @override
  void initState() {
    super.initState();
    data = FirebaseFirestore.instance.collection('admin').doc('admin').get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(69, 90, 100, 1),
        width: width(context, 1),
        height: height(context, 1),
        child: Row(
          children: [
            ClipPath(
              clipper: SlantedBorderClipper(),
              child: Container(
                child: Image.asset('images/pana.png'),
                width: width(context, 0.40),
                height: height(context, 1),
                color: const Color.fromRGBO(4, 28, 50, 1),
              ),
            ),
            Container(
              width: width(context, 0.6),
              // height: height(context, 0.65),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Hello!',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Welcome',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: width(context, 0.20),
                            padding: EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextField(
                              controller: name_controller,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Name',
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.black45,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: width(context, 0.20),
                            padding: EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextField(
                              controller: email_controller,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Email',
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: Colors.black45,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: width(context, 0.20),
                            padding: EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextField(
                              controller: password_controller,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Password',
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.black45,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor:
                                  Color.fromARGB(255, 248, 248, 248),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                              backgroundColor: Color.fromRGBO(232, 170, 84, 1),
                              side: BorderSide(
                                color: Color.fromRGBO(232, 170, 84, 1),
                                width: 1,
                              ),
                            ),
                            onPressed: () async {
                              DocumentSnapshot snapshot = await data;
                              var docData =
                                  snapshot.data() as Map<String, dynamic>?;

                              if (docData != null &&
                                  docData['email'] == email_controller.text &&
                                  docData['password'] ==
                                      password_controller.text &&
                                  docData['name'] == name_controller.text) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => MainPage()),
                                );
                              } else {
                                showAlertDialog(
                                    context, 'Error', 'Enter correct details');
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 150,
                                right: 150,
                                top: 20,
                                bottom: 20,
                              ),
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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

class SlantedBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width * 0.9, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

void showAlertDialog(BuildContext context, String title, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}

double width(BuildContext context, double factor) {
  return MediaQuery.of(context).size.width * factor;
}

double height(BuildContext context, double factor) {
  return MediaQuery.of(context).size.height * factor;
}
