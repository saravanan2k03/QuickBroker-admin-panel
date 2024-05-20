import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:quik_broker_admin/Admin_profile.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import 'package:quik_broker_admin/House_management_detail.dart';
import 'package:quik_broker_admin/Nav_bar.dart';

class House_management extends StatefulWidget {
  const House_management({super.key});

  @override
  State<House_management> createState() => _House_managementState();
}

class _House_managementState extends State<House_management> {
  String searchtext = '';

  Stream<QuerySnapshot> getFirestoreStream() {
    // Replace 'your_collection' with the name of your Firestore collection
    Query<Map<String, dynamic>> collection = FirebaseFirestore.instance
        .collection('properties')
        .where('adtitle', isGreaterThanOrEqualTo: searchtext)
        .where('adtitle', isLessThan: searchtext + 'z');

    // Return the stream
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
      //   label: Text('Add property'),
      //   icon: Icon(Icons.add),
      //   backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
                        title: 'House management',
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
              child: Column(children: [
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

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          return SizedBox(
                            child: SingleChildScrollView(
                              child: House_management_card(data: data),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  },
                ),
              ]),
            ))
          ],
        ),
      ),
    );
  }
}

class House_management_card extends StatefulWidget {
  const House_management_card({super.key, required this.data});
  final Map<String, dynamic> data;
  @override
  State<House_management_card> createState() => _House_management_cardState();
}

class _House_management_cardState extends State<House_management_card> {
  bool loading = false;

  List months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'June',
    'July',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  @override
  Widget build(BuildContext context) {
    sold_property() {
      FirebaseFirestore.instance
          .collection('properties')
          .doc("${widget.data['id']}")
          .update({
        'solded': true,
      });
      FirebaseFirestore.instance
          .collection('solded properties')
          .doc("${widget.data['id']}")
          .set({
        'adtitle': widget.data['adtitle'],
        'breadth': widget.data['breadth'],
        'describe': widget.data['describe'],
        'facing': widget.data['facing'],
        'home': widget.data['home'],
        'id': widget.data['id'],
        'images': widget.data['images'],
        'length': widget.data['length'],
        'listedby': widget.data['listedby'],
        'location': widget.data['location'],
        'plotarea': widget.data['plotarea'],
        'price': widget.data['price'],
        'seller_name': widget.data['seller_name'],
        'seller_phone': widget.data['seller_phone'],
        'seller_uid': widget.data['seller_uid'],
        'BHK': widget.data['BHK'],
        'address': widget.data['address'],
        'configuration': widget.data['configuration'],
        'covered_area': widget.data['covered_area'],
        'electricity': widget.data['electricity'],
        'floor': widget.data['floor'],
        'house_details': widget.data['house_details'],
        'water': widget.data['water'],
        'units_available': widget.data['units_available'],
        'status': widget.data['status'],
      });
      CollectionReference<Map<String, dynamic>> collection =
          FirebaseFirestore.instance.collection('turn_over');
      DocumentReference<Map<String, dynamic>> docRef =
          collection.doc('turn_over');
      docRef.update({
        '${months[DateTime.now().month - 1]}':
            FieldValue.increment(int.parse(widget.data['price']))
      });
      //  FirebaseFirestore.instance
      //     .collection('Users')
      //     .doc('$_phoneNumber')
      //     .collection('Myproperties')
      //     .doc("${widget.id}")
      //     .delete();
      // FirebaseFirestore.instance
      //     .collection('properties')
      //     .doc("${widget.id}")
      //     .delete();
    }

    delete_property() {
      setState(() {
        loading = true;
      });

      FirebaseFirestore.instance
          .collection('trash')
          .doc("${widget.data['id']}")
          .set({
        'adtitle': widget.data['adtitle'],
        'breadth': widget.data['breadth'],
        'describe': widget.data['describe'],
        'facing': widget.data['facing'],
        'home': widget.data['home'],
        'id': widget.data['id'],
        'images': widget.data['images'],
        'length': widget.data['length'],
        'listedby': widget.data['listedby'],
        'location': widget.data['location'],
        'plotarea': widget.data['plotarea'],
        'price': widget.data['price'],
        'seller_name': widget.data['seller_name'],
        'seller_phone': widget.data['seller_phone'],
        'seller_uid': widget.data['seller_uid'],
        'BHK': widget.data['BHK'],
        'address': widget.data['address'],
        'configuration': widget.data['configuration'],
        'covered_area': widget.data['covered_area'],
        'electricity': widget.data['electricity'],
        'floor': widget.data['floor'],
        'house_details': widget.data['house_details'],
        'water': widget.data['water'],
        'units_available': widget.data['units_available'],
        'status': widget.data['status'],
      });

      FirebaseFirestore.instance
          .collection('Users')
          .doc(widget.data['seller_phone'])
          .collection('Myproperties')
          .doc("${widget.data['id']}")
          .delete();
      FirebaseFirestore.instance
          .collection('properties')
          .doc("${widget.data['id']}")
          .delete();

      showAlertDialog(context, 'successfully deleted', 'Done');
      setState(() {
        loading = false;
      });
    }

    return Container(
      padding: EdgeInsets.all(40),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(224, 223, 223, 1),
      ),
      width: width(context, 0.80),
      height: 266,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: width(context, 0.40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: ImageNetwork(
                      image: widget.data['images'][0],
                      height: 150,
                      width: 250,
                    ),
                    height: 220,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.data['adtitle'],
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined),
                        Text(
                          widget.data['location'],
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Container(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Name : ${widget.data['seller_name']}',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Number : ${widget.data['seller_phone']}',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'UID : ${widget.data['seller_uid']}',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${widget.data['price']}',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              (widget.data['solded'] == null || widget.data['solded'] == false)
                  ? OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Color.fromARGB(255, 248, 248, 248),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        backgroundColor: Color.fromRGBO(6, 70, 99, 1),
                        side: BorderSide(
                            color: Color.fromRGBO(6, 70, 99, 1),
                            width: 1), //<-- SEE HERE
                      ),
                      onPressed: () {
                        sold_property();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 30.0, right: 30, top: 5, bottom: 5),
                        child: const Text(
                          'Sold',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  : OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Color.fromARGB(255, 248, 248, 248),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        backgroundColor: Color.fromRGBO(6, 70, 99, 1),
                        side: BorderSide(
                            color: Color.fromRGBO(6, 70, 99, 1),
                            width: 1), //<-- SEE HERE
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 30.0, right: 30, top: 5, bottom: 5),
                        child: const Text(
                          'Solded',
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
                  (widget.data['home'] == true)
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) =>
                                  House_management_details(data: widget.data)))
                      : showAlertDialog(
                          context, 'Error', 'Lands cannot be edited');
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 30, left: 30, top: 5, bottom: 5),
                  child: const Text(
                    'Edit',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 248, 248, 248),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  backgroundColor: Color.fromRGBO(19, 19, 19, 1),
                  side: BorderSide(
                      color: Color.fromRGBO(19, 19, 19, 1),
                      width: 1), //<-- SEE HERE
                ),
                onPressed: () {
                  delete_property();
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 20, left: 20, top: 5, bottom: 5),
                  child: const Text(
                    'Delete',
                    style: TextStyle(fontWeight: FontWeight.w600),
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
