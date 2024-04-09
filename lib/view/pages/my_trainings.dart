import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:salorify/controller/dashboard_controller.dart';
import 'package:salorify/model/all_training_list_model.dart';
import 'package:salorify/view/pages/FirstTabScreens/traning_details_page.dart';

class MyTrainings extends StatefulWidget {
  final String number;
  const MyTrainings({super.key, required this.number});

  @override
  State<MyTrainings> createState() => _MyTrainingsState();
}

class _MyTrainingsState extends State<MyTrainings> with TickerProviderStateMixin{
  final DashBoardController dashBoardController = Get.put(DashBoardController());
  @override
  void initState() {
    dashBoardController.tabController = TabController(length: 3, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[50],
        title: Text(
          'Trainings',style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),

        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10.0.h),
          child: TabBar(
            controller: dashBoardController.tabController,
            tabs: [
              Tab(
                text: 'All',
              ),
              Tab(
                text: 'Ongoing',
              ),
              Tab(
                text: 'History',
              ),
            ],
          ),
        ),
      ),
      body:  TabBarView(
        controller: dashBoardController.tabController,
        children: [
          FutureBuilder<List<AllTrainingList>>(
              future: dashBoardController.getAllTrainingList(widget.number),
              builder:
                  (context, AsyncSnapshot<List<AllTrainingList>> response) {
                if (!response.hasData || response.hasError) {
                  return ListView.builder(
                    itemCount: 1, // Example itemCount
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 140,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: LoadingAnimationWidget.prograssiveDots(color: Colors.orange, size: 20.0),
                        ),
                      );
                    },
                  );
                } else {
                  final data = response.data;
                  return SizedBox(
                    height: 400,
                    child: ListView.builder(
                      itemCount: data!.length, // Example itemCount
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 10.0),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                           /* Navigator.push(context, MaterialPageRoute(
                                builder: (context)=> TraningDetailsPage(
                                    allTrainingList : data[index]
                                )));*/
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 140,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Card(
                                color: Colors.white,
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 120.0,
                                      width: 70.0,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  'https://sailorfy.searchosis.com' + '/files/inno.png' ),
                                              fit: BoxFit.cover,
                                              onError: (obj, stk) {
                                                Center();
                                              }),
                                          border: Border.all(
                                              color: Colors.grey.shade100,
                                              width: 1.0)),
                                    ),
                                    SizedBox(width: 20.0),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data[index].courseOffered,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                          Text(dashBoardController.getDuration(data[index].startDate,data[index].startDate)),
                                          RatingBar.builder(
                                            initialRating: 1.0,
                                            minRating: 1,
                                            itemSize: 12,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemBuilder: (context, _) =>
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        );
                      },
                    ),
                  );
                }
              }),
          FutureBuilder<List<AllTrainingList>>(
              future: dashBoardController.getOnGoingTrainingList(widget.number),
              builder:
                  (context, AsyncSnapshot<List<AllTrainingList>> response) {
                if (!response.hasData || response.hasError) {
                  return ListView.builder(
                    itemCount: 1, // Example itemCount
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 140,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: LoadingAnimationWidget.prograssiveDots(color: Colors.orange, size: 20.0),
                        ),
                      );
                    },
                  );
                } else {
                  final data = response.data;
                  return SizedBox(
                    height: 400,
                    child: ListView.builder(
                      itemCount: data!.length, // Example itemCount
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 10.0),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                           /* Navigator.push(context, MaterialPageRoute(
                                builder: (context)=> TraningDetailsPage(
                                    allTrainingList : data[index]
                                )));*/
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 140,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Card(
                                color: Colors.white,
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 120.0,
                                      width: 70.0,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  'https://sailorfy.searchosis.com' + '/files/inno.png' ),
                                              fit: BoxFit.cover,
                                              onError: (obj, stk) {
                                                Center();
                                              }),
                                          border: Border.all(
                                              color: Colors.grey.shade100,
                                              width: 1.0)),
                                    ),
                                    SizedBox(width: 20.0),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data[index].instituteName,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                          Text(dashBoardController.getDuration(data[index].startDate,data[index].startDate)),
                                          RatingBar.builder(
                                            initialRating: 1.0,
                                            minRating: 1,
                                            itemSize: 12,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemBuilder: (context, _) =>
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        );
                      },
                    ),
                  );
                }
              }),
          FutureBuilder<List<AllTrainingList>>(
              future: dashBoardController.getHistoryTrainingList(widget.number),
              builder:
                  (context, AsyncSnapshot<List<AllTrainingList>> response) {
                if (!response.hasData || response.hasError) {
                  return ListView.builder(
                    itemCount: 1, // Example itemCount
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 140,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      );
                    },
                  );
                } else {
                  final data = response.data;
                  return SizedBox(
                    height: 400,
                    child: ListView.builder(
                      itemCount: data!.length, // Example itemCount
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 10.0),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                          /*  Navigator.push(context, MaterialPageRoute(
                                builder: (context)=> TraningDetailsPage(
                                    allTrainingList : data[index]
                                )));*/
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 140,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Card(
                                color: Colors.white,
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 120.0,
                                      width: 70.0,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  'https://sailorfy.searchosis.com' + '/files/inno.png' ),
                                              fit: BoxFit.cover,
                                              onError: (obj, stk) {
                                                Center();
                                              }),
                                          border: Border.all(
                                              color: Colors.grey.shade100,
                                              width: 1.0)),
                                    ),
                                    SizedBox(width: 20.0),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data[index].instituteName,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                          Text(dashBoardController.getDuration(data[index].startDate,data[index].startDate)),
                                          RatingBar.builder(
                                            initialRating: 1.0,
                                            minRating: 1,
                                            itemSize: 12,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemBuilder: (context, _) =>
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        );
                      },
                    ),
                  );
                }
              }),
        ],
      )
    );
  }
}
