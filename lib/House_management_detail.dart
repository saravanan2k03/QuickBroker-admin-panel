import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quik_broker_admin/CarouselSlider.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import 'package:quik_broker_admin/Nav_bar.dart';

class House_management_details extends StatefulWidget {
  const House_management_details({super.key, required this.data});
  final Map<String, dynamic> data;
  @override
  State<House_management_details> createState() =>
      _House_management_detailsState();
}

class _House_management_detailsState extends State<House_management_details> {
  TextEditingController Notification_title_controller = TextEditingController();
  TextEditingController Notification_desc_controller = TextEditingController();

  @override
  bool loading = false;

  bool sale = true;

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
      });

      setState(() {
        loading = false;
      });
    } catch (e) {
      showAlertDialog(context, "Error", e.toString());
    }
  }

  int _current = 0;
  final CarouselController Carousel_controller = CarouselController();
  Stream<QuerySnapshot> getFirestoreStream() {
    // Replace 'your_collection' with the name of your Firestore collection
    CollectionReference collection =
        FirebaseFirestore.instance.collection('notifications');

    // Return the stream
    return collection.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    List images = widget.data['images'];
    TextEditingController title_controller =
        TextEditingController(text: widget.data['covered_area']);
    TextEditingController price_controller =
        TextEditingController(text: widget.data['covered_area']);
    TextEditingController BHK_controller =
        TextEditingController(text: widget.data['covered_area']);
    TextEditingController address_controller =
        TextEditingController(text: widget.data['address']);
    TextEditingController house_details_controller =
        TextEditingController(text: widget.data['covered_area']);
    TextEditingController covered_area_controller =
        TextEditingController(text: widget.data['covered_area']);
    TextEditingController floor_controller =
        TextEditingController(text: widget.data['covered_area']);
    TextEditingController configuration_controller =
        TextEditingController(text: widget.data['configuration']);
    TextEditingController location_controller =
        TextEditingController(text: widget.data['location']);
    TextEditingController furnishing_controller =
        TextEditingController(text: widget.data['furnishing']);
    TextEditingController facing_controller =
        TextEditingController(text: widget.data['facing']);
    TextEditingController overlooking_controller =
        TextEditingController(text: widget.data['overlooking']);
    TextEditingController units_available_controller =
        TextEditingController(text: widget.data['units_available']);
    TextEditingController flooring_controller =
        TextEditingController(text: widget.data['flooring']);
    TextEditingController landmark_controller =
        TextEditingController(text: widget.data['landmark']);
    TextEditingController water_controller =
        TextEditingController(text: widget.data['water']);
    TextEditingController electricity_controller =
        TextEditingController(text: widget.data['electricity']);
    void initState() {
      print('............');
      // title_controller = TextEditingController(text: widget.data?['adtitle']);
      // price_controller = TextEditingController(text: widget.data?['price']);
      // BHK_controller = TextEditingController(text: widget.data?['BHK']);
      // address_controller = TextEditingController(text: widget.data?['address']);
      // house_details_controller = TextEditingController(text: widget.data?['house_details']);
      // covered_area_controller =
      //     TextEditingController(text: widget.data['covered_area']);
      // // floor_controller = TextEditingController(text: widget.data?['floor']);
      // configuration_controller =
      //     TextEditingController(text: widget.data['configuration']);
      // location_controller =
      //     TextEditingController(text: widget.data['location']);
      // furnishing_controller =
      //     TextEditingController(text: widget.data['furnishing']);
      // facing_controller = TextEditingController(text: widget.data['facing']);
      // overlooking_controller =
      //     TextEditingController(text: widget.data['overlooking']);
      // units_available_controller =
      //     TextEditingController(text: widget.data['units_available']);
      // flooring_controller =
      //     TextEditingController(text: widget.data['flooring']);
      // landmark_controller =
      //     TextEditingController(text: widget.data['landmark']);
      // water_controller = TextEditingController(text: widget.data['water']);
      // electricity_controller =
      //     TextEditingController(text: widget.data['electricity']);

      super.initState();
    }

    var items = [
      'Chennai',
      'Lucknow',
    ];
    var status_items = [
      'immediately available',
      'Take some time',
    ];
    String dropdownvalue = items[0];
    String status_dropdownvalue = status_items[0];
    void uploaddata(
      String initfolder,
    ) async {
      try {
        await FirebaseFirestore.instance
            .collection("properties")
            .doc("${widget.data['id']}")
            .update({
          "covered_area": covered_area_controller.text,
          "configuration": configuration_controller.text,
          "address": address_controller.text,
          "location": location_controller.text,
          "furnishing": furnishing_controller.text,
          "facing": facing_controller.text,
          "overlooking": overlooking_controller.text,
          "units_available": units_available_controller.text,
          "flooring": flooring_controller.text,
          "landmark": landmark_controller.text,
          "water": water_controller.text,
          "electricity": electricity_controller.text,
          "sale": sale,
          "status": status_dropdownvalue,
        });

        showAlertDialog(context, 'Success', 'Data updated succesfully');
      } catch (e) {
        showAlertDialog(context, "Error", e.toString());
      }
    }

    return Scaffold(
      body: Container(
        color: Color.fromRGBO(4, 28, 50, 1),
        child: Column(
          children: [
            Nav_bar(
              title: 'Home management / Edit',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(50),
                  width: width(context, 0.7),
                  height: height(context, 0.8),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(224, 223, 223, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              carouselslider(data: widget.data),
                              Text(
                                'Property Pricing',
                                style: TextStyle(
                                  color: const Color.fromARGB(214, 0, 0, 0),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '\$${widget.data['price']}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Address',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.all(20),
                                  width: width(context, 0.3),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(163, 163, 168, 1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Name : ${widget.data['seller_name']}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '${widget.data['address']}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                    ],
                                  )),
                              Container(
                                margin: EdgeInsets.all(20),
                                width: width(context, 0.2),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Facing'),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          padding: EdgeInsets.all(3),
                                          width: width(context, 0.1),
                                          height: 30,
                                          child: TextField(
                                            controller: facing_controller,
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            keyboardType:
                                                TextInputType.multiline,
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black26,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(7.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black26,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(7.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Overlooking'),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          width: width(context, 0.1),
                                          height: 30,
                                          child: TextField(
                                            controller: overlooking_controller,
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            keyboardType:
                                                TextInputType.multiline,
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black26,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(7.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black26,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(7.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Units available'),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          width: width(context, 0.1),
                                          height: 30,
                                          child: TextField(
                                            controller:
                                                units_available_controller,
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            keyboardType:
                                                TextInputType.multiline,
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black26,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(7.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black26,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(7.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Furnishing'),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          width: width(context, 0.1),
                                          height: 30,
                                          child: TextField(
                                            controller: furnishing_controller,
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            keyboardType:
                                                TextInputType.multiline,
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black26,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(7.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black26,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(7.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Landmark'),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          width: width(context, 0.1),
                                          height: 30,
                                          child: TextField(
                                            controller: landmark_controller,
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            keyboardType:
                                                TextInputType.multiline,
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black26,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(7.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black26,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(7.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Water availability'),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          width: width(context, 0.1),
                                          height: 30,
                                          child: TextField(
                                            controller: water_controller,
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            keyboardType:
                                                TextInputType.multiline,
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black26,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(7.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black26,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(7.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Status of Electricity'),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          width: width(context, 0.1),
                                          height: 30,
                                          child: TextField(
                                            controller: electricity_controller,
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            keyboardType:
                                                TextInputType.multiline,
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black26,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(7.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black26,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(7.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        width: width(context, 0.30),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Description',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${widget.data['house_details']}',
                                style: TextStyle(
                                  color: Color.fromARGB(197, 0, 0, 0),
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                              Text(
                                'House Details',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.all(4),
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(45, 45, 45, 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    '${widget.data['adtitle']}',
                                    style: TextStyle(
                                      color: Color.fromARGB(218, 255, 255, 255),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  )),
                              Container(
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromRGBO(45, 45, 45, 1),
                                  ),
                                  height: 35,
                                  child: DropdownButton(
                                      dropdownColor:
                                          Color.fromRGBO(45, 45, 45, 1),
                                      underline: SizedBox(),
                                      focusColor: Colors.transparent,

                                      // Initial Value
                                      value: dropdownvalue,

                                      // Down Arrow Icon
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                      ),

                                      // Array list of items
                                      items: items.map((String item) {
                                        return DropdownMenuItem(
                                          value: item,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                bottom: 5,
                                                top: 5),
                                            child: Text(
                                              item,
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255)),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      // After selecting the desired option,it will
                                      // change button value to selected value
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownvalue = newValue!;
                                        });
                                      })),
                              Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(163, 163, 168, 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Name : ${widget.data['seller_name']}',
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        'Number : ${widget.data['seller_phone']}',
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        'UID : ${widget.data['seller_uid']}',
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                    ],
                                  )),
                              Container(
                                margin: EdgeInsets.all(20),
                                width: width(context, 0.6),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor: !sale
                                            ? Color.fromARGB(255, 248, 248, 248)
                                            : Color.fromARGB(255, 0, 0, 0),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        backgroundColor: !sale
                                            ? Color.fromARGB(255, 0, 0, 0)
                                            : Color.fromARGB(
                                                255, 248, 248, 248),
                                        //<-- SEE HERE
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          sale = false;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: const Text(
                                          'Rent',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w200),
                                        ),
                                      ),
                                    ),
                                    Text('or'),
                                    OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor: sale
                                            ? Color.fromARGB(255, 248, 248, 248)
                                            : Color.fromARGB(255, 0, 0, 0),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        backgroundColor: sale
                                            ? Color.fromARGB(255, 0, 0, 0)
                                            : Color.fromARGB(
                                                255, 248, 248, 248),
                                        side: BorderSide(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            width: 1), //<-- SEE HERE
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          sale = true;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: const Text(
                                          'Sale',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w200),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Text('Address'),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        padding: EdgeInsets.all(3),
                                        width: width(context, 0.08),
                                        height: 30,
                                        child: TextField(
                                          controller: address_controller,
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                          keyboardType: TextInputType.multiline,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1, //<-- SEE HERE
                                                color: Colors.black26,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(7.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1, //<-- SEE HERE
                                                color: Colors.black26,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(7.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text('Covered Area'),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        padding: EdgeInsets.all(3),
                                        width: width(context, 0.08),
                                        height: 30,
                                        child: TextField(
                                          controller: covered_area_controller,
                                          // controller: covered_area_controller,
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                          keyboardType: TextInputType.multiline,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1, //<-- SEE HERE
                                                color: Colors.black26,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(7.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1, //<-- SEE HERE
                                                color: Colors.black26,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(7.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Flooring'),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        padding: EdgeInsets.all(3),
                                        width: width(context, 0.08),
                                        height: 30,
                                        child: TextField(
                                          controller: flooring_controller,
                                          // controller: covered_area_controller,
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                          keyboardType: TextInputType.multiline,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1, //<-- SEE HERE
                                                color: Colors.black26,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(7.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1, //<-- SEE HERE
                                                color: Colors.black26,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(7.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text('Configuration'),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        padding: EdgeInsets.all(3),
                                        width: width(context, 0.08),
                                        height: 30,
                                        child: TextField(
                                          controller: configuration_controller,
                                          // controller: covered_area_controller,
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                          keyboardType: TextInputType.multiline,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1, //<-- SEE HERE
                                                color: Colors.black26,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(7.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1, //<-- SEE HERE
                                                color: Colors.black26,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(7.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Location'),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        padding: EdgeInsets.all(3),
                                        width: width(context, 0.08),
                                        height: 30,
                                        child: TextField(
                                          controller: location_controller,
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                          keyboardType: TextInputType.multiline,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1, //<-- SEE HERE
                                                color: Colors.black26,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(7.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1, //<-- SEE HERE
                                                color: Colors.black26,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(7.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text('Status'),
                                      Container(
                                          margin: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color.fromRGBO(
                                                163, 163, 168, 1),
                                          ),
                                          height: 35,
                                          child: DropdownButton(
                                              dropdownColor: Color.fromRGBO(
                                                  163, 163, 168, 1),
                                              underline: SizedBox(),
                                              focusColor: Colors.transparent,

                                              // Initial Value
                                              value: status_dropdownvalue,

                                              // Down Arrow Icon
                                              icon: const Icon(
                                                Icons.keyboard_arrow_down,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                              ),

                                              // Array list of items
                                              items: status_items
                                                  .map((String item) {
                                                return DropdownMenuItem(
                                                  value: item,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20,
                                                            right: 20,
                                                            bottom: 5,
                                                            top: 5),
                                                    child: Text(
                                                      item,
                                                      style: TextStyle(
                                                          fontSize: 11,
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                              // After selecting the desired option,it will
                                              // change button value to selected value
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  status_dropdownvalue =
                                                      newValue!;
                                                });
                                              })),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.all(20),
                                width: width(context, 0.6),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor:
                                            Color.fromRGBO(71, 91, 232, 1),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        backgroundColor:
                                            Color.fromARGB(255, 248, 248, 248),
                                        side: BorderSide(
                                            color:
                                                Color.fromRGBO(71, 91, 232, 1),
                                            width: 1), //<-- SEE HERE
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: const Text(
                                          'Cancel',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor:
                                            Color.fromARGB(255, 248, 248, 248),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        backgroundColor:
                                            Color.fromRGBO(71, 91, 232, 1),
                                        //<-- SEE HERE
                                      ),
                                      onPressed: () {
                                        if (covered_area_controller.text.length >= 1 &&
                                            configuration_controller.text.length >=
                                                1 &&
                                            location_controller.text.length >=
                                                1 &&
                                            address_controller.text.length >=
                                                1 &&
                                            furnishing_controller.text.length >=
                                                1 &&
                                            facing_controller.text.length >=
                                                1 &&
                                            overlooking_controller.text.length >=
                                                1 &&
                                            units_available_controller
                                                    .text.length >=
                                                1 &&
                                            flooring_controller.text.length >=
                                                1 &&
                                            landmark_controller.text.length >=
                                                1 &&
                                            water_controller.text.length >= 1 &&
                                            electricity_controller
                                                    .text.length >=
                                                1) {
                                          uploaddata("home");
                                        } else {
                                          showAlertDialog(context, "Error",
                                              "Kindly, fill all details");
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          children: [
                                            Icon(Icons.save),
                                            const Text(
                                              'Save',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ],
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
