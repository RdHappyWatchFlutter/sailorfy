import 'package:flutter/material.dart';
import 'package:salorify/controller/dashboard_controller.dart';
import 'package:salorify/view/static_app_bar.dart';

import '../constant/responsive.dart';

class TrainingListPage extends StatefulWidget {
  final DashBoardController dashBoardController;
  final String number;
  const TrainingListPage({super.key, required this.dashBoardController, required this.number});

  @override
  State<TrainingListPage> createState() => _TrainingListPageState();
}

class _TrainingListPageState extends State<TrainingListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Responsive(
        child: Column(
          children: [
            StaticAppBar(dashBoardController: widget.dashBoardController,number: widget.number),
            Expanded(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
