import 'package:flutter/material.dart';
import 'package:flutter_app_starter/SharedWidgets/no_network.dart';
import 'package:flutter_app_starter/ViewModels/start_view_model.dart';
import 'package:get/get.dart';

import '../../Features/MainController/main_controller.dart';
import '../../SharedWidgets/auto_load.dart';
import '../../Widgets/bottom_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F7FC),
      body: GetBuilder<MainAppController>(
        builder: (controller) => AutoLoad(
          onInit: controller.loadData,
          child: Container(
            alignment: Alignment.center,
            child: controller.simpleList!.isLoading()
                ? Text("Loading")
                : controller.simpleList!.isLoadSuccess()
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: StartViewModel().messageList().length,
                        itemBuilder: (context, i) {
                          return ListTile(
                            title: Text(StartViewModel().messageList()[i].name),
                          );
                        },
                      )
                    // Text("${StartViewModel().listStatus()}")
                    : controller.simpleList!.isNoInternet()
                        ? NoNetwork(onInit: controller.loadData)
                        : Text("Faild"),
          ),
        ),
      ),
    );
  }
}
