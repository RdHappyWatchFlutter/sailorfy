import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:salorify/controller/dashboard_controller.dart';
import 'package:salorify/view/static_app_bar.dart';
import 'package:salorify/view/training_list_page.dart';

import '../../constant/responsive.dart';

class FirstHomePage extends StatefulWidget {
  final String number;
  const FirstHomePage({super.key, required this.number});

  @override
  State<FirstHomePage> createState() => _FirstHomePageState();
}

class _FirstHomePageState extends State<FirstHomePage> {
  final DashBoardController dashBoardController = Get.put(DashBoardController());
  @override
  Widget build(BuildContext context) {
    return Responsive(
      child: Column(
        children: [
          Expanded(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: ListView(
                children: [
                  SizedBox(
                    height: 25.0.h,
                    width: 100.0.w,
                    child: Card(
                      color: Colors.transparent,
                      elevation: 0.0,
                      child: ListView(
                        padding: EdgeInsets.all(5.0),
                        scrollDirection: Axis.horizontal,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => TrainingListPage(
                                number: widget.number,
                                dashBoardController: dashBoardController,
                              )));
                            },
                            child: Container(
                              width: 40.0.w,
                              margin: EdgeInsets.symmetric(vertical: 2.0.h,horizontal: 1.0.w),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.orange,
                                        Colors.orangeAccent,
                                      ]
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Trainings',style: TextStyle(
                                        color: Colors.white,
                                      ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Icon(Icons.model_training,
                                        size: 40.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 40.0.w,
                            margin: EdgeInsets.symmetric(vertical: 2.0.h,horizontal: 1.0.w),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.blueAccent,
                                      Colors.lightBlueAccent,
                                    ]
                                ),
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Certificates',style: TextStyle(
                                      color: Colors.white,
                                    ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Icon(Icons.add_comment,
                                      size: 40.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 40.0.w,
                            margin: EdgeInsets.symmetric(vertical: 2.0.h,horizontal: 1.0.w),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.redAccent,
                                      Colors.red.shade200,
                                    ]
                                ),
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Verification',style: TextStyle(
                                      color: Colors.white,
                                    ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Icon(Icons.model_training,
                                      size: 40.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 40.0.w,
                            margin: EdgeInsets.symmetric(vertical: 2.0.h,horizontal: 1.0.w),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.green.shade300,
                                      Colors.lightGreen.shade200,
                                    ]
                                ),
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Community',style: TextStyle(
                                      color: Colors.white,
                                    ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Icon(Icons.people_sharp,
                                      size: 40.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 15.0.h,
                      width: 100.0.w,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.transparent,
                          elevation: 0.0,
                          child: ListView(
                            children: [
                              Text(
                                'Active Trainings',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                              ),

                            ],
                          ),
                        ),
                      )
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
