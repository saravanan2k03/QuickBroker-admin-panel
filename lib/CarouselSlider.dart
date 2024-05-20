import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';

class carouselslider extends StatefulWidget {
  const carouselslider({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  State<carouselslider> createState() => _carouselsliderState();
}

class _carouselsliderState extends State<carouselslider> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    List images = widget.data['images'];
    return Column(
      children: [
        Container(
          width: width(context, 0.2),
          height: height(context, 0.2),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 200, // Adjust the height as per your requirement
              // autoPlay: true, // Enable auto-play
              enlargeCenterPage: true, // Make the center image larger
              aspectRatio: 16 / 9, // Set the aspect ratio of the images
              // autoPlayCurve: Curves.fastOutSlowIn, // Set the animation curve
              // enableInfiniteScroll:
              //     true, // Enable infinite scroll
              // autoPlayAnimationDuration:
              //     Duration(milliseconds: 800), // Set the animation duration
              // viewportFraction: 0.8, // Set the visible fraction of the viewport
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
            items: images.map((imagePath) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: ImageNetwork(
                        image: widget.data['images'][_current],
                        height: height(context, 0.25),
                        width: 400),
                  );
                },
              );
            }).toList(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: images.asMap().entries.map((entry) {
            int index = entry.key;
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index ? Colors.blue : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
