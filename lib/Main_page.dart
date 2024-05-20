import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Buy_requests.dart';
import 'package:quik_broker_admin/Chat.dart';
import 'package:quik_broker_admin/Home_page.dart';
import 'package:quik_broker_admin/House_management_detail.dart';
import 'package:quik_broker_admin/House_managements.dart';
import 'package:quik_broker_admin/Login_page.dart';
import 'package:quik_broker_admin/Offer.dart';
import 'package:quik_broker_admin/Packer_requests.dart';
import 'package:quik_broker_admin/Push_notifications.dart';
import 'package:quik_broker_admin/Settings.dart';
import 'package:quik_broker_admin/Users.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedScreenIndex = 0;

  void _onSidebarItemTapped(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  final List<Widget> _screens = [
    // Replace these with your actual screens
    Home_page(),

    Buy_requests(),

    Packer_requests(),
    House_management(),

    Users(),

    Offer(),

    Push_notifications(),

    Chat(),

    Settings(),
  ];

  List<String> _sidebarItems = [
    'Dashboard',
    'Buy request',
    'Packer requests',
    'House/Land management',
    'User',
    'Offer',
    'Push Notifications',
    'Chat',
  ];
  final List<IconData> _sidebarIcons = [
    Icons.dashboard,
    Icons.request_page_outlined,
    Icons.money,
    Icons.house_outlined,
    Icons.person_2_outlined,
    Icons.sell_outlined,
    Icons.notifications_active_outlined,
    Icons.chat_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: width(context, 0.20),
            color: const Color.fromRGBO(4, 41, 58, 1),
            child: Column(
              children: [
                Container(
                  child: Expanded(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: _sidebarItems.length,
                            itemBuilder: (context, index) {
                              bool isSelected = _selectedScreenIndex == index;
                              Color backgroundColor = isSelected
                                  ? const Color.fromRGBO(236, 179, 101, 1)
                                  : Colors.transparent;
                              Color textColor = isSelected
                                  ? Color.fromRGBO(4, 41, 58, 1)
                                  : Colors.white;

                              return Container(
                                margin: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: backgroundColor,
                                ),
                                child: ListTile(
                                  leading: Icon(
                                    _sidebarIcons[index],
                                    color: textColor,
                                  ),
                                  title: Text(
                                    _sidebarItems[index],
                                    style: TextStyle(
                                      color: textColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  selected: isSelected,
                                  tileColor: backgroundColor,
                                  onTap: () {
                                    _onSidebarItemTapped(index);
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.settings_outlined,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Settings',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      _onSidebarItemTapped(8);
                    },
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(bottom: 30, top: 3, right: 3, left: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.logout_outlined,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Log out',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(child: _screens[_selectedScreenIndex]),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  final String label;
  final int value;

  ChartData(this.label, this.value);
}
