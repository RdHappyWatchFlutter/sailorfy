import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:salorify/controller/dashboard_controller.dart';
import 'package:salorify/model/active_training_list_model.dart';
import 'package:salorify/model/top_employers_list_model.dart';
import 'package:salorify/model/training_list_data_model.dart';
import 'package:salorify/view/pages/FirstTabScreens/training_list_page.dart';

import '../../../widget/reusible_training.dart';
import 'certificate_list.dart';
import 'traning_details_page.dart';
import 'verification_page.dart';

class FirstHomePage extends StatefulWidget {
  final String number;

  const FirstHomePage({Key? key, required this.number}) : super(key: key);

  @override
  State<FirstHomePage> createState() => _FirstHomePageState();
}

class _FirstHomePageState extends State<FirstHomePage> {
  final DashBoardController dashBoardController =
      Get.put(DashBoardController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Your Heading Here',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 200, // Adjust height as needed
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ReusableTraining(
                    title: 'Trainings',
                    icon: Icons.model_training,
                    gradientColors: [Colors.orange, Colors.orangeAccent],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TrainingListPage(
                            number: widget.number,
                            dashBoardController: dashBoardController,
                          ),
                        ),
                      );
                    },
                  ),
                  ReusableTraining(
                    title: 'Certificates',
                    icon: Icons.add_comment,
                    gradientColors: [Colors.blueAccent, Colors.lightBlueAccent],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CertificateList(),
                        ),
                      );
                    },
                  ),
                  ReusableTraining(
                    title: 'Verification',
                    icon: Icons.model_training,
                    gradientColors: [Colors.redAccent, Colors.red.shade200],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerificationPage(),
                        ),
                      );
                    },
                  ),
                  ReusableTraining(
                    title: 'Community',
                    icon: Icons.people_sharp,
                    gradientColors: [
                      Colors.green.shade300,
                      Colors.lightGreen.shade200
                    ],
                    onTap: () {
                      // Add your onTap logic here
                    },
                  ),
                  // Other ReusableTraining widgets here
                ],
              ),
            ),
            FutureBuilder<List<ActiveTrainingList>>(
              future: dashBoardController.getActiveTrainingList(),
              builder: (context,AsyncSnapshot<List<ActiveTrainingList>> response) {
                if(!response.hasData || response.hasError){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Active Training',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TraningDetailsPage(number: widget.number),
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 140,
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                              child: LoadingAnimationWidget.prograssiveDots(color: Colors.black, size: 20.0)),
                        ),
                      ),
                    ],
                  );
                }else{
                  final data = response.data![0];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Active Training',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TraningDetailsPage(number: widget.number),
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 140,
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(10.0),
                          ),

                          child: Card(
                            color: Colors.white,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 120.0,
                                  width: 70.0,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.grey.shade50)
                                  ),
                                  child: Icon(Icons.sunny_snowing,color: Colors.yellow,size: 50.0),
                                ),
                                SizedBox(width: 20.0),
                                Column(
                                  children: [
                                    Text(data.instituteName,
                                      style: TextStyle(fontWeight: FontWeight.w900),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    Text(dashBoardController.getDuration(data.endDate,data.startDate)),
                                    RatingBar.builder(
                                      initialRating: data.courseRating == '' ? 1.0 : double.parse(data.courseRating),
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
                                    )
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                )
                              ],
                            )
                          ),
                        ),
                      ),
                    ],
                  );
                }

              }
            ),
            FutureBuilder<List<TrainingList>>(
              future: dashBoardController.getPopularTrainingList(),
              builder: (context,AsyncSnapshot<List<TrainingList>> response) {
                if(!response.hasData || response.hasError){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Popular Training',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          itemCount: 4, // Example itemCount
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
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }else{
                  final data = response.data![0];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Popular Training',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          itemCount: 4, // Example itemCount
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
                                      'https://sailorfy.searchosis.com'+data.courseAttachment.toString()
                                  )
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }

              }
            ),
            FutureBuilder<List<TopEmployersList>>(
              future: dashBoardController.getTopEmployersList(),
              builder: (context,AsyncSnapshot<List<TopEmployersList>> response) {
                if(!response.hasData || response.hasError){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Top Employers',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListView.builder(
                        itemCount: 2, // Example itemCount
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
                      ),
                    ],
                  );
                }else{
                  final data = response.data;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Top Employers',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 400,
                        child: ListView.builder(
                          itemCount: data!.length, // Example itemCount
                          shrinkWrap: true,

                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {

                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 140,
                                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                                decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(10.0),
                                ),

                                child: Card(
                                    color: Colors.white,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 120.0,
                                          width: 70.0,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: CachedNetworkImageProvider('https://sailorfy.searchosis.com'+data[index].pic),
                                                  fit: BoxFit.cover,
                                                  onError: (obj,stk){
                                                    Center();
                                                  }
                                              ),
                                              border: Border.all(color: Colors.grey.shade100,width: 1.0)
                                          ),
                                        ),
                                        SizedBox(width: 20.0),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(data[index].fullName,
                                                style: TextStyle(fontWeight: FontWeight.w900),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                              Text(data[index].city),
                                              RatingBar.builder(
                                                initialRating: 1.0,
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
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }

              }
            ),


          ],
        ),
      ),
    );
  }
}
