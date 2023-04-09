import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBar extends StatelessWidget {
  final int activeId;
  const BottomBar({super.key, required this.activeId});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 72,
      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomBarItem(
            icon: Icons.home_outlined,
            name: "الرئيسية",
            route: "/home",
            active: activeId == 1 ? true : false,
          ),
          BottomBarItem(
            icon: Icons.map_outlined,
            name: "الخريطة",
            route: "/home",
            active: activeId == 2 ? true : false,
          ),
          BottomBarItem(
            icon: Icons.people_alt_outlined,
            name: "الموظفين",
            route: "/employee",
            active: activeId == 3 ? true : false,
          ),
          BottomBarItem(
            icon: Icons.person_4_outlined,
            name: "حسابي",
            route: "/profile",
            active: activeId == 4 ? true : false,
          ),
        ],
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final String route;
  final bool active;
  const BottomBarItem(
      {super.key,
      required this.name,
      required this.icon,
      required this.route,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => Get.offNamed("${route}"),
        child: Container(
          padding: EdgeInsets.only(top: 8),
          child: Column(
            children: [
              Icon(
                icon,
                color: active ? Colors.blue : Color(0XFF7A7A7A),
                size: 27,
              ),
              SizedBox(height: 2),
              Text(
                "${name}",
                style: TextStyle(
                  color: active ? Colors.blue : Color(0XFF7A7A7A),
                  fontFamily: 'Swissra-Normal',
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
