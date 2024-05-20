import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Admin_profile.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import 'package:quik_broker_admin/Nav_bar.dart';

class Push_notifications extends StatefulWidget {
  const Push_notifications({super.key});

  @override
  State<Push_notifications> createState() => _Push_notificationsState();
}

class _Push_notificationsState extends State<Push_notifications> {
  TextEditingController Notification_title_controller = TextEditingController();
  TextEditingController Notification_desc_controller = TextEditingController();

  @override
  bool loading = false;

  Add_notification() async {
    try {
      setState(() {
        loading = true;
      });
      await FirebaseFirestore.instance
          .collection("notifications")
          .doc(Notification_title_controller.text.toString())
          .set({
        "Notification_title": Notification_title_controller.text.toString(),
        "Notification_desc": Notification_desc_controller.text.toString(),
        'timestamp': DateTime.now()
      });

      setState(() {
        loading = false;
      });
    } catch (e) {
      showAlertDialog(context, "Error", e.toString());
    }
  }

  Add_notification_dialog() {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text('Send notification'),
      content: Container(
        height: height(context, 0.6),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: width(context, 0.20),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller: Notification_title_controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Notification title',
                    prefixIcon: Icon(
                      Icons.discount_outlined,
                      color: Colors.black45,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: width(context, 0.20),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller: Notification_desc_controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Notification description',
                    prefixIcon: Icon(
                      Icons.discount_outlined,
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
                  foregroundColor: Color.fromARGB(255, 248, 248, 248),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  backgroundColor: Color.fromRGBO(232, 170, 84, 1),
                  side: BorderSide(
                      color: Color.fromRGBO(51, 0, 109, 1),
                      width: 1), //<-- SEE HERE
                ),
                onPressed: () {
                  if (Notification_title_controller.text.isNotEmpty &&
                      Notification_desc_controller.text.isNotEmpty) {
                    Add_notification();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 150, right: 150, top: 20, bottom: 20),
                  child: loading
                      ? CircularProgressIndicator(
                          color: Colors.black,
                        )
                      : Text(
                          'Add Notification',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                ),
              ),
            )
          ],
        ),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  String searchtext = '';
  Stream<QuerySnapshot> getFirestoreStream() {
    // Replace 'your_collection' with the name of your Firestore collection
    Query<Map<String, dynamic>> collection = FirebaseFirestore.instance
        .collection('notifications')
        .where('Notification_title', isGreaterThanOrEqualTo: searchtext)
        .where('Notification_title', isLessThan: searchtext + 'z');
    // Return the stream
    return collection.snapshots();
  }

