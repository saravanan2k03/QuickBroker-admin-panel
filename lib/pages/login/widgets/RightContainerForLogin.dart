import 'package:flutter/material.dart';
import 'package:quik_broker_admin/Helper/app_setting.dart';
import 'package:quik_broker_admin/pages/login/widgets/CustomTextFieldForLogin.dart';

class RightContainerForLogin extends StatelessWidget {
  const RightContainerForLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context, 0.70),
      width: width(context, 0.30),
      // color: Colors.red,
      child: Column(
        children: [
          const Text(
            "LOGIN",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(
            height: height(context, 0.06),
          ),
          SizedBox(
            width: width(context, 0.20),
            // height: height(context, 0.20),
            // color: Colors.green,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hello!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: height(context, 0.02),
                ),
                const Text(
                  "Welcome!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: height(context, 0.05),
                ),
                const CustomTextFieldForLogin(
                  hinttext: "Email",
                  textIcon: Icon(Icons.email),
                ),
                SizedBox(
                  height: height(context, 0.03),
                ),
                const CustomTextFieldForLogin(
                  hinttext: "Password",
                  textIcon: Icon(Icons.lock),
                ),
                SizedBox(
                  height: height(context, 0.03),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffE8AA54),
                    minimumSize: const Size(320, 70),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: height(context, 0.03),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "Forgot Password",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
