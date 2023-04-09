import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_app_starter/Features/Auth/auth_controller.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneIn = TextEditingController();
    final passwordIn = TextEditingController();
    phoneIn.text = "0926503011";
    passwordIn.text = "123123";
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: GetBuilder<AuthController>(
          builder: (controller) => Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: phoneIn,
                ),
                TextField(
                  controller: passwordIn,
                ),
                ElevatedButton(
                    onPressed: () async {
                      bool data =
                          await controller.login(phoneIn.text, passwordIn.text);
                      if (data == true) {
                        phoneIn.clear();
                        passwordIn.clear();
                      }
                    },
                    child: Text("Login"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
