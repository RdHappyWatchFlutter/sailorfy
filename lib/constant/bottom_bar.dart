import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:salorify/controller/dashboard_controller.dart';



class BottomBar extends StatelessWidget implements PreferredSizeWidget{
  final DashBoardController dashBoardController;
  BottomBar({super.key, required this.dashBoardController,});


  @override
  Widget build(BuildContext context) {

    return GetBuilder<DashBoardController>(
      builder: (controller) {
        return BottomNavigationBar(
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.document_scanner), label: 'Scanner'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'Profile'),
          ],
          showSelectedLabels: true,
          selectedFontSize: 13.0,
          selectedItemColor: Colors.red,
          selectedIconTheme: IconThemeData(color: Colors.red),
          useLegacyColorScheme: false,
          currentIndex: controller.currentIndex,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            print(index);
            controller.changeTab(index);
          },
        );
      }
    );

  }

  int currentIndex = 1;

  int get currentActiveIndex => dashBoardController.currentIndex;

  @override
  Size get preferredSize => Size.fromHeight(20.0.h);
}
