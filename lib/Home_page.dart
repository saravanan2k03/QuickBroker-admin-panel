import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Admin_profile.dart';
import 'package:quik_broker_admin/Graph.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  Future<int> getCollectionLength(String collectionName) async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection(collectionName).get();

    int length = querySnapshot.size;
    return length;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(4, 28, 50, 1),
      child: ListView(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Screen_title(
                      title: 'Home page',
                    ),
                    Container(
                      width: width(context, 0.4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Container(
                          //   height: 45,
                          //   width: width(context, 0.22),
                          //   child: TextField(
                          //     controller: SearchController,
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
                          const SizedBox(
                            width: 20,
                          ),
                          IconButton(
                            icon: const Icon(
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
          SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(
                        left: width(context, 0.04),
                        right: width(context, 0.04),
                        top: 20,
                        bottom: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromRGBO(69, 90, 100, 1),
                                ),
                                height: 150,
                                child: Center(
                                    child: Container(
                                  margin: EdgeInsets.all(40),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: width(context, 0.1),
                                            child: Text(
                                              'Total Users',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      width(context, 0.015)
                                                          .toDouble()),
                                            ),
                                          ),
                                          FutureBuilder<int>(
                                            future:
                                                getCollectionLength('Users'),
                                            builder: (BuildContext context,
                                                AsyncSnapshot<int> snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return CircularProgressIndicator();
                                              } else if (snapshot.hasError) {
                                                return Text(
                                                    'Error: ${snapshot.error}');
                                              } else {
                                                int? collectionLength =
                                                    snapshot.data;
                                                return Text(
                                                  '$collectionLength',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 24),
                                                );
                                              }
                                            },
                                          )
                                        ],
                                      ),
                                      Icon(
                                        Icons.person_outlined,
                                        size: width(context, 0.02),
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                )),
                              ),
                            ),
                            SizedBox(width: 16.0),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromRGBO(69, 90, 100, 1),
                                ),
                                height: 150,
                                child: Center(
                                    child: Container(
                                  margin: EdgeInsets.all(40),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: width(context, 0.1),
                                            child: Text(
                                              'Total House',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      width(context, 0.015)
                                                          .toDouble()),
                                            ),
                                          ),
                                          FutureBuilder<int>(
                                            future: getCollectionLength(
                                                'properties'),
                                            builder: (BuildContext context,
                                                AsyncSnapshot<int> snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return CircularProgressIndicator();
                                              } else if (snapshot.hasError) {
                                                return Text(
                                                    'Error: ${snapshot.error}');
                                              } else {
                                                int? collectionLength =
                                                    snapshot.data;
                                                return Text(
                                                  '$collectionLength',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 24),
                                                );
                                              }
                                            },
                                          )
                                        ],
                                      ),
                                      Icon(
                                        Icons.house_siding_outlined,
                                        size: width(context, 0.02),
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                )),
                              ),
                            ),
                            SizedBox(width: 16.0),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromRGBO(69, 90, 100, 1),
                                ),
                                child: Center(
                                    child: Container(
                                  margin: EdgeInsets.all(27),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: width(context, 0.1),
                                            child: Text(
                                              'Total House Request',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      width(context, 0.015)
                                                          .toDouble()),
                                            ),
                                          ),
                                          FutureBuilder<int>(
                                            future: getCollectionLength(
                                                'buy requests'),
                                            builder: (BuildContext context,
                                                AsyncSnapshot<int> snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return CircularProgressIndicator();
                                              } else if (snapshot.hasError) {
                                                return Text(
                                                    'Error: ${snapshot.error}');
                                              } else {
                                                int? collectionLength =
                                                    snapshot.data;
                                                return Text(
                                                  '$collectionLength',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 24),
                                                );
                                              }
                                            },
                                          )
                                        ],
                                      ),
                                      Icon(
                                        Icons.route_outlined,
                                        size: width(context, 0.02),
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromRGBO(69, 90, 100, 1),
                                ),
                                child: Center(
                                    child: Container(
                                  margin: EdgeInsets.all(40),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: width(context, 0.1),
                                            child: Text(
                                              'Total Packer Request',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      width(context, 0.015)
                                                          .toDouble()),
                                            ),
                                          ),
                                          FutureBuilder<int>(
                                            future: getCollectionLength(
                                                'packer requests'),
                                            builder: (BuildContext context,
                                                AsyncSnapshot<int> snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return CircularProgressIndicator();
                                              } else if (snapshot.hasError) {
                                                return Text(
                                                    'Error: ${snapshot.error}');
                                              } else {
                                                int? collectionLength =
                                                    snapshot.data;
                                                return Text(
                                                  '$collectionLength',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 24),
                                                );
                                              }
                                            },
                                          )
                                        ],
                                      ),
                                      Icon(
                                        Icons.alt_route_sharp,
                                        size: width(context, 0.02),
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                )),
                              ),
                            ),
                            SizedBox(width: 16.0),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromRGBO(69, 90, 100, 1),
                                ),
                                child: Center(
                                    child: Container(
                                  margin: EdgeInsets.all(40),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: width(context, 0.1),
                                            child: Text(
                                              'Current Running Offer',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      width(context, 0.015)
                                                          .toDouble()),
                                            ),
                                          ),
                                          FutureBuilder<int>(
                                            future:
                                                getCollectionLength('offers'),
                                            builder: (BuildContext context,
                                                AsyncSnapshot<int> snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return CircularProgressIndicator();
                                              } else if (snapshot.hasError) {
                                                return Text(
                                                    'Error: ${snapshot.error}');
                                              } else {
                                                int? collectionLength =
                                                    snapshot.data;
                                                return Text(
                                                  '$collectionLength',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 24),
                                                );
                                              }
                                            },
                                          )
                                        ],
                                      ),
                                      Icon(
                                        Icons.sell_outlined,
                                        size: width(context, 0.02),
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                )),
                              ),
                            ),
                            SizedBox(width: 16.0),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromRGBO(69, 90, 100, 1),
                                ),
                                child: Center(
                                    child: Flexible(
                                  child: Container(
                                    margin: EdgeInsets.all(40),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: width(context, 0.09),
                                              child: Text(
                                                'Total House sold',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        width(context, 0.015)
                                                            .toDouble()),
                                              ),
                                            ),
                                            FutureBuilder<int>(
                                              future: getCollectionLength(
                                                  'solded properties'),
                                              builder: (BuildContext context,
                                                  AsyncSnapshot<int> snapshot) {
                                                if (snapshot.connectionState ==
                                                    ConnectionState.waiting) {
                                                  return CircularProgressIndicator();
                                                } else if (snapshot.hasError) {
                                                  return Text(
                                                      'Error: ${snapshot.error}');
                                                } else {
                                                  int? collectionLength =
                                                      snapshot.data;
                                                  return Text(
                                                    '$collectionLength',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 24),
                                                  );
                                                }
                                              },
                                            )
                                          ],
                                        ),
                                        Flexible(
                                          child: CircleAvatar(
                                            backgroundColor:
                                                Color.fromRGBO(69, 90, 100, 1),
                                            child: Icon(
                                              Icons.house_outlined,
                                              size: width(context, 0.025),
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Add more content here
              ],
            ),
          ),
          Container(
            //color: Colors.white,
            child: GraphWidget(
              data: [
                111,
                435,
                563,
                545,
                242,
                452,
                543,
                112,
                545,
                232,
                123,
                432
              ],
              maxValue: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}
