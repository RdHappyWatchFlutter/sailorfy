import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:salorify/controller/dashboard_controller.dart';
import 'package:salorify/view/static_app_bar.dart';
import 'package:salorify/view/pages/FirstTabScreens/training_list_page.dart';

import '../../constant/responsive.dart';

class SecondHomePage extends StatefulWidget {
  final String number;
  const SecondHomePage({super.key, required this.number});

  @override
  State<SecondHomePage> createState() => _SecondHomePageState();
}

class _SecondHomePageState extends State<SecondHomePage> {
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
                body: Container(
                  color: Colors.red,
                )),
          )
        ],
      ),
    );
  }
}
