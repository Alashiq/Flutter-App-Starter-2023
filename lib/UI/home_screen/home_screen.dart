import 'package:flutter/material.dart';
import 'package:flutter_app_starter/Features/Court/court_controller.dart';
import 'package:flutter_app_starter/SharedWidgets/no_network.dart';
import 'package:flutter_app_starter/SharedWidgets/reload_inside.dart';
import 'package:flutter_app_starter/Utils/logout.dart';
import 'package:flutter_app_starter/ViewModels/start_view_model.dart';
import 'package:get/get.dart';

import '../../SharedWidgets/auto_load.dart';
import '../../SharedWidgets/something_wrong.dart';
import '../../Utils/screen_size.dart';
import '../../Widgets/bottom_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                child: GetBuilder<CourtController>(
                  builder: (controller) => AutoLoad(
                    onInit: controller.loadStatistic,
                    child: Container(
                      alignment: Alignment.center,
                      child: controller.statistic!.isLoading()
                          ? ReloadInside(
                              height: screenHeight(context, 128),
                            )
                          : controller.statistic!.isLoadSuccess()
                              ? DashboardList()
                              : controller.statistic!.isNoInternet()
                                  ? NoNetwork(
                                      onInit: controller.loadStatistic,
                                      height: screenHeight(context, 128),
                                    )
                                  : SomethingWrong(
                                      onInit: controller.loadStatistic,
                                      height: screenHeight(context, 128),
                                    ),
                    ),
                  ),
                ),
              ),
            ),
            BottomBar(activeId: 1),
          ],
        ),
      ),
    );
  }
}

class DashboardList extends StatelessWidget {
  const DashboardList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CourtController>(
      builder: (controller) => Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
            padding: EdgeInsets.fromLTRB(14, 10, 14, 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x43717171),
                  offset: Offset(0, 0),
                  blurRadius: 12,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.people,
                        color: Colors.green,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "الموظفين",
                        style: TextStyle(
                          fontFamily: 'Swissra-Medium',
                          fontSize: 15,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "${controller.statistic!.employees!.toString()}  موظف",
                      style: TextStyle(
                        color: Color(0xff5a5a5a),
                        fontFamily: 'Adelle',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
