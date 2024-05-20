import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quik_broker_admin/Admin_profile.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import 'package:quik_broker_admin/Nav_bar.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:html' as html;
import 'dart:typed_data';

// Helper method to convert html.File to Blob
Future<Uint8List> _fileToUint8List(html.File file) async {
  final reader = html.FileReader();
  final completer = Completer<Uint8List>();

  reader.onLoadEnd.listen((e) {
    completer.complete(reader.result as Uint8List);
  });

  reader.onError.listen((e) {
    completer.completeError('Failed to read file: ${file.name}');
  });

  reader.readAsArrayBuffer(file);

  return completer.future;
}

class Offer extends StatefulWidget {
  const Offer({Key? key}) : super(key: key);

  @override
  State<Offer> createState() => _OfferState();
}

class _OfferState extends State<Offer> {
  String? offer_image;
  bool loading = false;
  TextEditingController Offer_title_controller = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  late String OfferImageUrl;

  var blob_;

  void imgFromGallery(BuildContext context) async {
    final input = html.FileUploadInputElement();
    input.accept = 'image/*';
    input.click();

    await input.onChange.first;

    final file = input.files!.first;

    if (file != null) {
      final uint8List = await _fileToUint8List(file);
      final blob = html.Blob([uint8List]);
      final url = html.Url.createObjectUrlFromBlob(blob);

      setState(() {
        offer_image = url.toString();
        blob_ = blob;
      });
      print(blob);
    } else {
      print('No image selected.');
    }
  }

  Add_offer() async {
    try {
      setState(() {
        loading = true;
      });
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('offer_images/${Offer_title_controller.text.toString()}');
      final uploadTask = storageRef.putBlob(blob_);
      await uploadTask;
      final downloadUrl = await storageRef.getDownloadURL();
      setState(() {
        OfferImageUrl = downloadUrl;
      });
      print('Image uploaded. Download URL: $downloadUrl');
      setState(() {
        loading = false;
      });
      Setdata();
    } catch (e) {
      showAlertDialog(context, "Error", e.toString());
    }
  }

  Setdata() async {
    try {
      setState(() {
        loading = true;
      });
      await FirebaseFirestore.instance
          .collection("offers")
          .doc(Offer_title_controller.text.toString())
          .set({
        "Offer_name": Offer_title_controller.text.toString(),
        "image": OfferImageUrl,
      });

      setState(() {
        loading = false;
      });
    } catch (e) {
      showAlertDialog(context, "Error", e.toString());
    }
  }

