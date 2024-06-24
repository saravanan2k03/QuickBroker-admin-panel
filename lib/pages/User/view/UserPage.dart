import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import '../../constant/widgets/CustomAppbar.dart';
import '../models/UserModel.dart';

// ignore: must_be_immutable
class UserPage extends StatelessWidget {
  UserPage({super.key});

  List<Usermodel> data = [
    Usermodel(
      UID: '123',
      AVATAR: "saravanan",
      Email: 'john.doe@example.com',
      MOBILENO: '1234567890',
      Name: 'saravanan',
    ),
    Usermodel(
      UID: '123',
      AVATAR: "saravanan",
      Email: 'john.doe@example.com',
      MOBILENO: '1234567890',
      Name: 'saravanan',
    ),
    Usermodel(
      UID: '123',
      AVATAR: "saravanan",
      Email: 'john.doe@example.com',
      MOBILENO: '1234567890',
      Name: 'saravanan',
    ),
  ];

  Future<List<Usermodel>> value() async {
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
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
                    "User",
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
          Container(
            width: width(context, 0.80),
            height: height(context, 0.75),
            decoration: BoxDecoration(
              color: const Color(0xffE0DFDF),
              borderRadius: BorderRadius.circular(15),
            ),
            child: SingleChildScrollView(child: buildDataTable()),
          )
        ],
      ),
    );
  }

  Widget buildDataTable() {
    final columns = [
      'UID',
      'AVATAR',
      'NAME',
      'EMAIL',
      'MOBILE NO',
    ];

    return FutureBuilder<List<Usermodel>>(
      future: value(), // Use the future containing your data
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: CircularProgressIndicator()),
              ],
            ),
          ); // Show a loading indicator while data is loading
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('No data available.'),
                ],
              ));
        } else {
          // teamcheck();
          return DataTable(
            // dataRowColor:
            //     MaterialStateColor.resolveWith((states) => Colors.lightGreen),
            columns: getColumns(columns),
            rows: getRows(snapshot.data!
                // .where((element) => element.teamName
                //     .toString()
                //     .toLowerCase()
                //     .contains(searchvalue.toLowerCase()))
                .toList()), // Pass the fetched data to getRows
          );
        }
      },
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      return DataColumn(
        label: Text(column),
      );
    }).toList();
  }

  List<DataRow> getRows(List<Usermodel> users) => users.map(
        (Usermodel user) {
          final cells = [
            // user.id,
            user.UID,
            user.AVATAR,
            user.Name,
            user.Email,
            user.MOBILENO
          ];

          return DataRow(
            cells: List.generate(cells.length, (index) {
              if (index == 1) {
                // Assuming AVATAR is the second column
                return const DataCell(
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage(
                            "images/useravatar.jpg"), // Assuming AVATAR is a URL
                        radius: 20,
                      ),
                    ],
                  ),
                );
              } else {
                final showEditIcon = index == 4;
                return DataCell(
                  Text(
                    cells[index],
                    style: const TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  showEditIcon: showEditIcon,
                  onTap: () async {
                    if (showEditIcon) {
                      await editParticipate(user);
                    }
                  },
                );
              }
            }),
          );
        },
      ).toList();

  editParticipate(user) {
    print(user);
  }
}