  TextEditingController SearchController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Add_notification_dialog();
        },
        label: Text(
          'Send message',
          style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
        ),
        icon: Icon(Icons.send, color: const Color.fromARGB(255, 0, 0, 0)),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Container(
        color: Color.fromRGBO(4, 28, 50, 1),
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Screen_title(
                        title: 'Push notification',
                      ),
                      Container(
                        width: width(context, 0.5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 45,
                              width: width(context, 0.22),
                              child: TextField(
                                onChanged: (val) {
                                  setState(() {
                                    searchtext = val;
                                  });
                                },
                                controller: SearchController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search_outlined,
                                    color: Colors.black,
                                  ),
                                  hintStyle: TextStyle(color: Colors.black),
                                  hintText: 'Search',
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                            ),
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
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 252, 252, 252),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(children: [
                    StreamBuilder<QuerySnapshot>(
                      stream: getFirestoreStream(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          print(
                              '////////////////////////////////////////////////////////////////////////////////////////');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          );
                        } else {
                          Center(child: CircularProgressIndicator());
                        }

                        return ListView(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data()! as Map<String, dynamic>;
                            return SizedBox(
                              child: SingleChildScrollView(
                                child: Push_notification_card(data: data),
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Push_notification_card extends StatefulWidget {
  const Push_notification_card({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  State<Push_notification_card> createState() => _Push_notification_cardState();
}

class _Push_notification_cardState extends State<Push_notification_card> {
  TextEditingController Notification_desc_controller = TextEditingController();

  bool loading = false;

  Edit_notification(noti_title) async {
    try {
      setState(() {
        loading = true;
      });
      await FirebaseFirestore.instance
          .collection("notifications")
          .doc(noti_title)
          .update({
        "Notification_desc": Notification_desc_controller.text.toString(),
        'timestamp': DateTime.now()
      });

      setState(() {
        loading = false;
      });
    } catch (e) {
      showAlertDialog(context, "Error", e.toString());
    }
  }

  Delete_notification(noti_title) async {
    try {
      setState(() {
        loading = true;
      });
      await FirebaseFirestore.instance.collection("trash").doc(noti_title).set({
        "Notification_desc": widget.data['Notification_desc'],
        "Notification_title": widget.data['Notification_title'],
        'timestamp': DateTime.now()
      });

      await FirebaseFirestore.instance
          .collection("notifications")
          .doc(noti_title)
          .delete();

      setState(() {
        loading = false;
      });
    } catch (e) {
      showAlertDialog(context, "Error", e.toString());
    }
  }

  Edit_notification_dialog(noti_title) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text('Send notification'),
      content: Container(
        height: height(context, 0.6),
        child: Column(
          children: [
            Text(noti_title),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: width(context, 0.20),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller: Notification_desc_controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Notification description',
                    prefixIcon: Icon(
                      Icons.discount_outlined,
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
                  foregroundColor: Color.fromARGB(255, 248, 248, 248),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  backgroundColor: Color.fromRGBO(232, 170, 84, 1),
                  side: BorderSide(
                      color: Color.fromRGBO(51, 0, 109, 1),
                      width: 1), //<-- SEE HERE
                ),
                onPressed: () {
                  if (Notification_desc_controller.text.isNotEmpty) {
                    Edit_notification(noti_title);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 150, right: 150, top: 20, bottom: 20),
                  child: loading
                      ? CircularProgressIndicator(
                          color: Colors.black,
                        )
                      : Text(
                          'Edit Notification',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                ),
              ),
            )
          ],
        ),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(69, 90, 100, 1),
      ),
      width: width(context, 0.80),
      child: Row(
        children: [
          Container(
            width: width(context, 0.50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://fastly.picsum.photos/id/9/250/250.jpg?hmac=tqDH5wEWHDN76mBIWEPzg1in6egMl49qZeguSaH9_VI'),
                ),
                Flexible(
                  child: Container(
                    width: width(context, 0.7),
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '${widget.data['Notification_title']}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(223, 245, 245, 245),
                            fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                        Text(
                          '${widget.data['Notification_desc']}',
                          style: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(218, 247, 247, 247),
                            fontWeight: FontWeight.w100,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 0, 0, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    backgroundColor: Color.fromRGBO(253, 253, 253, 1),
                    side: BorderSide(
                      color: Color.fromRGBO(6, 70, 99, 1),
                      width: 1,
                    ), //<-- SEE HERE
                  ),
                  onPressed: () {
                    Delete_notification(widget.data['Notification_title']);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      left: 20,
                      top: 5,
                      bottom: 5,
                    ),
                    child: const Text(
                      'Delete',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 248, 248, 248),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    backgroundColor: Color.fromRGBO(19, 19, 255, 1),
                    side: BorderSide(
                      color: Color.fromRGBO(32, 32, 255, 1),
                      width: 1,
                    ), //<-- SEE HERE
                  ),
                  onPressed: () {
                    Edit_notification_dialog(widget.data['Notification_title']);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 30,
                      left: 30,
                      top: 5,
                      bottom: 5,
                    ),
                    child: const Text(
                      'Edit',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

showAlertDialog(BuildContext context, String title, String content) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
