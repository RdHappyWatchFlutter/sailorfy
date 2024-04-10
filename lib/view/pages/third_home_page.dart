import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salorify/controller/dashboard_controller.dart';
import 'package:salorify/view/profile_screen.dart';

import '../../constant/responsive.dart';

class ThirdHomePage extends StatefulWidget {
  final String number;
  const ThirdHomePage({super.key, required this.number});

  @override
  State<ThirdHomePage> createState() => _ThirdHomePageState();
}

class _ThirdHomePageState extends State<ThirdHomePage> {
  final DashBoardController dashBoardController =
      Get.put(DashBoardController());
  @override
  Widget build(BuildContext context) {
    return Responsive(
      child: Column(
        children: [
          Expanded(
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: ProfileScreen(
                  number: widget.number,
                )),
          )
        ],
      ),
    );
  }
}
