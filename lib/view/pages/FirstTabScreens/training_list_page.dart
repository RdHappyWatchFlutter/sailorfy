import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:salorify/controller/dashboard_controller.dart';
import 'package:salorify/model/training_list_data_model.dart';
import 'package:salorify/view/static_app_bar.dart';

import '../../../constant/responsive.dart';

class TrainingListPage extends StatefulWidget {
  final DashBoardController dashBoardController;
  final String number;

  const TrainingListPage(
      {Key? key, required this.dashBoardController, required this.number})
      : super(key: key);

  @override
  State<TrainingListPage> createState() => _TrainingListPageState();
}

class _TrainingListPageState extends State<TrainingListPage> {
  final List categoryList = [
    "Design",
    "Marine Tech",
    "Business",
    "Marine Catering",
    "Marine Engineering",
  ];
  Widget _buildTrainingListView(String title, List<TrainingList> data) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              itemCount: data.length, // Example itemCount
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              // physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return _buildTrainingCard(
                  data[index].name,
                  data[index].courseDuration,
                  data[index].courseRating ?? 1.0,
                  data[index].courseAttachment ?? '',
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrainingCard(
    String name,
    String duration,
    double rating,
    String image,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 135,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: const CachedNetworkImageProvider(
                        'https://sailorfy.searchosis.com' + '/files/inno.png'),
                    fit: BoxFit.cover,
                    onError: (obj, stk) {
                      Center();
                    })),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 5,
            ),
            child: Text(
              name,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              maxLines:
                  3, // Change this to the number of lines you want to show
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              duration,
              style: const TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          ),
          RatingBar.builder(
            initialRating: rating,
            minRating: 1,
            itemSize: 12,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Responsive(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              StaticAppBar(
                  dashBoardController: widget.dashBoardController,
                  number: widget.number),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Wrap(
                  children: categoryList
                      .map(
                        (item) => Container(
                          margin: EdgeInsets.all(4), // Adjust margin as needed
                          padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6), // Adjust padding as needed
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey), // Border color
                            borderRadius:
                                BorderRadius.circular(20), // Border radius
                          ),
                          child: Text(item),
                        ),
                      )
                      .toList(),
                ),
              ),
              FutureBuilder<List<TrainingList>>(
                  future: widget.dashBoardController.getTrainingList(),
                  builder:
                      (context, AsyncSnapshot<List<TrainingList>> response) {
                    if (!response.hasData || response.hasError) {
                      return Center(
                          child: LoadingAnimationWidget.prograssiveDots(
                              color: Colors.black, size: 20.0));
                    } else {
                      final list = response.data;
                      return _buildTrainingListView('Popular Training', list!);
                    }
                  }),
              FutureBuilder<List<TrainingList>>(
                  future: widget.dashBoardController.getPopularTrainingList(),
                  builder:
                      (context, AsyncSnapshot<List<TrainingList>> response) {
                    if (!response.hasData || response.hasError) {
                      return Center(
                          child: LoadingAnimationWidget.prograssiveDots(
                              color: Colors.black, size: 20.0));
                    } else {
                      final list = response.data;
                      return _buildTrainingListView('Marine Training', list!);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
