import 'package:flutter/material.dart';
import 'package:quik_broker_admin/pages/Offer/view/OfferPage.dart';
import 'package:quik_broker_admin/pages/constant/MenuWidget.dart';
import '../../User/view/UserPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          return Row(
            children: [
              Expanded(
                  child: Container(
                color: const Color.fromARGB(237, 4, 27, 101),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: MenuWidget(),
                ),
              )),
              Expanded(
                flex: 5,
                child: Container(
                    color: const Color.fromARGB(255, 13, 26, 67),
                    child: const PageManagement()),
              )
            ],
          );
        }
        return Container();
      }),
    );
  }
}

class PageManagement extends StatelessWidget {
  const PageManagement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Offerpage();
  }
}
