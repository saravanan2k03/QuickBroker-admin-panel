import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Admin_profile.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import 'package:quik_broker_admin/Nav_bar.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    TextEditingController SearchController = TextEditingController();
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
                      title: 'Chat',
                    ),
                    Container(
                      width: width(context, 0.2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              child: Column(
                children: [
                  ChatBlock(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBlock extends StatefulWidget {
  const ChatBlock({Key? key}) : super(key: key);

  @override
  State<ChatBlock> createState() => _ChatBlockState();
}

class _ChatBlockState extends State<ChatBlock> {
  TextEditingController _textEditingController = TextEditingController();

  var UID;

  Stream<QuerySnapshot> getFirestoreStream() {
    // Replace 'your_collection' with the name of your Firestore collection
    CollectionReference collection = FirebaseFirestore.instance
        .collection('messages')
        .doc('${UID}')
        .collection('${UID}');

    Query query = collection.orderBy('current', descending: false);
    // Return the stream
    return query.snapshots();
  }

  Stream<QuerySnapshot> getFirestoreStream_users() {
    // Replace 'your_collection' with the name of your Firestore collection
    CollectionReference collection =
        FirebaseFirestore.instance.collection('messages');

    // Return the stream
    return collection.snapshots();
  }

  ScrollController _scrollController = ScrollController();
  void _sendMessage() async {
    String message = _textEditingController.text.trim();
    if (message.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('messages')
          .doc('${UID}')
          .collection('${UID}')
          .add({
        'UID': 'admin',
        'phone': 'admin',
        'username': 'admin',
        'admin': true,
        'message': message,
        'timestamp': '${DateTime.now().hour}:${DateTime.now().minute}',
        'current': DateTime.now()
      });

      _textEditingController.clear();
    }
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              SingleChildScrollView(
                child: Container(
                  width: width(context, 0.2),
                  margin: EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Messages',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 10, 10, 10),
                          ),
                        ),
                      ),
                      Container(
                        width: width(context, 0.57),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                height: height(context, 0.55),
                                child: StreamBuilder<QuerySnapshot>(
                                  stream: getFirestoreStream_users(),
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
                                          color: Colors.black,
                                        ),
                                      );
                                    } else {
                                      Center(
                                          child: CircularProgressIndicator());
                                    }

                                    return SingleChildScrollView(
                                      child: ListView(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        children: snapshot.data!.docs
                                            .map((DocumentSnapshot document) {
                                          Map<String, dynamic> data = document
                                              .data()! as Map<String, dynamic>;
                                          late String message = data['message'];
                                          String messages = message.length >= 7
                                              ? message.substring(0, 4)
                                              : message;
                                          return SizedBox(
                                            child: SingleChildScrollView(
                                              child: InkWell(
                                                onTap: () {
                                                  WidgetsBinding.instance!
                                                      .addPostFrameCallback(
                                                          (_) {
                                                    _scrollToBottom();
                                                  });
                                                  _scrollToBottom();
                                                  setState(() {
                                                    UID = data['UID'];
                                                  });
                                                },
                                                child: SizedBox(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Color.fromRGBO(
                                                          34, 255, 255, 255),
                                                    ),
                                                    child: Expanded(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100),
                                                              border:
                                                                  Border.all(
                                                                width: 1,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        111,
                                                                        45,
                                                                        168,
                                                                        1),
                                                              ),
                                                            ),
                                                            child: Image.asset(
                                                              'images/user.png',
                                                              width: 30,
                                                              height: 30,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: width(
                                                                context, 0.01),
                                                          ),
                                                          SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  '${data['username']}',
                                                                  style:
                                                                      TextStyle(
                                                                    color: const Color
                                                                        .fromARGB(
                                                                        255,
                                                                        0,
                                                                        0,
                                                                        0),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize: width(
                                                                        context,
                                                                        0.011),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      '${messages + ".........."}',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Color.fromARGB(
                                                                            185,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontSize:
                                                                            15,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      '${data['timestamp']}',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      style:
                                                                          TextStyle(
                                                                        color: const Color
                                                                            .fromARGB(
                                                                            255,
                                                                            3,
                                                                            3,
                                                                            3),
                                                                        fontWeight:
                                                                            FontWeight.w200,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    margin: EdgeInsets.all(0.5),
                                                    padding: EdgeInsets.all(5),
                                                    width: width(context, 0.2),
                                                    height:
                                                        height(context, 0.07),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        margin: EdgeInsets.all(10),
                        height: height(context, 0.7),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(230, 230, 230, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.chat_bubble_outline_rounded),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      UID != null && UID.isNotEmpty
                                          ? UID
                                          : 'Select a User',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: width(context, 0.57),
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          child: Column(
                            children: [
                              Container(
                                height: height(context, 0.55),
                                child: StreamBuilder<QuerySnapshot>(
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
                                          color: Colors.black,
                                        ),
                                      );
                                    } else {
                                      Center(
                                          child: CircularProgressIndicator());
                                    }

                                    return SingleChildScrollView(
                                      child: ListView(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        children: snapshot.data!.docs
                                            .map((DocumentSnapshot document) {
                                          Map<String, dynamic> data = document
                                              .data()! as Map<String, dynamic>;
                                          return SizedBox(
                                            child: SingleChildScrollView(
                                              child: _buildMessageItem(
                                                data['message'].toString(),
                                                data['admin'],
                                                data['timestamp'],
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: _textEditingController,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(16),
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.black,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24),
                                          ),
                                          hintText: 'Type a message...',
                                          prefixIcon: IconButton(
                                            onPressed: _sendMessage,
                                            icon: Icon(Icons.add_box_outlined),
                                            color:
                                                Color.fromRGBO(36, 36, 36, 1),
                                          ),
                                          suffix: InkWell(
                                            onTap: _sendMessage,
                                            child: Text(
                                              'Send message',
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    32, 32, 32, 1),
                                                fontWeight: FontWeight.bold,
                                              ),
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromRGBO(215, 215, 215, 1),
                          border: Border.all(
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        margin: EdgeInsets.all(10),
                        height: height(context, 0.7),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color.fromRGBO(175, 183, 233, 1),
      ),
      width: width(context, 0.8),
      height: height(context, 0.9),
    );
  }

  Widget _buildMessageItem(String message, bool admin, var timestamp) {
    // Alternate the alignment of demo messages
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Align(
        alignment: admin ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
            color: admin
                ? Color.fromRGBO(0, 123, 236, 1)
                : Color.fromRGBO(255, 255, 255, 1),
            borderRadius: admin
                ? BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                    topRight: Radius.zero,
                  )
                : BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    topLeft: Radius.zero,
                    bottomRight: Radius.circular(16),
                  ),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(116, 79, 79, 121).withOpacity(0.9),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Text(
                message,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: admin
                      ? Color.fromRGBO(255, 255, 255, 1)
                      : Color.fromRGBO(10, 10, 10, 1),
                ),
              ),
              Text(
                timestamp,
                style: TextStyle(
                  fontWeight: FontWeight.w100,
                  color: admin
                      ? Color.fromRGBO(255, 255, 255, 1)
                      : Color.fromRGBO(10, 10, 10, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
