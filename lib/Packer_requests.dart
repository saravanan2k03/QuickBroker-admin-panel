import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Admin_profile.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import 'package:quik_broker_admin/Nav_bar.dart';
import 'package:uuid/uuid.dart';

import 'Push_notifications.dart';

class Packer_requests extends StatefulWidget {
  const Packer_requests({super.key});

  @override
  State<Packer_requests> createState() => _Packer_requestsState();
}

class _Packer_requestsState extends State<Packer_requests> {
  String searchtext = '';
  Stream<QuerySnapshot> getFirestoreStream() {
    // Replace 'your_collection' with the name of your Firestore collection
    Query<Map<String, dynamic>> collection = FirebaseFirestore.instance
        .collection('packer requests')
        .where('Name', isGreaterThanOrEqualTo: searchtext)
        .where('Name', isLessThan: searchtext + 'z');

    // Return the stream
    return collection.snapshots();
  }

  TextEditingController SearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      title: 'Packer requests',
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
              child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
                child: Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: getFirestoreStream(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      print(
                          '////////////////////////////////////////////////////////////////////////////////////////');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      );
                    } else {
                      Center(child: CircularProgressIndicator());
                    }

                    return ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return SizedBox(
                          child: SingleChildScrollView(
                            child: Packer_request_card(data: data),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ],
            )),
          ))
        ],
      ),
    );
  }
}

class Packer_request_card extends StatefulWidget {
  const Packer_request_card({super.key, required this.data});
  final Map<String, dynamic> data;
  @override
  State<Packer_request_card> createState() => _Packer_request_cardState();
}

class _Packer_request_cardState extends State<Packer_request_card> {
  @override
  CollectionReference collection =
      FirebaseFirestore.instance.collection('packer requests');

  Widget build(BuildContext context) {
    var uuid = Uuid().v1();
    bool loading = false;

    Add_notification(noti_title, noti_desc, current_user) async {
      try {
        setState(() {
          loading = true;
        });
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(widget.data['user_phone'])
            .collection('notifications')
            .doc(uuid)
            .set({
          "Notification_title": noti_title.toString(),
          "Notification_desc": noti_desc.toString(),
          'timestamp': DateTime.now()
        });

        setState(() {
          loading = false;
        });
      } catch (e) {
        showAlertDialog(context, "Error", e.toString());
      }
    }

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(224, 223, 223, 1),
      ),
      width: width(context, 0.80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.data['Range']}',
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'City : ${widget.data['City']}',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Text(
                          widget.data['Range'] == "Within the city"
                              ? 'Relocation from: ${widget.data['Rellocation_from']}    '
                              : 'Moving from: ${widget.data['Moving_from']}         ',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          widget.data['Range'] == "Within the city"
                              ? 'Relocation to: ${widget.data['Rellocation_to']}'
                              : 'Moving to: ${widget.data['Moving_to']}',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Name :  ${widget.data['Name']}',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Mobile number :  ${widget.data['phone']}',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Email :  ${widget.data['email']}',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 248, 248, 248),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    backgroundColor: Color.fromRGBO(6, 70, 99, 1),
                    side: BorderSide(
                        color: Color.fromRGBO(6, 70, 99, 1),
                        width: 1), //<-- SEE HERE
                  ),
                  onPressed: () {
                    Add_notification(
                        'Your packing request',
                        'Your packing request ${widget.data['Range'] == "Within the city" ? 'Relocation from: ${widget.data['Rellocation_from']}    ' : 'Moving from: ${widget.data['Moving_from']}         '} to ${widget.data['Range'] == "Within the city" ? 'Relocation to: ${widget.data['Rellocation_to']}' : 'Moving to: ${widget.data['Moving_to']}'} has accepted',
                        widget.data['current_user']);
                    FirebaseFirestore.instance
                        .collection('trash')
                        .doc('${widget.data['email']}')
                        .set({
                      'Range': 'Between the cities',
                      "City": widget.data['City'],
                      'Moving_from': widget.data['Moving_from'],
                      "Moving_to": widget.data['Moving_to'],
                      'Rellocation_to': widget.data['Rellocation_from'],
                      "Rellocation_from": widget.data['Rellocation_to'],
                      "Name": widget.data['Name'],
                      'email': widget.data['email'],
                      'phone': widget.data['phone'],
                      'user_phone': widget.data['user_phone'],
                    });

                    collection.doc('${widget.data['email']}').delete();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 30, left: 30, top: 5, bottom: 5),
                    child: const Text(
                      'Accept',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 248, 248, 248),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    backgroundColor: Color.fromRGBO(110, 110, 113, 1),
                    side: BorderSide(
                        color: Color.fromRGBO(110, 110, 113, 1),
                        width: 1), //<-- SEE HERE
                  ),
                  onPressed: () {
                    Add_notification(
                        'Your packing request',
                        'Your packing request ${widget.data['Range'] == "Within the city" ? 'Relocation from: ${widget.data['Rellocation_from']}    ' : 'Moving from: ${widget.data['Moving_from']}'} to ${widget.data['Range'] == "Within the city" ? 'Relocation to: ${widget.data['Rellocation_to']}' : 'Moving to: ${widget.data['Moving_to']}'} has declined',
                        widget.data['current_user']);
                    FirebaseFirestore.instance
                        .collection('trash')
                        .doc('${widget.data['email']}')
                        .set({
                      'Range': 'Between the cities',
                      "City": widget.data['City'],
                      'Moving_from': widget.data['Moving_from'],
                      "Moving_to": widget.data['Moving_to'],
                      'Rellocation_to': widget.data['Rellocation_from'],
                      "Rellocation_from": widget.data['Rellocation_to'],
                      "Name": widget.data['Name'],
                      'email': widget.data['email'],
                      'phone': widget.data['phone'],
                      'user_phone': widget.data['user_phone'],
                    });
                    collection.doc('${widget.data['email']}').delete();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 30, left: 30, top: 5, bottom: 5),
                    child: const Text(
                      'Reject',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
