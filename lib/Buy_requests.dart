import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Admin_profile.dart';
import 'package:quik_broker_admin/Login_page.dart';
import 'package:image_network/image_network.dart';

class Buy_requests extends StatefulWidget {
  const Buy_requests({super.key});

  @override
  State<Buy_requests> createState() => _Buy_requestsState();
}

class _Buy_requestsState extends State<Buy_requests> {
  String searchtext = '';

  Stream<QuerySnapshot> getFirestoreStream() {
    // Replace 'your_collection' with the name of your Firestore collection
    Query<Map<String, dynamic>> collection = FirebaseFirestore.instance
        .collection('buy requests')
        .where('Property_name', isGreaterThanOrEqualTo: searchtext)
        .where('Property_name', isLessThan: '${searchtext}z');
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
                      title: 'Buy requests',
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
                          IconButton(
                            icon: Icon(
                              Icons.notifications,
                              color: Colors.white,
                              size: 35,
                            ),
                            onPressed: () {
                              // Handle notification button press
                            },
                          ),
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
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: StreamBuilder<QuerySnapshot>(
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
                          child: Buy_request_card(data: data),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ))
        ],
      ),
    );
  }
}

class Buy_request_card extends StatefulWidget {
  const Buy_request_card({super.key, required this.data});
  final Map<String, dynamic> data;
  @override
  State<Buy_request_card> createState() => _Buy_request_cardState();
}

class _Buy_request_cardState extends State<Buy_request_card> {
  bool loading = false;
  Delete_request(id) async {
    try {
      setState(() {
        loading = true;
      });
      await FirebaseFirestore.instance.collection("trash").doc(id).set({
        "Buyer_UID": widget.data['Buyer_UID'],
        "Buyer_name": widget.data['Buyer_name'],
        "Buyer_phone": widget.data['Buyer_phone'],
        "Price": widget.data['Price'],
        "Property_name": widget.data['Property_name'],
        "Seller_name": widget.data['Seller_name'],
        "Seller_number": widget.data['Seller_number'],
        "id": widget.data['id'],
        "image": widget.data['image'],
        "seller_UID": widget.data['seller_UID'],
      });

      await FirebaseFirestore.instance
          .collection("buy requests")
          .doc(id)
          .delete();

      setState(() {
        loading = false;
      });
    } catch (e) {
      showAlertDialog(context, "Error", e.toString());
    }
  }

  // late Future<DocumentSnapshot> property;
  // void initState() {
  //   super.initState();
  //   property = FirebaseFirestore.instance
  //       .collection('properties')
  //       .doc(widget.data['id'])
  //       .get();
  // }

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
  sold_property() async {
    Future<DocumentSnapshot> property = FirebaseFirestore.instance
        .collection('properties')
        .doc(widget.data['id'])
        .get();
    DocumentSnapshot snapshot = await property;
    var docData = snapshot.data() as Map<String, dynamic>?;

    print(docData?.toString());
    print(docData?['id']);
    print(docData?['adtitle']);
    print(docData?['price']);
    if (docData != null) {
      FirebaseFirestore.instance
          .collection('properties')
          .doc("${widget.data['id']}")
          .update({
        'solded': true,
      });
      FirebaseFirestore.instance
          .collection('solded properties')
          .doc("${docData['id']}")
          .set({
        'adtitle': docData['adtitle'],
        'breadth': docData['breadth'],
        'describe': docData['describe'],
        'facing': docData['facing'],
        'home': docData['home'],
        'id': docData['id'],
        'images': docData['images'],
        'length': docData['length'],
        'listedby': docData['listedby'],
        'location': docData['location'],
        'plotarea': docData['plotarea'],
        'price': docData['price'],
        'seller_name': docData['seller_name'],
        'seller_phone': docData['seller_phone'],
        'seller_uid': docData['seller_uid'],
        'BHK': docData['BHK'],
        'address': docData['address'],
        'configuration': docData['configuration'],
        'covered_area': docData['covered_area'],
        'electricity': docData['electricity'],
        'floor': docData['floor'],
        'house_details': docData['house_details'],
        'water': docData['water'],
        'units_available': docData['units_available'],
        'status': docData['status'],
      });

      CollectionReference<Map<String, dynamic>> collection =
          FirebaseFirestore.instance.collection('turn_over');
      DocumentReference<Map<String, dynamic>> docRef =
          collection.doc('turn_over');
      docRef.update({
        '${months[DateTime.now().month - 1]}':
            FieldValue.increment(int.parse(widget.data['Price']))
      });

      await FirebaseFirestore.instance
          .collection("buy requests")
          .doc(widget.data['id'])
          .delete();

      await FirebaseFirestore.instance
          .collection("trash")
          .doc(widget.data['id'])
          .update({
        "Buyer_UID": widget.data['Buyer_UID'],
        "Buyer_name": widget.data['Buyer_name'],
        "Buyer_phone": widget.data['Buyer_phone'],
        "Price": widget.data['Price'],
        "Property_name": widget.data['Property_name'],
        "Seller_name": widget.data['Seller_name'],
        "Seller_number": widget.data['Seller_number'],
        "id": widget.data['id'],
        "image": widget.data['image'],
        "seller_UID": widget.data['seller_UID'],
      });
      showAlertDialog(context, 'Success', 'Successfully sold');
    } else {
      showAlertDialog(context, 'Error', 'Try again');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(224, 223, 223, 1),
      ),
      width: width(context, 0.80),
      height: 187,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: ImageNetwork(
                  image: widget.data['image'],
                  height: height(context, 0.15),
                  width: width(context, 0.15),
                )),
          ),
          const SizedBox(
            width: 6,
          ),
          SizedBox(
            width: width(context, 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: width(context, 0.1),
                  child: Text(
                    '${widget.data['Property_name']}',
                    style: TextStyle(
                        fontSize: width(context, 0.015),
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  '${widget.data['Price']}',
                  style: TextStyle(
                      fontSize: width(context, 0.01),
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          SizedBox(
            width: width(context, 0.15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Seller',
                  style: TextStyle(
                      fontSize: width(context, 0.02),
                      color: Colors.red,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Name : ${widget.data['Seller_name']}',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Number : ${widget.data['Seller_number']}',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'UID : ${widget.data['seller_UID']}',
                        style: TextStyle(
                            fontSize: width(context, 0.0077),
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 0.5,
            height: 130,
            color: Colors.black,
          ),
          SizedBox(
            width: width(context, 0.15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Buyer',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Container(
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Name :${widget.data['Buyer_name']}',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Number : ${widget.data['Buyer_UID']}',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'UID : ${widget.data['Buyer_phone']}',
                        style: TextStyle(
                            fontSize: width(context, 0.0077),
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  sold_property();
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 40, left: 40, top: 5, bottom: 5),
                  child: const Text(
                    'Sold',
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
                  Delete_request(widget.data['id']);
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 30, left: 30, top: 5, bottom: 5),
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
