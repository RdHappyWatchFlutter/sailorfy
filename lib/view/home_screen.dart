import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:salorify/constant/bottom_bar.dart';
import 'package:salorify/controller/dashboard_controller.dart';
import 'package:salorify/view/pages/FirstTabScreens/first_home_page.dart';
import 'package:salorify/view/pages/second_home_page.dart';
import 'package:salorify/view/pages/third_home_page.dart';
import 'package:salorify/view/static_app_bar.dart';

class HomeScreen extends StatefulWidget {
  final String number;
  const HomeScreen({super.key, required this.number});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DashBoardController dashBoardController =
      Get.put(DashBoardController());

  @override
  void initState() {
    dashBoardController.currentPage = FirstHomePage(
      number: widget.number,
    );

    dashBoardController.pages = <Widget>[
      FirstHomePage(number: widget.number),
      SecondHomePage(number: widget.number),
      ThirdHomePage(number: widget.number),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: GetBuilder<DashBoardController>(
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(22.0.h),
              child: StaticAppBar(
                  number: widget.number, dashBoardController: controller),
            ),
            body: controller.currentPage,
          );
        },
      ),
      bottomNavigationBar: BottomBar(dashBoardController: dashBoardController),
    );
  }
}
