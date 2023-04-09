import 'package:flutter/material.dart';
import 'package:flutter_app_starter/Features/Auth/auth_controller.dart';
import 'package:flutter_app_starter/SharedWidgets/no_network.dart';
import 'package:flutter_app_starter/ViewModels/start_view_model.dart';
import 'package:get/get.dart';

import '../../Features/MainController/main_controller.dart';
import '../../SharedWidgets/auto_load.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F7FC),
      body: GetBuilder<AuthController>(
        builder: (controller) => AutoLoad(
          onInit: controller.booting,
          child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Expanded(child: Container()),
                  Container(
                    alignment: Alignment.center,
                    child: Container(
                      child: Image.asset(
                        "assets/img/logo.png",
                        height: 70,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "بوابتك للشراء من الانترنت",
                      style: TextStyle(
                        fontFamily: 'Swissra-Normal',
                        color: Color(0xff5a5a5a),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircularProgressIndicator(
                          color: Color(0xff1c8e76),
                        ),
                        SizedBox(height: 40),
                        Text(
                          "Bowered by",
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(height: 15),
                        Image.asset(
                          "assets/img/cloudsoft.png",
                          height: 60,
                        ),
                        SizedBox(height: 40),
                      ],
                    ),
                  )),
                ],
              )),
        ),
      ),
    );
  }
}
