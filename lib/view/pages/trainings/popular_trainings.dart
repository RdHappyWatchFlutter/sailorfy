import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:salorify/controller/dashboard_controller.dart';
import 'package:salorify/controller/training_controller.dart';
import 'package:salorify/model/popular_training_list_model.dart';

import '../../../model/training_list.dart';
import 'traning_details_page.dart';

class PopularTraining extends StatefulWidget {
  const PopularTraining({super.key});

  @override
  State<PopularTraining> createState() => _PopularTrainingState();
}

class _PopularTrainingState extends State<PopularTraining> {
  final DashBoardController dashBoardController = Get.put(DashBoardController());
  final TrainingController trainingController = Get.put(TrainingController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      child: FutureBuilder<List<PopularTrainingList>>(
          future: trainingController.getPopularTrainingList(),
          builder: (context, AsyncSnapshot<List<PopularTrainingList>> response) {
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
                      print(data[index].name);
                      print(data[index].courseOffered);
                      if(data[index].name != '') {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>
                            TrainingDetailsPage(
                              isActive: 'Popular',
                              courseNo: data[index].name,
                              courseName: data[index].courseOffered,
                            )));
                      }
                    },
                    child: SizedBox(
                      height: 200,
                      child: ListView.builder(
                        itemCount: data.length, // Example itemCount
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        // physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: 140,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                      'https://sailorfy.searchosis.com' +
                                          '/files/inno.png'
                                              .toString())),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
              );
            }
          }),
    );
  }
}
