import 'package:flutter/material.dart';
import 'package:flutter_app_starter/Features/Employee/employee_controller.dart';
import 'package:flutter_app_starter/SharedWidgets/empty_box.dart';
import 'package:flutter_app_starter/SharedWidgets/no_network.dart';
import 'package:flutter_app_starter/SharedWidgets/reload_inside.dart';
import 'package:flutter_app_starter/Utils/logout.dart';
import 'package:get/get.dart';

import '../../Features/Employee/employee_model.dart';
import '../../SharedWidgets/auto_load.dart';
import '../../SharedWidgets/something_wrong.dart';
import '../../Utils/loading_statud.dart';
import '../../Utils/screen_size.dart';
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
                    onInit: () {
                      controller.employeeList = EmployeeListModel.fromJson({
                        "status": LoadingStatus.NOT_STARTED,
                        "page": 1,
                        "last_page": 1,
                        "list": [],
                      });
                      controller.update();
                      controller.loadEmployeeList();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: controller.employeeList!.isLoading()
                          ? ReloadInside(
                              height: screenHeight(context, 128),
                            )
                          : controller.employeeList!.isLoadSuccess() ||
                                  controller.employeeList!.isSecondLoading()
                              ? Column(
                                  children: [
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: const ScrollPhysics(),
                                      itemCount:
                                          controller.employeeList!.list!.length,
                                      itemBuilder: (context, i) {
                                        return ListTile(
                                          title: Text(controller.employeeList!
                                                  .list![i].name ??
                                              "Empty"),
                                        );
                                      },
                                    ),
                                    Text(controller.employeeList?.last_page
                                            .toString() ??
                                        "0"),
                                    Text(controller.employeeList?.Count
                                            .toString() ??
                                        "0"),
                                    controller.employeeList!.isSecondLoading()
                                        ? CircularProgressIndicator()
                                        : ElevatedButton(
                                            onPressed: () {
                                              controller.loadEmployeeList();
                                            },
                                            child: Text("Next"))
                                  ],
                                )
                              : controller.employeeList!.isEmpty()
                                  ? EmptyBox(
                                      onInit: controller.loadEmployeeList,
                                      height: screenHeight(context, 128))
                                  : controller.employeeList!.isNoInternet()
                                      ? NoNetwork(
                                          onInit: controller.loadEmployeeList,
                                          height: screenHeight(context, 128))
                                      : SomethingWrong(
                                          onInit: controller.loadEmployeeList,
                                          height: screenHeight(context, 128),
                                        ),
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
