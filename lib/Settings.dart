import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import 'package:quik_broker_admin/Nav_bar.dart';
import 'package:quik_broker_admin/Push_notifications.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController name_controller = TextEditingController();
  TextEditingController privacypolicy_controller = TextEditingController();
  TextEditingController termsandconditions_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (email_controller.text.isNotEmpty &&
              name_controller.text.isNotEmpty) {
            try {
              FirebaseFirestore.instance.collection('admin').doc('admin').set({
                'name': name_controller.text,
                'email': email_controller.text,
                'password': password_controller.text
              });
              showAlertDialog(
                  context, 'Successfully changed', 'Successfully changed');
              name_controller.clear();
              email_controller.clear();
              password_controller.clear();
            } catch (e) {
              showAlertDialog(context, 'Make sure you filled name and email',
                  'Make sure you filled name and email');
            }
          }

          if (termsandconditions_controller.text.isNotEmpty) {
            try {
              FirebaseFirestore.instance
                  .collection('terms and conditions')
                  .doc('terms and conditions')
                  .set({
                'terms and conditions': termsandconditions_controller.text,
              });
              showAlertDialog(
                  context, 'Successfully changed', 'Successfully changed');
              termsandconditions_controller.clear();
            } catch (e) {
              showAlertDialog(context, 'Make sure you filled name and email',
                  'Make sure you filled name and email');
            }
          }

          if (privacypolicy_controller.text.isNotEmpty) {
            try {
              FirebaseFirestore.instance
                  .collection('privacy and policy')
                  .doc('privacy and policy')
                  .set({
                'privacy and policy': privacypolicy_controller.text,
              });
              showAlertDialog(
                  context, 'Successfully changed', 'Successfully changed');
              privacypolicy_controller.clear();
            } catch (e) {
              showAlertDialog(context, 'Make sure you filled name and email',
                  'Make sure you filled name and email');
            }
          }

          // Add your onPressed code here!
        },
        label: Text(
          'Update',
          style: TextStyle(color: Color.fromARGB(255, 233, 233, 233)),
        ),
        icon: Icon(Icons.file_upload_outlined,
            color: Color.fromARGB(255, 243, 243, 243)),
        backgroundColor: Color.fromARGB(255, 14, 138, 255),
      ),
      body: Container(
        color: Color.fromRGBO(4, 28, 50, 1),
        child: Column(
          children: [
            Nav_bar(
              title: 'Settings',
            ),
            Center(
              child: Container(
                height: 500,
                width: width(context, 0.3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(215, 215, 215, 1)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: width(context, 0.02),
                        ),
                        Text(
                          'Name',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: width(context, 0.072),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Container(
                            width: width(context, 0.13),
                            padding: EdgeInsets.all(1.0),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(69, 90, 100, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              padding: EdgeInsets.only(right: 0.20),
                              child: TextField(
                                controller: name_controller,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width(context, 0.02),
                        ),
                        Text(
                          'Email',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(width: width(context, 0.075)),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Container(
                            width: width(context, 0.13),
                            padding: EdgeInsets.all(1.0),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(69, 90, 100, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              padding: EdgeInsets.only(right: 0.20),
                              child: TextField(
                                controller: email_controller,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width(context, 0.02),
                        ),
                        Text(
                          'Password',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: width(context, 0.055),
                        ),
                        Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Container(
                            width: width(context, 0.13),
                            padding: EdgeInsets.all(1.0),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(69, 90, 100, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              padding: EdgeInsets.only(right: 0.20),
                              child: TextField(
                                controller: password_controller,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width(context, 0.02),
                        ),
                        Text(
                          'Privacy Policy',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: width(context, 0.037),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Container(
                            width: width(context, 0.13),
                            padding: EdgeInsets.all(1.0),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(69, 90, 100, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              padding: EdgeInsets.only(right: 0.20),
                              child: TextField(
                                controller: privacypolicy_controller,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width(context, 0.02),
                        ),
                        Text(
                          'Terms & Conditions',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: width(context, 0.01),
                        ),
                        Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Container(
                            width: width(context, 0.13),
                            padding: EdgeInsets.all(1.0),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(69, 90, 100, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              padding:
                                  EdgeInsets.only(right: width(context, 5)),
                              child: TextField(
                                controller: termsandconditions_controller,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
