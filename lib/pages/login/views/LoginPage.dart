import 'package:flutter/material.dart';
import 'package:quik_broker_admin/pages/login/widgets/RightContainerForLogin.dart';
import '../widgets/LeftContainerForLogin.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const LeftContainer(),
          Expanded(
            child: Container(
              color: const Color(0xff455A64),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RightContainerForLogin(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
