import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Admin_profile.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import 'package:quik_broker_admin/Nav_bar.dart';

class Users extends StatefulWidget {
  const Users({Key? key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  String searchtext = '';

  Stream<QuerySnapshot> getFirestoreStream() {
    CollectionReference collection =
        FirebaseFirestore.instance.collection('Users');

    return collection.snapshots();
  }

  Stream<QuerySnapshot> seachedFirestoreStream() {
    Query<Map<String, dynamic>> collection = FirebaseFirestore.instance
        .collection('Users')
        .where('name', isGreaterThanOrEqualTo: searchtext)
        .where('name', isLessThan: searchtext + 'z');

    return collection.snapshots();
  }

  TextEditingController SearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     // Add your onPressed code here!
      //   },
      //   label: Text(
      //     'Add user',
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   icon: Icon(Icons.add, color: Colors.white),
      //   backgroundColor: Color.fromARGB(255, 0, 98, 211),
      // ),
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
                        title: 'Users',
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
                scrollDirection: Axis.horizontal,
                child: Container(
                  margin: EdgeInsets.only(left: 20, bottom: 0.2),
                  width: width(context, 0.8),
                  color: Color.fromARGB(0, 97, 62, 62),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: seachedFirestoreStream(),
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
                      MaterialStateColor color = MaterialStateColor.resolveWith(
                          (states) => Colors.white);
                      return Container(
                        child: SizedBox(
                          width: width(context, 0.80),
                          child: SingleChildScrollView(
                            child: DataTable(
                              headingRowColor: color,
                              columns: [
                                DataColumn(
                                  label: SizedBox(
                                    width: width(context, 0.05),
                                    child: Container(
                                      child: Text(
                                        'uid',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Container(
                                    child: Text(
                                      'Avatar',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Container(
                                    child: Text(
                                      'name',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Container(
                                    child: Text(
                                      'email',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Container(
                                    child: Text(
                                      'password',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Container(
                                    child: Text(
                                      'mobile Number',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                              rows: snapshot.data!.docs
                                  .map((DocumentSnapshot document) {
                                MaterialStateColor color =
                                    MaterialStateColor.resolveWith(
                                        (states) => Colors.white);
                                Map<String, dynamic> data =
                                    document.data()! as Map<String, dynamic>;
                                return DataRow(
                                  color: color,
                                  cells: [
                                    DataCell(Container(
                                      child: Text('${document.id}'),
                                    )),
                                    DataCell(Container(
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'https://fastly.picsum.photos/id/9/250/250.jpg?hmac=tqDH5wEWHDN76mBIWEPzg1in6egMl49qZeguSaH9_VI'),
                                      ),
                                    )),
                                    DataCell(Container(
                                      child: Text('${data['name']}'),
                                    )),
                                    DataCell(Container(
                                      child: Text('email'),
                                    )),
                                    DataCell(Container(
                                      child: Text('password'),
                                    )),
                                    DataCell(Container(
                                      child: Text('${data['phone']}'),
                                    )),
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
