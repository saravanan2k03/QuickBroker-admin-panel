import 'package:flutter/material.dart';

import '../../../Helper/app_setting.dart';
import '../../../Helper/constant/widgets/CustomAppbar.dart';
import '../widgets/OfferCard.dart';

class Offerpage extends StatelessWidget {
  const Offerpage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: height(context, 0.04),
              ),
              SizedBox(
                // color: Colors.red,
                height: height(context, 0.08),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      // color: Colors.yellow,
                      width: width(context, 0.20),
                      child: const Text(
                        "Offer",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const CustomAppbar()
                  ],
                ),
              ),
              SizedBox(
                height: height(context, 0.05),
              ),
              SizedBox(
                width: width(context, 0.80),
                height: height(context, 0.80),
                // decoration: BoxDecoration(
                //   color: const Color(0xffE0DFDF),
                //   borderRadius: BorderRadius.circular(15),
                // ),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // number of items in each row
                    mainAxisSpacing: 8.0, // spacing between rows
                    crossAxisSpacing: 9.0, // spacing between columns
                  ),
                  padding: const EdgeInsets.all(8.0), // padding around the grid
                  itemCount: 08, // total number of items
                  itemBuilder: (context, index) {
                    return OfferCards(
                      index: index,
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            right: 25,
            child: Padding(
              padding: const EdgeInsets.only(left: 05),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.add_box_outlined,
                  color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff475BE8),
                  minimumSize: const Size(170, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                label: const Text(
                  "Add Offer",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
