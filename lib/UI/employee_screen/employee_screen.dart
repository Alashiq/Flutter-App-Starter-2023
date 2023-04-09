import 'package:flutter/material.dart';
import 'package:flutter_app_starter/Features/Employee/employee_controller.dart';
import 'package:flutter_app_starter/SharedWidgets/no_network.dart';
import 'package:flutter_app_starter/Utils/logout.dart';
import 'package:get/get.dart';

import '../../SharedWidgets/auto_load.dart';
import '../../Widgets/bottom_bar.dart';

class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("الرئيسية"),
          actions: [
            IconButton(
                onPressed: () {
                  Logout().logout();
                },
                icon: Icon(Icons.logout))
          ],
        ),
        backgroundColor: Color(0xffF6F7FC),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: GetBuilder<EmployeeController>(
                  builder: (controller) => AutoLoad(
                    onInit: controller.loadEmployeeList,
                    child: Container(
                      alignment: Alignment.center,
                      child: controller.employeeList!.isLoading()
                          ? Text("Loading")
                          : controller.employeeList!.isLoadSuccess()
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  itemCount:
                                      controller.employeeList!.list!.length,
                                  itemBuilder: (context, i) {
                                    return ListTile(
                                      title: Text(controller
                                              .employeeList!.list![i].name ??
                                          "Empty"),
                                    );
                                  },
                                )
                              : controller.employeeList!.isEmpty()
                                  ? Text("Empty")
                                  : controller.employeeList!.isNoInternet()
                                      ? NoNetwork(
                                          onInit: controller.loadEmployeeList)
                                      : Text("Faild"),
                    ),
                  ),
                ),
              ),
            ),
            BottomBar(activeId: 3),
          ],
        ),
      ),
    );
  }
}
