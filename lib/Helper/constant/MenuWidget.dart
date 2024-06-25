import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import 'package:quik_broker_admin/Helper/constant/controller/MenuWidgetController.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final MenuWidgetController controller = Get.put(MenuWidgetController());
    return Padding(
        padding: const EdgeInsets.only(right: 18.0),
        child: Obx(
          () => Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // color: Colors.blue,
                      width: height(context, 0.20),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'QuickBroker',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.arrow_circle_down_outlined,
                            color: Colors.white,
                            weight: 0.1,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // dashboard_outlined
              InkWell(
                onTap: () {
                  controller.changeIndex(RxInt(0));
                },
                child: CustomTabbar(
                  enabled: controller.pageIndex.value == 0,
                  name: "DashBoard",
                  icon: Icon(
                    Icons.dashboard_outlined,
                    color: controller.pageIndex.value == 0
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ExpansionPanelList.radio(
                    expandIconColor: controller.isexpanded.value
                        ? Colors.black
                        : Colors.white,
                    expansionCallback: (panelIndex, isExpanded) {
                      controller.isexpandedwidget(RxBool(isExpanded));
                    },
                    children: [
                      ExpansionPanelRadio(
                        backgroundColor: controller.isexpanded.value
                            ? Colors.white
                            : const Color.fromARGB(237, 4, 27, 101),
                        value: "saro",
                        headerBuilder: ((context, isExpanded) {
                          return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 05),
                                  // child: Icon(
                                  //   Icons.money,
                                  //   color: controller.isexpanded.value
                                  //       ? Colors.black
                                  //       : Colors.white,
                                  // ),
                                  child: SvgPicture.asset(
                                    "images/customer_request_svg.svg",
                                    height: 15,
                                    width: 15,
                                    colorFilter: const ColorFilter.mode(
                                        Colors.red, BlendMode.srcIn),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 11),
                                  child: Container(
                                    width: width(context, 0.08),
                                    child: Text(
                                      'Customer Request',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.011,
                                        color: controller.isexpanded.value
                                            ? Colors.black
                                            : Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                // Text("600/700"),
                              ]);
                        }),
                        body: Column(
                          children: [
                            InkWell(
                              hoverColor: Colors.yellow,
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {
                                controller.changeIndex(RxInt(1));
                              },
                              child: Container(
                                color: controller.pageIndex.value == 1
                                    ? Colors.yellow
                                    : null,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Buy Request',
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.011,
                                          color: controller.isexpanded.value
                                              ? Colors.black
                                              : Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              hoverColor: Colors.yellow,
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {
                                controller.changeIndex(RxInt(2));
                              },
                              child: Container(
                                color: controller.pageIndex.value == 2
                                    ? Colors.yellow
                                    : null,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Packer Request',
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.011,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.changeIndex(RxInt(3));
                },
                child: CustomTabbar(
                  enabled: controller.pageIndex.value == 3,
                  name: "House Management",
                  icon: Icon(
                    Icons.house_outlined,
                    color: controller.pageIndex.value == 3
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.changeIndex(RxInt(4));
                },
                child: CustomTabbar(
                  enabled: controller.pageIndex.value == 4,
                  name: "User",
                  icon: Icon(
                    Icons.person_2_outlined,
                    color: controller.pageIndex.value == 4
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.changeIndex(RxInt(5));
                },
                child: CustomTabbar(
                  enabled: controller.pageIndex.value == 5,
                  name: "Offer",
                  icon: Icon(
                    Icons.sell_outlined,
                    color: controller.pageIndex.value == 5
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.changeIndex(RxInt(6));
                },
                child: CustomTabbar(
                  enabled: controller.pageIndex.value == 6,
                  name: "Push Notification",
                  icon: Icon(
                    Icons.notifications_active_outlined,
                    color: controller.pageIndex.value == 6
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class CustomTabbar extends StatelessWidget {
  final String name;
  final Icon icon;
  final bool enabled;
  const CustomTabbar({
    super.key,
    required this.name,
    required this.icon,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: height(context, 0.07),
        width: width(context, 0.25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: enabled ? Colors.yellow : null,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: icon,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 02),
              child: Container(
                // color: Colors.blue,
                width: width(context, 0.10),
                child: Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: enabled ? Colors.black : Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.011,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