  Image_dialog() {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text('Add offer'),
      content: Container(
        height: height(context, 0.6),
        child: Column(
          children: [
            (offer_image != null)
                ? Visibility(
                    child: InkWell(
                    onTap: () {
                      imgFromGallery(context);
                    },
                    child: Image.network(
                      offer_image!,
                      fit: BoxFit.fitWidth,
                      height: height(context, 0.25),
                    ),
                  ))
                : Visibility(
                    child: InkWell(
                      onTap: () {
                        imgFromGallery(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                        ),
                        width: width(context, 0.3),
                        height: height(context, 0.25),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_a_photo,
                                size: height(context, 0.06),
                              ),
                              divider(context, height(context, 0.02)),
                              Text("Click to add photos")
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
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

  Add_offer_dialog() {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text('Add offer'),
      content: Container(
        height: height(context, 0.6),
        child: Column(
          children: [
            (offer_image != null)
                ? Visibility(
                    child: InkWell(
                    onTap: () {
                      imgFromGallery(context);
                    },
                    child: Image.network(
                      offer_image!,
                      fit: BoxFit.fitWidth,
                      height: height(context, 0.25),
                    ),
                  ))
                : Visibility(
                    child: InkWell(
                      onTap: () {
                        imgFromGallery(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                        ),
                        width: width(context, 0.3),
                        height: height(context, 0.25),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_a_photo,
                                size: height(context, 0.06),
                              ),
                              divider(context, height(context, 0.02)),
                              Text("Click to add photos")
                            ],
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
                  backgroundColor: Color.fromRGBO(51, 0, 109, 1),
                  side: BorderSide(
                      color: Color.fromRGBO(51, 0, 109, 1),
                      width: 1), //<-- SEE HERE
                ),
                onPressed: () {
                  Image_dialog();
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 150, right: 150, top: 20, bottom: 20),
                  child: const Text(
                    'View image',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 255, 255, 255)),
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
                  controller: Offer_title_controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Offer title',
                    prefixIcon: Icon(
                      Icons.discount_outlined,
                      color: Colors.black45,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              //padding all side deleted
              padding: EdgeInsets.all(8.0),
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
                  if (Offer_title_controller.text.isNotEmpty &&
                      offer_image!.isNotEmpty) {
                    Add_offer();
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 150,
                    right: 150,
                  ),
                  child: loading
                      ? CircularProgressIndicator(
                          color: Colors.black,
                        )
                      : Text(
                          'Add offer',
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
        .collection('offers')
        .where('Offer_name', isGreaterThanOrEqualTo: searchtext)
        .where('Offer_name', isLessThan: searchtext + 'z');

    // Return the stream
    return collection.snapshots();
  }

  TextEditingController SearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Add_offer_dialog();
        },
        label: Text(
          'Add Offer',
          style: TextStyle(color: Colors.white),
        ),
        icon: Icon(Icons.add, color: Colors.white),
        backgroundColor: Color.fromARGB(255, 0, 98, 211),
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
                        title: 'Offers',
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
                  margin: EdgeInsets.all(100),
                  height: MediaQuery.of(context).size.height * 0.8,
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

                      return GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: calculateCrossAxisCount(context),
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio:
                              1, // Adjust this value to control the aspect ratio of each grid item
                        ),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          DocumentSnapshot document =
                              snapshot.data!.docs[index];
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;

                          return Offer_block(data: data);
                        },
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

  int calculateCrossAxisCount(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = 360.0; // Adjust this value as per your needs
    final crossAxisCount = (screenWidth / itemWidth).floor();
    return crossAxisCount;
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

class Offer_block extends StatefulWidget {
  const Offer_block({super.key, required this.data});
  final Map<String, dynamic> data;
  @override
  State<Offer_block> createState() => _Offer_blockState();
}

class _Offer_blockState extends State<Offer_block> {
  String? offer_image;
  bool loading = false;
  final ImagePicker _picker = ImagePicker();

  late String OfferImageUrl;

  var blob_;

  void imgFromGallery(context) async {
    final input = html.FileUploadInputElement();
    input.accept = 'image/*';
    input.click();

    await input.onChange.first;

    final file = input.files!.first;

    if (file != null) {
      final uint8List = await _fileToUint8List(file);
      final blob = html.Blob([uint8List]);
      final url = html.Url.createObjectUrlFromBlob(blob);

      setState(() {
        offer_image = url.toString();
        blob_ = blob;
      });
      print(blob);
    } else {
      print('No image selected.');
    }
  }

  Edit_Image_dialog() {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text('Add offer'),
      content: Container(
        height: height(context, 0.6),
        child: Column(
          children: [
            (offer_image != null)
                ? Visibility(
                    child: InkWell(
                    onTap: () {
                      imgFromGallery(context);
                    },
                    child: Image.network(
                      offer_image!,
                      fit: BoxFit.fitWidth,
                      height: height(context, 0.25),
                    ),
                  ))
                : Visibility(
                    child: InkWell(
                      onTap: () {
                        imgFromGallery(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                        ),
                        width: width(context, 0.3),
                        height: height(context, 0.25),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_a_photo,
                                size: height(context, 0.06),
                              ),
                              divider(context, height(context, 0.02)),
                              Text("Click to add photos")
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
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

  Delete_offer(offer_title) async {
    try {
      setState(() {
        loading = true;
      });
      await FirebaseFirestore.instance
          .collection("trash")
          .doc(offer_title)
          .set({
        "Offer_name": widget.data['Offer_name'],
        "image": widget.data['image'],
      });

      await FirebaseFirestore.instance
          .collection("offers")
          .doc(offer_title)
          .delete();

      setState(() {
        loading = false;
      });
    } catch (e) {
      showAlertDialog(context, "Error", e.toString());
    }
  }

  Edit_offer(offer_name) async {
    try {
      setState(() {
        loading = true;
      });
      final storageRef =
          FirebaseStorage.instance.ref().child('offer_images/${offer_name}');
      final uploadTask = storageRef.putBlob(blob_);
      await uploadTask;
      final downloadUrl = await storageRef.getDownloadURL();
      setState(() {
        OfferImageUrl = downloadUrl;
      });
      print('Image uploaded. Download URL: $downloadUrl');
      setState(() {
        loading = false;
      });
      Setdata(offer_name);
    } catch (e) {
      showAlertDialog(context, "Error", e.toString());
    }
  }

  Setdata(offer_name) async {
    try {
      setState(() {
        loading = true;
      });
      await FirebaseFirestore.instance
          .collection("offers")
          .doc(offer_name)
          .update({
        "image": OfferImageUrl,
      });

      setState(() {
        loading = false;
      });
      showAlertDialog(context, 'Success', 'Successfully updated');
    } catch (e) {
      showAlertDialog(context, "Error", e.toString());
    }
  }

  Edit_offer_dialog(offer_name) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text('Edit offer'),
      content: Container(
        height: height(context, 0.6),
        child: Column(
          children: [
            Text(widget.data['Offer_name']),
            (offer_image != null)
                ? Visibility(
                    child: InkWell(
                    onTap: () {
                      imgFromGallery(context);
                    },
                    child: Image.network(
                      offer_image!,
                      fit: BoxFit.fitWidth,
                      height: height(context, 0.25),
                    ),
                  ))
                : Visibility(
                    child: InkWell(
                      onTap: () {
                        imgFromGallery(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                        ),
                        width: width(context, 0.3),
                        height: height(context, 0.25),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_a_photo,
                                size: height(context, 0.06),
                              ),
                              divider(context, height(context, 0.02)),
                              Text("Click to add photos")
                            ],
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
                  backgroundColor: Color.fromRGBO(51, 0, 109, 1),
                  side: BorderSide(
                      color: Color.fromRGBO(51, 0, 109, 1),
                      width: 1), //<-- SEE HERE
                ),
                onPressed: () {
                  Edit_Image_dialog();
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 150, right: 150, top: 20, bottom: 20),
                  child: const Text(
                    'View image',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 255, 255, 255)),
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
                  if (offer_image!.isNotEmpty) {
                    Edit_offer(offer_name);
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
                          'Edit offer',
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
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Color.fromRGBO(224, 223, 223, 1),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(8),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ImageNetwork(image: widget.data['image'], height: 150, width: 250),
          Row(
            children: [
              Text(
                widget.data['Offer_name'],
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 5, 5, 5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  backgroundColor: Color.fromRGBO(110, 110, 113, 0),
                  side: BorderSide(
                      color: Color.fromRGBO(110, 110, 113, 1),
                      width: 1), //<-- SEE HERE
                ),
                onPressed: () {
                  Delete_offer(widget.data['Offer_name']);
                },
                child: Text(
                  'Delete',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 248, 248, 248),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  backgroundColor: Color.fromRGBO(0, 0, 0, 1),
                  side: BorderSide(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      width: 1), //<-- SEE HERE
                ),
                onPressed: () {
                  Edit_offer_dialog(widget.data['Offer_name']);
                },
                child: SizedBox(
                  child: Text(
                    'Update',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
