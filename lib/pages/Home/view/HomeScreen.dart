import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quik_broker_admin/Helper/constant/MenuWidget.dart';
import 'package:quik_broker_admin/pages/Chat/view/ChatPage.dart';
import '../../../Helper/constant/controller/MenuWidgetController.dart';

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
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  color: const Color.fromARGB(255, 13, 26, 67),
                  child: PageManagement(),
                ),
              ),
            ],
          );
        }
        return Container();
      }),
    );
  }
}

class PageManagement extends StatelessWidget {
  PageManagement({
    super.key,
  });
  final MenuWidgetController controller = Get.put(MenuWidgetController());
  @override
  Widget build(BuildContext context) {
    // return Obx(() => controller.pages[controller.pageIndex.value]);
    return const Chatpage();
  }
}
