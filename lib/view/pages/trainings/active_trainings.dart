import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:salorify/controller/dashboard_controller.dart';
import 'package:salorify/controller/training_controller.dart';

import '../../../model/training_list.dart';
import 'traning_details_page.dart';

class ActiveTrainings extends StatefulWidget {
  const ActiveTrainings({super.key});

  @override
  State<ActiveTrainings> createState() => _ActiveTrainingsState();
}

class _ActiveTrainingsState extends State<ActiveTrainings> {
  final DashBoardController dashBoardController = Get.put(DashBoardController());
  final TrainingController trainingController = Get.put(TrainingController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: FutureBuilder<List<TrainingList>>(
          future: trainingController.trainingList('Open'),
          builder: (context, AsyncSnapshot<List<TrainingList>> response) {
            if (!response.hasData || response.hasError) {
              return Container();
            } else {
              final data = response.data;
              return ListView.builder(
                itemCount: data!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index) {
                  return GestureDetector(
                    onTap: () {
                      if(data[index].courseId != '' && data[index].status != '') {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>
                            TrainingDetailsPage(
                              isActive: data[index].status,
                              courseNo: data[index].courseId,
                              courseName: data[index].courseName,
                            )));
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.transparent,
                      ),

                      child: Card(
                          color: Colors.white,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 120.0,
                                width: 70.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.grey.shade50)),
                                child: const Icon(Icons.sunny_snowing,
                                    color: Colors.yellow, size: 50.0),
                              ),
                              const SizedBox(width: 20.0),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Text(
                                    data[index].instituteName,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w900),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5),
                                    child: Text(
                                        dashBoardController.getDuration(
                                            data[index].endDate,
                                            data[index].startDate)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 30),
                                    child: RatingBar.builder(
                                      initialRating:
                                      data[index].courseRating == ''
                                          ? 1.0
                                          :
                                      data[index].courseRating,
                                      minRating: 1,
                                      itemSize: 12,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                  );
                }
              );
            }
          }),
    );
  }
}
