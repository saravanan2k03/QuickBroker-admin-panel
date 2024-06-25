import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';

class OfferCards extends StatelessWidget {
  final int index;
  const OfferCards({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffE0DFDF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: height(context, 0.25),
              width: width(context, 0.20),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(
            height: 05,
          ),
          Row(
            children: [
              const SizedBox(
                width: 12,
              ),
              Text(
                "Offer ${index.toString()}",
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: const Size(145, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Delete",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: const Size(145, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Update",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
