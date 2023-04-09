import 'package:flutter/material.dart';
import 'package:flutter_app_starter/Features/Auth/auth_controller.dart';
import 'package:flutter_app_starter/Widgets/bottom_bar.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: Color(0xffF6F7FC),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: GetBuilder<AuthController>(
                  builder: (controller) => Container(
                    height: 800,
                    color: Colors.orange,
                    alignment: Alignment.center,
                    child: Text(controller.user!.firstname!),
                  ),
                ),
              ),
            ),
            BottomBar(activeId: 4),
          ],
        ),
      ),
    );
  }
}
