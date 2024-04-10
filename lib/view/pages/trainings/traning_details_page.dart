import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:salorify/controller/dashboard_controller.dart';
import 'package:salorify/controller/training_controller.dart';
import 'package:salorify/model/training_detail.dart';

import '../FirstTabScreens/thank_you_interest.dart';

class TrainingDetailsPage extends StatefulWidget {
  final String courseNo;
  final String courseName;
  final String isActive;
  const TrainingDetailsPage({super.key, required this.courseNo, required this.courseName, required this.isActive});


  @override
  State<TrainingDetailsPage> createState() => _TrainingDetailsPageState();
}

class _TrainingDetailsPageState extends State<TrainingDetailsPage> {
  final DashBoardController dashBoardController = Get.put(DashBoardController());
  final TrainingController trainingController = Get.put(TrainingController());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TrainingData>(
      future: trainingController.getTrainingDetail(widget.courseNo),
      builder: (context,AsyncSnapshot<TrainingData> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: Colors.blue[50],
            appBar: AppBar(
              backgroundColor: Colors.blue[50],
              title: Text(
                widget.courseName
              ),
              automaticallyImplyLeading: true,
            ),
            body: Center(
              child: LoadingAnimationWidget.prograssiveDots(color: Colors.orange.shade400, size: 20.0),
            ),
          );
        } else if (!snapshot.hasData || snapshot.hasError) {
          return Scaffold(
            backgroundColor: Colors.blue[50],
            appBar: AppBar(
              backgroundColor: Colors.blue[50],
              title: Text(
                  widget.courseName
              ),
              automaticallyImplyLeading: true,
            ),
            body: Center(
              child: LoadingAnimationWidget.prograssiveDots(color: Colors.orange.shade400, size: 20.0),
            ),
          );
        } else {
          final trainingData = snapshot.data;
          return Scaffold(
            backgroundColor: Colors.blue[50],
            appBar: AppBar(
              backgroundColor: Colors.blue[50],
              title: Text(
                  trainingData!.courseOffered
              ),
              automaticallyImplyLeading: true,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery
                      .of(context).size.height * 0.4,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              'https://sailorfy.searchosis.com${trainingData.courseAttachment}'),
                          fit: BoxFit.cover,
                          onError: (obj, stk) {
                            Center();
                          })),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        trainingData.courseOffered,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            height: 1),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 15),
                        child: Row(
                          children: [
                            Icon(Icons.house_outlined),
                            Text(
                              trainingData.instituteName,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          trainingData.courseDescription,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                              color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5.0),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                              width: 20,
                              alignment: Alignment.topLeft,
                              child: Icon(Icons.check_circle)),
                          title: Text('Duration', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),),
                          subtitle: Text(trainingData.courseDuration),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5.0),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                              width: 20,
                              alignment: Alignment.topLeft,
                              child: Icon(Icons.check_circle)),
                          title: Text('Cost', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),),
                          subtitle: Text(trainingData.instituteId),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5.0),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                              width: 20,
                              alignment: Alignment.topLeft,
                              child: Icon(Icons.check_circle)),
                          title: Text('Location', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),),
                          subtitle: Text(trainingData.courseDuration),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            bottomNavigationBar: widget.isActive == ''
                ? InkWell(
              onTap: () async {
                var response;
                dashBoardController.loading = true;
                showDialog(
                    context: context,
                    builder: (context) {
                      return Center(
                        child: LoadingAnimationWidget.prograssiveDots(
                            color: Colors.orange, size: 20.0),
                      );
                    }
                );
                try {
                  response = dashBoardController.enrollNow(
                    '',
                    trainingData.name,
                    trainingData.instituteId,
                  );
                  setState(() {

                  });
                } catch (e) {
                  print(e);
                  dashBoardController.loading = false;
                  Navigator.pop(context);
                  setState(() {

                  });
                }
                if (response != null) {
                  dashBoardController.loading = false;
                  Navigator.pop(context);
                  setState(() {

                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ThankYouInterest(),
                    ),
                  );
                } else {
                  dashBoardController.loading = false;
                  Navigator.pop(context);
                  setState(() {

                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(
                          'Something Went wrong'),
                        backgroundColor: Colors.red,));
                }
              },
              child: Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 10),
                height: 70,
                color: Colors.red.shade700,
                child: Text(
                  'Enroll Now',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            )
                : Container(),
          );
        }
      }
    );
  }
}
