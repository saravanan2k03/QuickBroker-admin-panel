import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';

class GraphWidget extends StatefulWidget {
  final List<double> data;
  final double maxValue;

  const GraphWidget({Key? key, required this.data, required this.maxValue})
      : super(key: key);

  @override
  State<GraphWidget> createState() => _GraphWidgetState();
}

class _GraphWidgetState extends State<GraphWidget> {
  @override
  dynamic turn_over;
  List months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'June',
    'July',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  bool loading = false;
  get_data() async {
    setState(() {
      loading = true;
    });
    FirebaseFirestore.instance
        .collection('turn_over') // Replace with your collection name
        .doc(
            'turn_over') // Replace with the ID of the document you want to retrieve
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        // Check if the document exists
        var docData = documentSnapshot.data();
        // Access the specific field value// Replace with the name of the field you want to retrieve
        setState(() {
          turn_over = docData; // Update the state variable with the field value
        });
      }
    }).catchError((error) {
      // Handle any errors that occurred
      print("Error fetching data: $error");
    });
    setState(() {
      loading = false;
    });
  }

  initState() {
    super.initState();
    get_data();
  }

  Widget build(BuildContext context) {
    if (loading) {
      return const CircularProgressIndicator();
    } else if (turn_over == null) {
      return const Text("No data available");
    } else {
      // Use the turn_over data to build your widget
      // ...

      return Container(
        margin: EdgeInsets.only(
          left: width(context, 0.03),
          bottom: 30,
          right: width(context, 0.03),
        ),
        decoration: BoxDecoration(
          //color: Colors.black,
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(69, 90, 100, 1),
        ),
        // width: width(context, 0.60),
        height: height(context, 0.5),
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: GraphPainter(
                  context: context,
                  data: [
                    turn_over?['Jan'],
                    turn_over?['Feb'],
                    turn_over?['Mar'],
                    turn_over?['Apr'],
                    turn_over?['May'],
                    turn_over?['June'],
                    turn_over?['July'],
                    turn_over?['Aug'],
                    turn_over?['Sep'],
                    turn_over?['Oct'],
                    turn_over?['Nov'],
                    turn_over?['Dec']
                  ],
                  maxValue: 100000,
                  months: [
                    'Jan',
                    'Feb',
                    'Mar',
                    'Apr',
                    'May',
                    'June',
                    'July',
                    'Aug',
                    'Sep',
                    'Oct',
                    'Nov',
                    'Dec'
                  ],
                  heading1: 'Graph Heading 1',
                  heading2: 'Graph Heading 2',
                ),
              ),
            ),
            Positioned(
              top: 40,
              left: 0,
              child: Column(
                children: [
                  const Text(
                    'Total Turn Over',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${turn_over?[months[DateTime.now().month - 1]] - turn_over?[months[DateTime.now().month - 2]]}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 50,
              right: 0,
              child: Row(
                children: [
                  Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromRGBO(243, 115, 97, 1),
                    ),
                  ),
                  const Text(
                    '  Profit',
                    style: TextStyle(
                      color: Color.fromRGBO(236, 236, 236, 1),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}

class GraphPainter extends CustomPainter {
  final List<double> data;
  final double maxValue;
  final List<String> months;
  final String heading1;
  final String heading2;
  final BuildContext context;

  GraphPainter({
    required this.data,
    required this.maxValue,
    required this.months,
    required this.heading1,
    required this.heading2,
    required this.context,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final barPaint = Paint()
      ..color = const Color.fromRGBO(243, 115, 97, 1)
      ..style = PaintingStyle.fill;

    final margin = width(context, 0.035);
    final barWidth = 39.0;
    final graphHeight = size.height - 40;

    for (int i = 0; i < data.length; i++) {
      final barHeight = (data[i] / maxValue) * graphHeight;
      final startX = (barWidth + margin) * i;
      final endX = startX + barWidth;
      final barRect =
          Rect.fromLTRB(startX, graphHeight - barHeight, endX, graphHeight);

      canvas.drawRRect(
        RRect.fromRectAndCorners(
          barRect,
          topLeft: const Radius.circular(10.0),
          topRight: const Radius.circular(10.0),
        ),
        barPaint,
      );

      final textSpan = TextSpan(
        text: months[i],
        style: const TextStyle(
          color: Color.fromARGB(200, 20, 20, 20),
          fontSize: 12.0,
        ),
      );

      final textPainter = TextPainter(
        text: textSpan,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();
      final textX = startX + (barWidth / 2) - (textPainter.width / 2);
      final textY = graphHeight + 8;
      textPainter.paint(canvas, Offset(textX, textY));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
